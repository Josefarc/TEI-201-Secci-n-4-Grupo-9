# Esquemas de Circuito

## Archivos Incluidos

- `esquema_mat.png` - Esquema de conexiones del mat (4 celdas de carga, HX711, Wemos D1 y UPS)
- `esquema_control.png` - Esquema de conexiones del control remoto (Wemos D1 mini, buzzer, pulsador y UPS)

> Los esquemas son diagramas de conexiones. El archivo fuente de Fritzing (`.fzz`) queda pendiente para una iteración posterior.

---

## Nomenclatura de Archivos
- Usar nombres descriptivos
- Incluir versión: `v3_esquema_final.fzz`
- Fecha en formato: `YYYYMMDD_descripcion`

---

## Notas de Diseño

- **Comunicación:** el mat y el control se comunican por ESP-NOW (sin WiFi ni router), por eso no hay conexión física entre ambos.
- **Alimentación:** cada sistema usa un módulo UPS con batería 18650. El Wemos se alimenta por los pads 5V/GND del UPS, que siempre están activos. Con el cargador USB enchufado el UPS carga la batería, y si se corta la luz cambia a la batería automáticamente.
- **Mat:** las 4 celdas de carga (de 3 cables: rojo, negro y blanco) se unen en un solo puente de medición. En las celdas 1 y 3, el negro va a E+, el blanco a E− y el rojo a A+. En las celdas 2 y 4, el negro va a E−, el blanco a E+ y el rojo a A−. El HX711 se conecta al Wemos D1 con DT en D5 (GPIO14) y SCK en D6 (GPIO12), y se alimenta con 3V3.
- **Control:** el buzzer activo va en D5 (GPIO14). El pulsador va en D6 (GPIO12) con `INPUT_PULLUP`, por lo que al apretarlo conecta D6 a GND y silencia la alarma.
- **Pines:** los números de GPIO coinciden con los definidos en el código (`software/src`).