# Código Fuente

Esta carpeta contiene el código de las dos placas: la **versión final (iteración 2)**, en las carpetas de esta misma ubicación, y la **versión anterior (iteración 1)**, dentro de `Entrega anterior/`.

```
software/src/
├── Entrega anterior/    # Iteración 1: calibracion/, control/, mac/ y mat/
├── calibracion/         # Versión final
├── control_final/       # Versión final
├── mac/                 # Versión final
├── mat_final/           # Versión final
└── README.md
```

---

# Versión final (iteración 2)

## Archivos Principales

Cada programa está en su propia carpeta (el Arduino IDE exige que la carpeta y el `.ino` se llamen igual). SafeRest no usa un único `main.ino`, porque son dos dispositivos distintos.

### `mat_final/mat_final.ino`
Programa del mat (Wemos D1 R2). Lee las celdas de carga con el HX711 y envía la alerta al control cuando una persona pisa el mat.

**Estructura:**
- Setup: enciende el LED en amarillo, inicia el HX711, toma el cero (tara) con el mat vacío, activa ESP-NOW y hace 3 destellos verdes cuando está listo. Si el HX711 no responde, deja el LED rojo intermitente.
- Loop: lee el peso y aplica la lógica de alerta: el peso debe superar `UMBRAL_KG` (20 kg) durante `CONFIRMA_MS` (300 ms). La alerta se envía 3 veces por ESP-NOW y no se repite hasta que el peso baje del umbral y pasen al menos `REPOSO_MS` (20 s) desde la última alerta.

### `control_final/control_final.ino`
Programa del control (Wemos D1 mini). Recibe la alerta, hace sonar el buzzer, muestra el estado con el LED y atiende el pulsador.

**Estructura:**
- Setup: configura el buzzer, el pulsador, el LED y ESP-NOW; muestra una luz blanca con un pitido corto al arrancar.
- Loop: si hay alarma activa, el buzzer y el LED blanco parpadean juntos (300 ms) hasta que se presiona el pulsador, y se avisa al mat. Sin alarma, mide el voltaje de la batería cada 1 s y muestra su estado con el LED (rojo: baja; naranjo: cargando; verde: llena; apagado: normal).

### Otros archivos
- `calibracion/calibracion.ino`: obtiene el factor de escala del mat. Con el mat vacío toma el cero (tara) y, al poner un peso conocido, entrega la lectura cruda (ver "Calibración del Mat" abajo).
- `mac/mac.ino`: lee la dirección MAC de la placa, necesaria para que el mat y el control se reconozcan.

---

## Estándares de Código

### Comentarios
- Los comentarios están en español.
- Cada archivo parte con un bloque que explica qué hace, en qué placa va y cómo se conecta.
- Las funciones llevan un comentario breve sobre lo que hacen y por qué.

### Nombres de Variables
- Variables: `camelCase` (por ejemplo `alarmaActiva`, `sobreDesde`, `pisado`)
- Constantes: `UPPER_SNAKE_CASE` (por ejemplo `FACTOR_ESCALA`, `UMBRAL_KG`, `REPOSO_MS`)
- Funciones: `camelCase()` (por ejemplo `enviarAlerta()`, `mostrarBateria()`)

---

## Calibración del Mat

1. Con el mat vacío, cargar `calibracion/calibracion.ino`, poner un peso conocido y leer la lectura en el monitor serial.
2. Si el mat ya tiene un factor: factor nuevo = factor anterior × (lectura / peso real).
3. Escribir el resultado en `FACTOR_ESCALA` de `mat_final/mat_final.ino`.

Valor final: `FACTOR_ESCALA = 19260.0`. Con el factor inicial (`11150`) un objeto de 6,67 kg se leía como 11,52 kg.

---

## Testing y Debugging

### Monitor Serial
- Baudrate: 115200
- **Mat:** muestra el peso medido (`Peso: ... kg`), además de `Mat listo`, `Alerta enviada`, `Entrega OK` o `Entrega FALLO`, `Alarma atendida en el control` y, si falla, `Error: el HX711 no responde`.
- **Control:** muestra `Control listo` al arrancar y, cada 1 s, el voltaje de la batería con su estado (`Bateria: ... V  estado: ...`).

### Pruebas realizadas
- Persona de más de 20 kg: alerta; el control suena y el LED parpadea en blanco.
- Perro de 18 kg: sin alerta.
- El detalle de las pruebas y los resultados está en `iteraciones/iteracion_2/README.md`.

---
---

# Versión anterior (iteración 1)

Se conserva el texto de la entrega anterior. Los archivos están en la carpeta `Entrega anterior/`.

## Archivos Principales

Cada programa está en su propia carpeta (el Arduino IDE exige que la carpeta y el `.ino` se llamen igual). SafeRest no usa un único `main.ino`, porque son dos dispositivos distintos.

### `mat/mat.ino`
Programa del mat (Wemos D1). Lee las celdas de carga con el HX711 y envía la alerta al control cuando el peso supera el umbral.

**Estructura:**
- Setup: inicia el HX711, toma el cero (tara) y activa ESP-NOW.
- Loop: lee el peso, confirma que se mantiene unos instantes y envía la alerta.

### `control/control.ino`
Programa del control (Wemos D1 Mini). Recibe la alerta, hace sonar el buzzer y atiende el botón.

**Estructura:**
- Setup: configura el buzzer, el botón y ESP-NOW.
- Loop: si hay alarma activa, hace sonar el buzzer y espera el botón para silenciarla.

### Otros archivos
- `calibracion/calibracion.ino`: obtiene el factor de escala del mat. Con el mat vacío toma el cero (tara) y, al poner un peso conocido, entrega la lectura cruda; el `FACTOR_ESCALA` se calcula dividiendo esa lectura por el peso en kg (ver "Calibración del Mat" en `software/README.md`).
- `mac/mac.ino`: lee la dirección MAC de la placa, necesaria para que el mat y el control se reconozcan.

---

## Estándares de Código

### Comentarios
- Los comentarios están en español.
- Cada archivo parte con un bloque que explica qué hace, en qué placa va y cómo se conecta.
- Las funciones llevan un comentario breve sobre lo que hacen y por qué.

### Nombres de Variables
- Variables: `camelCase` (por ejemplo `alarmaActiva`, `inicioPeso`)
- Constantes: `UPPER_SNAKE_CASE` (por ejemplo `FACTOR_ESCALA`, `UMBRAL_KG`)
- Funciones: `camelCase()` (por ejemplo `enviarAlerta()`)

---

## Testing y Debugging

### Monitor Serial
- Baudrate: 115200
- El mat muestra el peso medido cada segundo, además de mensajes como `ALERTA enviada` y `Entrega OK`.
- El control muestra `Control listo` al arrancar.
- Para calibrar, usar `calibracion/calibracion.ino` con el mat vacío, poner un peso conocido y leer la "lectura cruda" en el monitor. El factor de escala es esa lectura dividida por el peso en kg.