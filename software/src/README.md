# Código Fuente

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