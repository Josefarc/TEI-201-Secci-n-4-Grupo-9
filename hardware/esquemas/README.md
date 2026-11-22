# Esquemas de Circuito

Esquemas eléctricos de SafeRest (ODS 3): el **mat** (alfombra con celdas de carga) y el **control remoto** (buzzer y luz de alerta). Esta carpeta guarda la versión final de la entrega y, dentro de `Entrega pasada/`, la versión anterior, para dejar a la vista cómo evolucionó el diseño.

---

## Estructura de la carpeta

```
esquemas/
├── Esquema mat final.fsch              ← versión final, editable (Fusion)
├── Esquema control final.fsch          ← versión final, editable (Fusion)
├── esquema_mat_final.png               ← versión final, imagen
├── esquema_control_final.png           ← versión final, imagen
├── README.md
└── Entrega pasada/
    ├── Esquema Mat.fsch                ← versión anterior, editable (Fusion)
    ├── Esquema Control.fsch            ← versión anterior, editable (Fusion)
    ├── esquema_mat_entrega_pasada.png      ← versión anterior, imagen
    └── esquema_control_entrega_pasada.png  ← versión anterior, imagen
```

## Archivos incluidos

### Versión final (Avance #3)

| Archivo | Descripción |
|---|---|
| `Esquema mat final.fsch` | Esquema editable del mat en Fusion (Electronics). |
| `Esquema control final.fsch` | Esquema editable del control remoto en Fusion (Electronics). |
| `esquema_mat_final.png` | Esquema de conexiones del mat, para verlo sin abrir Fusion. |
| `esquema_control_final.png` | Esquema de conexiones del control, para verlo sin abrir Fusion. |

### Versión anterior (`Entrega pasada/`)

| Archivo | Descripción |
|---|---|
| `Esquema Mat.fsch` | Esquema editable del mat de la entrega anterior (Fusion). |
| `Esquema Control.fsch` | Esquema editable del control de la entrega anterior (Fusion). |
| `esquema_mat_entrega_pasada.png` | Imagen del esquema del mat de la entrega anterior. |
| `esquema_control_entrega_pasada.png` | Imagen del esquema del control de la entrega anterior. |

> **Herramientas:** no se usó Fritzing (de pago) ni Wokwi (no soporta el ESP8266). Los esquemas editables se hicieron en **Fusion (Electronics)** y se entregan como `.fsch`, junto con imágenes exportadas.

---

## Nombres de los componentes

En los esquemas de ambos sistemas, los componentes que se repiten usan el mismo nombre:

| Componente | Nombre en el esquema | Se usa en |
|---|---|---|
| Microcontrolador | Wemos D1 R2 (mat) / Wemos D1 mini (control) | Mat y control |
| Módulo de carga y respaldo | Módulo UPS | Mat y control |
| Batería | Batería 18650 | Mat y control |
| Cargador | Cargador USB 5 V | Mat y control |
| Interruptor de encendido | Interruptor KCD11 | Mat y control (versión final) |
| Luz de estado | LED WS2812 | Mat y control (versión final) |
| Amplificador de celdas | Módulo HX711 | Mat |
| Sensores de peso | Celda de carga 1 a 4 | Mat |
| Alarma sonora | Buzzer activo | Control |
| Transistor del buzzer | Transistor 2N2222 | Control |
| Silenciar alarma | Pulsador | Control |

---

## Versión final

### Mat

Componentes: 4 celdas de carga, módulo HX711, Wemos D1 R2, Módulo UPS con batería 18650, cargador USB 5 V, interruptor KCD11 y LED WS2812.

- **Celdas de carga:** las 4 celdas (de 3 cables: rojo, negro y blanco) se unen en un solo puente de medición. Las etiquetas iguales (E+, E−, A+, A−) son el mismo punto.
  - Celdas 1 y 3: negro → E+, blanco → E−, rojo → A+.
  - Celdas 2 y 4: negro → E−, blanco → E+, rojo → A−.
- **HX711 → Wemos D1 R2:** DT en D5 (GPIO14) y SCK en D6 (GPIO12). El HX711 se alimenta con 3V3.
- **LED WS2812:** señal en D7 (GPIO13) a través de una resistencia de 1 kΩ. Indica el estado del mat: amarillo mientras inicia y tara, 3 destellos verdes cuando está listo, rojo intermitente si hay un error.
- **Alimentación:** el Módulo UPS con batería 18650 alimenta el Wemos y el HX711. El interruptor KCD11 enciende y apaga el mat. Con el cargador USB conectado el UPS carga la batería, y si se corta la corriente sigue funcionando con la batería.
- **Comunicación:** envía la alerta al control por ESP-NOW (inalámbrico), sin conexión física entre ambos.

