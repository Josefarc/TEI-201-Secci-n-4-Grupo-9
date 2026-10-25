# Esquemas de Circuito

## Archivos Requeridos

### Formato Fritzing
- `circuito_completo.fzz` - Archivo fuente Fritzing
- `esquema_circuito.png` - Exportación del esquema
- `pcb_layout.png` - (opcional) Layout de PCB

### Formato Wokwi
- `wokwi_diagram.json` - Archivo de proyecto Wokwi
- `wokwi_screenshot.png` - Captura del circuito
- `wokwi_link.txt` - URL del proyecto online

> **Estado en SafeRest:** no se usó Fritzing (de pago) ni Wokwi (no soporta el ESP8266). Los esquemas se entregan como diagramas de conexiones en imagen. El archivo fuente editable queda pendiente para una iteración posterior.

---

## Archivos Incluidos

- `esquema_mat.png` - Esquema de conexiones del mat (4 celdas de carga, HX711, Wemos D1 y UPS previsto)
- `esquema_control.png` - Esquema de conexiones del control remoto (Wemos D1 mini, buzzer con transistor y resistencia, pulsador y UPS)

---

## Nomenclatura de Archivos
- Usar nombres descriptivos
- Incluir versión: `v3_esquema_final.png`
- Fecha en formato: `YYYYMMDD_descripcion`

---

## Notas de Diseño

- **Comunicación:** el mat y el control se comunican por ESP-NOW (sin WiFi ni router), por eso no hay conexión física entre ambos.
- **Alimentación:** el control usa un módulo UPS con batería 18650. El Wemos se alimenta por los pads 5V/GND del UPS, que siempre están activos. Con el cargador USB enchufado el UPS carga la batería y si se corta la luz cambia a la batería automáticamente. El mat también tiene previsto un UPS en el diseño y en el esquema, pero en la iteración 1 aún no está instalado y se alimenta por cable.
- **Mat:** las 4 celdas de carga (de 3 cables: rojo, negro y blanco) se unen en un solo puente de medición. Al HX711 llegan 4 cables: los dos blancos a E+ y E−, el rojo a A− y el negro a A+. El HX711 se conecta al Wemos D1 con DT en D5 (GPIO14) y SCK en D6 (GPIO12), y se alimenta con 3V3.
- **Control:** el buzzer activo se enciende desde D5 (GPIO14) a través de una resistencia de 1 kΩ y un transistor 2N2222: D5 va a la base por la resistencia, el emisor va a GND y el buzzer queda entre 5 V y el colector. El pulsador va en D6 (GPIO12) con `INPUT_PULLUP`, por lo que al apretarlo conecta D6 a GND y silencia la alarma.
- **Pines:** los números de GPIO coinciden con los definidos en el código (`software/src`).