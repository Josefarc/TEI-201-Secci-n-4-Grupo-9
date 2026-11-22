# Software - Documentación

## Contenido
Esta carpeta contiene el código y la documentación del software de SafeRest, con la versión final (iteración 2) y la versión anterior (iteración 1).

### 📁 Carpetas

#### `src/`
Código fuente (.ino para Arduino). La versión final está en esta misma carpeta y la de la iteración 1 en `Entrega anterior/`:
- `mat_final/`: programa del mat (detecta el paso y envía la alerta)
- `control_final/`: programa del control (buzzer, LED, botón y batería)
- `calibracion/`: calibración de las celdas de carga
- `mac/`: lectura de la dirección MAC de cada placa
- `Entrega anterior/`: código de la iteración 1 (`mat/`, `control/`, `calibracion/` y `mac/`)

#### `librerias/`
Notas sobre las librerías necesarias. No se incluyen archivos, porque se instalan desde el Arduino IDE (ver `FUENTES.md`).

#### `docs/`
Documentación técnica del software: diagramas de flujo, funciones, manuales de instalación y operación, y troubleshooting.

---

# Versión final (iteración 2)

## Stack Tecnológico

**Plataforma:** Arduino / ESP8266 (Wemos D1 R2 en el mat y Wemos D1 mini en el control)  
**Lenguaje:** C/C++  
**IDE:** Arduino IDE 2.x  
**Placa en el IDE:** `LOLIN(WEMOS) D1 R2 & mini`  
**Librerías principales:**
- HX711 (bogde) - versión 0.7.5
- Adafruit NeoPixel - versión 1.15.5 (LED WS2812)
- ESP8266 Arduino Core (incluye ESP8266WiFi y espnow) - versión 3.1.2

---

## Instalación y Configuración

### 1. Instalar Arduino IDE
Descargar la versión 2.x desde https://www.arduino.cc/en/software

### 2. Configurar las placas ESP8266
En Arduino IDE: Preferencias → agregar la URL del gestor de placas del ESP8266 → Gestor de Placas → instalar "esp8266" (versión 3.1.2).

### 3. Instalar Librerías
Gestor de Librerías → buscar e instalar:
- "HX711" (autor: bogde)
- "Adafruit NeoPixel" (autor: Adafruit)

### 4. Cargar Código
1. Abrir el programa correspondiente en `src/`: `src/mat_final/mat_final.ino` para el mat y `src/control_final/control_final.ino` para el control.
2. Seleccionar la placa `LOLIN(WEMOS) D1 R2 & mini` y el puerto.
3. Compilar y subir.

---

## Configuración de Parámetros

Editar las siguientes constantes en `src/mat_final/mat_final.ino`:

```cpp
// Calibración
const float FACTOR_ESCALA = 19260.0;   // obtenido con calibracion.ino
const float UMBRAL_KG = 20.0;          // peso mínimo para activar la alerta

// Detección
const unsigned long CONFIRMA_MS = 300; // tiempo que el peso debe mantenerse
const unsigned long REPOSO_MS = 20000; // espera mínima entre alertas (20 s)

// Comunicación
uint8_t macControl[] = {...};          // MAC del control
const uint8_t CANAL = 1;               // mismo canal en mat y control
```

En `src/control_final/control_final.ino` se debe escribir la MAC del mat en `macMat`. Ahí también están los límites de batería: `V_BAJA = 3,55 V` (~20 %) y `V_LLENA = 4,10 V`.

> **Nota:** el umbral de 20 kg permite detectar a una persona y no a una mascota pequeña (en las pruebas, un perro de 18 kg no activó la alarma). Se puede ajustar con `UMBRAL_KG`.

---

## Calibración del Mat

El mat necesita dos valores: el cero (lectura con el mat vacío) y el factor de escala (cuánto vale la lectura por cada kilo). Se obtienen con `src/calibracion/calibracion.ino`:

1. **Cero (tara):** con el mat vacío y quieto, cargar `calibracion.ino` en el Wemos D1 R2 del mat. Al iniciar, el programa espera unos 3 segundos y toma el valor de vacío como cero.
2. **Peso conocido:** poner sobre el mat un peso de valor conocido y leer en el monitor serie la lectura.
3. **Factor de escala:** si el mat ya tiene un factor, calcular el nuevo así:
   `factor nuevo = factor anterior × (lectura / peso real)`