### Control remoto

Componentes: Wemos D1 mini, buzzer activo, transistor 2N2222, dos resistencias de 1 kΩ, una resistencia de 100 kΩ, pulsador, Módulo UPS con batería 18650, cargador USB 5 V, interruptor KCD11 y LED WS2812.

- **Buzzer activo:** se enciende desde D5 (GPIO14) a través de una resistencia de 1 kΩ y un transistor 2N2222. D5 va a la base por la resistencia, el emisor va a GND y el buzzer queda entre 5 V y el colector.
- **Pulsador:** va en D6 (GPIO12) con `INPUT_PULLUP`; al apretarlo conecta D6 a GND y silencia la alarma.
- **LED WS2812:** señal en D1 (GPIO5) a través de una resistencia de 1 kΩ al pin DIN. Muestra el estado del control:
  - Blanco al arrancar (junto con un pitido corto).
  - Blanco intermitente, sincronizado con el buzzer, mientras suena la alarma.
  - Rojo fijo con la batería baja (bajo ~3,55 V, cerca del 20 %).
  - Naranjo mientras carga.
  - Verde con la batería cargada (≥ 4,1 V) y aún enchufado.
  - Apagado el resto del tiempo, para ahorrar batería.
- **Medición de batería:** el pin A0 se conecta al positivo de la batería a través de una resistencia de 100 kΩ. Con esa lectura el control decide los estados del LED y detecta si el cargador está conectado.
- **Alimentación:** el Wemos se alimenta por los pads 5V/GND del Módulo UPS, que siempre están activos. El interruptor KCD11 enciende y apaga el control.

---

## Versión anterior (entrega pasada)

Se conserva en `Entrega pasada/` para mostrar la evolución del proyecto.

### Mat (entrega pasada)

- 4 celdas de carga, módulo HX711, Wemos D1, Módulo UPS, batería 18650 y cargador USB 5 V.
- Mismo puente de medición con las 4 celdas y mismo conexionado HX711 → Wemos (DT en GPIO14, SCK en GPIO12).
- **No tenía** interruptor KCD11 ni LED WS2812.
- El UPS aparecía en el esquema, pero en esa iteración aún no estaba instalado y el mat se alimentaba por cable.

### Control (entrega pasada)

- Wemos D1 mini, buzzer con transistor y resistencia, pulsador, Módulo UPS, batería 18650 y cargador USB 5 V.
- **No tenía** interruptor KCD11, LED WS2812 ni medición de batería por A0.
- El buzzer y el pulsador se conectaban igual que en la versión final (D5 y D6).

---

## Qué cambió entre la entrega pasada y la final

| Aspecto | Entrega pasada | Versión final |
|---|---|---|
| Mat: alimentación | UPS solo en el esquema; se alimentaba por cable | UPS con batería 18650 instalado |
| Mat: encendido | Sin interruptor | Interruptor KCD11 |
| Mat: indicador | Sin luz | LED WS2812 (D7, con 1 kΩ) |
| Control: encendido | Sin interruptor | Interruptor KCD11 |
| Control: indicador | Solo buzzer | Buzzer + LED WS2812 (D1, con 1 kΩ) |
| Control: batería | Sin medición | Medición por A0 (resistencia de 100 kΩ) |
| Nombres en los esquemas | Distintos entre mat y control | Unificados |

---

## Nomenclatura de archivos

- Versión final: sufijo `final`.
- Versión anterior: sufijo `entrega_pasada` (o sin sufijo en los `.fsch`), dentro de `Entrega pasada/`.
- Nombres descriptivos, sin versiones sueltas fuera de estas dos carpetas.

---

## Notas de diseño

- **Comunicación:** el mat y el control se comunican por ESP-NOW, sin WiFi ni router, por eso no hay conexión física entre ambos.
- **Pines:** los números de GPIO coinciden con los definidos en el código (`software/final/`).
- **Abrir los esquemas:** los `.fsch` se abren con Fusion (panel de datos → Upload, luego doble clic).