# Fotografías del Prototipo

## Requisitos de las Fotos

### Calidad
- **Resolución mínima:** 1920x1080 px
- **Formato:** JPG o PNG
- **Iluminación:** Buena iluminación natural o artificial uniforme
- **Fondo:** Neutro y sin distracciones

### Tomas Requeridas

1. **Vista general del prototipo completo**
2. **Vista del circuito interno**
3. **Detalle de conexiones críticas**
4. **Vista de sensores montados**
5. **Vista de actuadores**
6. **Encapsulado cerrado (si aplica)**
7. **Prototipo en contexto de uso**

---

## Nomenclatura
- Usar nombres descriptivos
- Incluir la versión como prefijo: `v1_...` para la iteración 1 y `v2_...` para la iteración 2
- En la iteración 1 las fotos están numeradas según la toma requerida (`v1_01_`, `v1_02_`, etc.); en la iteración 2 se usan nombres descriptivos sin número

---

## Organización

```
fotos/
├── Fotos pasadas/    # Iteración 1 (v1): prototipo alpha
├── v2_*.jpeg         # Iteración 2 (v2): fotos del prototipo final
├── v2_*.mp4          # Iteración 2 (v2): videos de las pruebas
└── README.md
```

---

## Fotos de la Iteración 1 (v1)

Se encuentran en la carpeta `Fotos pasadas/`.

| Archivo | Descripción |
|---|---|
| `v1_01_vista_general.jpg` | Sistema completo: prototipo del mat y circuito del control lado a lado |
| `v1_02_circuito_interno_mat.jpg` | Electrónica del mat (Wemos D1, HX711 y cableado desde las celdas) vista por debajo |
| `v1_03_detalle_conexiones_wemos_d1_mat.jpg` | Wemos D1 del mat: cables de datos del HX711 y de alimentación |
| `v1_03_detalle_conexiones_hx711.jpg` | HX711: cables de las celdas de carga (E+, E-, A+, A-) y hacia el Wemos D1 (DT, SCK, VCC) |
| `v1_03_detalle_conexiones_ups.jpg` | Módulo UPS con batería 18650: cables conectados a los pads 5V y GND |
| `v1_03_detalle_conexiones_protoboard_control.jpg` | Protoboard del control: buzzer, pulsador, transistor y resistencia con sus cables |
| `v1_03_detalle_conexiones_wemos_d1_mini_control.jpg` | Wemos D1 mini del control: cables al buzzer y al pulsador y de alimentación |
| `v1_04_sensores.jpg` | Mat sin la alfombra, con las 4 celdas de carga fijadas a la placa de aluminio |
| `v1_05_circuito_control.jpg` | Circuito del control en protoboard con Wemos D1 mini, buzzer, pulsador y módulo UPS con batería 18650 |
| `v1_06_mat_armado.jpg` | Mat armado con marco de madera y alfombra (solo mat, el control no está encapsulado) |
| `v1_07_contexto_uso.jpg` | No aplica en la iteración 1 (prototipo alpha, aún sin pruebas en contexto real) |

---

## Fotos de la Iteración 2 (v2)

Se encuentran directamente en esta carpeta (`fotos/`).

### Fotos

| Toma requerida | Archivo | Descripción |
|---|---|---|
| 1. Vista general | `v2_sistema_completo.jpeg` | Sistema completo: mat con su caja eléctrica y el control encapsulado, lado a lado |
| 2. Circuito interno | `v2_mat_caja_interior.jpeg` | Interior de la caja del mat abierta: UPS con batería 18650, Wemos D1 R2, HX711 y tapa con interruptor y LED |
| 2. Circuito interno | `v2_control_interior.jpeg` | Interior del control abierto: UPS con batería 18650, Wemos D1 mini, mini protoboard y tapa con los componentes |
| 3. Detalle de conexiones | `v2_mat_interior_detalle.jpeg` | Detalle del interior de la caja del mat: UPS, Wemos D1 R2 y HX711 con el cable de las celdas |
| 3. Detalle de conexiones | `v2_mat_tapa.jpeg` | Tapa de la caja del mat: módulo del LED WS2812 con su resistencia de 1 kΩ e interruptor KCD11 |
| 3. Detalle de conexiones | `v2_control_protoboard.jpeg` | Control: mini protoboard con las resistencias y el transistor, y cables hacia el UPS y la Wemos D1 mini |
| 4. Sensores montados | `v2_mat_celdas.jpeg` | Mat visto por debajo: 4 celdas de carga sobre la base de acero galvanizado, con los topes y el acrílico |
| 4. Sensores montados | `v2_mat_celda_tope.jpeg` | Detalle de una celda de carga y su tope, con la holgura de ~2 mm bajo la placa |
| 5. Actuadores | `v2_control_actuadores.jpeg` | Tapa interior del control: buzzer, LED WS2812, pulsador e interruptor KCD11 |
| 6. Encapsulado cerrado | `v2_control_exterior.jpeg` | Control cerrado (caja impresa en 3D), con interruptor, LED, perforaciones del buzzer y pulsador |
| 7. Contexto de uso | `v2_mat_en_uso.jpeg` | Mat junto a la cama con su caja, en el lugar de uso |

### Videos de las pruebas

| Archivo | Descripción |
|---|---|
| `v2_prueba_perro.mp4` | Un perro de 18 kg sobre el mat, sin alarma |
| `v2_prueba_persona_alcance.mp4` | Una persona se sube al mat y la cámara sigue hasta el control, que está en el velador de otra habitación, y suena y enciende el LED |
| `v2_prueba_alerta_control.mp4` | El mat y el control, con el LED del control encendido durante la alerta |
| `v2_prueba_corte_energia.mp4` | El mat conectado al cargador USB; se desenchufa el cargador de la pared para simular un corte de luz y el mat sigue funcionando con su batería, sin reiniciarse |