4. **Aplicar:** escribir el resultado en `FACTOR_ESCALA` de `src/mat_final/mat_final.ino`.

En la iteración 1 el factor era 11150, y con un objeto de 6,67 kg el mat leía 11,52 kg. Con la corrección el factor quedó en **19260**, que es el valor final. Si el peso sale negativo o con valores raros, revisar el cableado de las celdas (ver Troubleshooting del README de `hardware`) y repetir la calibración.

> **Importante:** el mat toma el cero cada vez que se enciende, así que debe encenderse siempre con el mat vacío y quieto.

---

## Arquitectura del Software

El mat y el control se comunican directamente por ESP-NOW, sin WiFi ni internet.

```
MAT:     Celdas → HX711 → lectura de peso → ¿supera 20 kg por 300 ms? → alerta (ESP-NOW, 3 envíos)
CONTROL: alerta recibida → buzzer y LED blanco intermitentes → pulsador → silencia → avisa al mat
         (sin alarma) → mide la batería por A0 → LED según su estado
```

### Módulos Principales
1. **Inicialización:** LED amarillo, tara del HX711, configuración de ESP-NOW y 3 destellos verdes cuando el mat está listo. El control muestra luz blanca y un pitido corto.
2. **Lectura de sensores:** peso en kg a partir de las 4 celdas de carga, y voltaje de la batería del control por A0.
3. **Procesamiento:** compara con el umbral, confirma que el peso se mantiene, envía una sola alerta por pisada y deja al menos 20 s entre alertas.
4. **Actuación:** buzzer y LED en el control, que se silencian con el pulsador. LED del mat con el estado del equipo.
5. **Comunicación:** mensajes ESP-NOW (1 = alerta, 2 = atendida). El mat informa por el monitor serial si la entrega fue `OK` o `FALLO`.

---

## Pendientes
- Pruebas formales de usabilidad con adultos mayores.
- Medir la autonomía del control con una descarga completa (hoy es una estimación de 24 a 30 horas).
- Medir el consumo del mat.
- Mejorar la detección del cargador cuando la batería está casi llena (ver `iteraciones/iteracion_2/limitaciones_deteccion_alimentacion.md`).

---

## API / Endpoints
No aplica: el sistema no usa WiFi ni servidor web.

---
---

# Versión anterior (iteración 1)

Se conserva el texto de la entrega anterior como referencia. El código de esa versión está en `src/Entrega anterior/`.

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
1. Abrir el programa correspondiente en `src/Entrega anterior/` (por ejemplo `src/Entrega anterior/mat/mat.ino`).
2. Seleccionar la placa `LOLIN(WEMOS) D1 R2 & mini` y el puerto.
3. Compilar y subir.

---

## Configuración de Parámetros

Editar las siguientes constantes en `src/Entrega anterior/mat/mat.ino`:

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

En `src/Entrega anterior/control/control.ino` se debe escribir la MAC del mat en `macMat`.

> **Nota:** `UMBRAL_KG = 1.0` era un valor de prueba para la iteración 1. En la iteración 2 se ajustó a 20 kg con las pruebas.

---

## Calibración del Mat

El mat necesita dos valores: el cero (lectura con el mat vacío) y el factor de escala (cuánto vale la lectura por cada kilo). Se obtienen con `src/Entrega anterior/calibracion/calibracion.ino`:

1. **Cero (tara):** con el mat vacío y quieto, cargar `calibracion.ino` en el Wemos D1 del mat. Al iniciar, el programa espera unos 3 segundos y toma el valor de vacío como cero.
2. **Peso conocido:** poner sobre el mat un peso de valor conocido (por ejemplo, una botella de 2 kg o un peso de 6,5 kg) y leer en el monitor serie la "lectura cruda".
3. **Factor de escala:** dividir la lectura cruda por el peso en kg.
   `FACTOR_ESCALA = lectura cruda / peso conocido (kg)`
4. **Aplicar:** escribir el resultado en `FACTOR_ESCALA` del código `src/Entrega anterior/mat/mat.ino`.

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

## Pendientes (en esa entrega)
- Ajustar `UMBRAL_KG` con pruebas en uso real. *(Resuelto en la iteración 2: 20 kg.)*
- Medir el alcance de ESP-NOW entre mat y control. *(Resuelto en la iteración 2: ~9 m en línea de vista.)*
- Medir la autonomía de la batería del control. *(En la iteración 2 se estimó en 24 a 30 horas.)*