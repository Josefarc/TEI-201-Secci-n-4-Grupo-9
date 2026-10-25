# Software - Documentación

## Contenido
Esta carpeta contiene el código y la documentación del software de SafeRest.

### 📁 Carpetas

#### `src/`
Código fuente (.ino para Arduino):
- `mat/`: programa del mat (detecta el paso y envía la alerta)
- `control/`: programa del control (buzzer y botón)
- `calibracion/`: calibración de las celdas de carga
- `mac/`: lectura de la dirección MAC de cada placa

#### `librerias/`
Notas sobre las librerías necesarias. No se incluyen archivos, porque se instalan desde el Arduino IDE (ver `FUENTES.md`).

#### `docs/`
Documentación técnica del software.

---

## Stack Tecnológico

**Plataforma:** Arduino / ESP8266 (Wemos D1 y Wemos D1 Mini)  
**Lenguaje:** C/C++  
**IDE:** Arduino IDE 2.x  
**Placa en el IDE:** `LOLIN(WEMOS) D1 R2 & mini`  
**Librerías principales:**
- HX711 (bogde) - versión 0.7.5
- ESP8266 Arduino Core (incluye ESP8266WiFi y espnow) - versión 3.1.2

---

## Instalación y Configuración

### 1. Instalar Arduino IDE
Descargar la versión 2.x desde https://www.arduino.cc/en/software

### 2. Configurar las placas ESP8266
En Arduino IDE: Preferencias → agregar la URL del gestor de placas del ESP8266 → Gestor de Placas → instalar "esp8266".

### 3. Instalar Librerías
Gestor de Librerías → buscar "HX711" (autor: bogde) → Instalar.

### 4. Cargar Código
1. Abrir el programa correspondiente en `src/` (por ejemplo `src/mat/mat.ino`).
2. Seleccionar la placa `LOLIN(WEMOS) D1 R2 & mini` y el puerto.
3. Compilar y subir.

---

## Configuración de Parámetros

Editar las siguientes constantes en `src/mat/mat.ino`:

```cpp
// Calibración
const float FACTOR_ESCALA = 11150.0;   // obtenido con calibracion.ino
const float UMBRAL_KG = 1.0;           // peso mínimo para activar la alerta (valor de prueba)

// Detección
const unsigned long CONFIRMA_MS = 300; // tiempo que el peso debe mantenerse
const unsigned long REPOSO_MS = 8000;  // espera mínima entre alertas

// Comunicación
uint8_t macControl[] = {...};          // MAC del control
const uint8_t CANAL = 1;               // mismo canal en mat y control
```

En `src/control/control.ino` se debe escribir la MAC del mat en `macMat`.

> **Nota:** `UMBRAL_KG = 1.0` es un valor de prueba para la iteración 1. Se ajustará con el testing en uso real.

---

## Calibración del Mat

El mat necesita dos valores: el cero (lectura con el mat vacío) y el factor de escala (cuánto vale la lectura por cada kilo). Se obtienen con `src/calibracion/calibracion.ino`:

1. **Cero (tara):** con el mat vacío y quieto, cargar `calibracion.ino` en el Wemos D1 del mat. Al iniciar, el programa toma el valor de vacío y lo fija como cero.
2. **Peso conocido:** poner sobre el mat un peso de valor conocido (por ejemplo, una botella de 2 kg o un peso de 6,5 kg) y leer en el monitor serie la "lectura cruda".
3. **Factor de escala:** dividir la lectura cruda por el peso en kg.
   `FACTOR_ESCALA = lectura cruda / peso conocido (kg)`
4. **Aplicar:** escribir el resultado en `FACTOR_ESCALA` del código `src/mat/mat.ino`.

En el prototipo el valor obtenido fue aproximadamente **11150**. Si el peso sale negativo o con valores raros, revisar el cableado de las celdas (ver Troubleshooting del README de `hardware`) y repetir la calibración.

> **Importante:** el mat toma el cero cada vez que se enciende, así que debe encenderse siempre con el mat vacío y quieto.

---

## Arquitectura del Software

El mat y el control se comunican directamente por ESP-NOW, sin WiFi ni internet.

```
MAT:     Celdas → HX711 → lectura de peso → ¿supera el umbral? → alerta (ESP-NOW)
CONTROL: alerta recibida → buzzer intermitente → botón → silencia → avisa al mat
```

### Módulos Principales
1. **Inicialización:** tara del HX711 y configuración de ESP-NOW.
2. **Lectura de sensores:** peso en kg a partir de las 4 celdas de carga.
3. **Procesamiento:** compara con el umbral y confirma que el peso se mantiene.
4. **Actuación:** buzzer en el control, que se silencia con un botón.
5. **Comunicación:** mensajes ESP-NOW (1 = alerta, 2 = atendida).

---

## Pendientes
- Ajustar `UMBRAL_KG` con pruebas en uso real.
- Medir el alcance de ESP-NOW entre mat y control.
- Medir la autonomía de la batería del control.

---

## API / Endpoints
No aplica: el sistema no usa WiFi ni servidor web.