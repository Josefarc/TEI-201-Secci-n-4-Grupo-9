# Hardware - Documentación

## Contenido
Esta carpeta contiene toda la documentación técnica del hardware del proyecto, con la versión final (iteración 2) y la versión anterior (iteración 1).

### 📁 Carpetas

#### `esquemas/`
Diagramas de circuitos y esquemáticos del sistema (mat y control remoto): archivos editables de Fusion (`.fsch`) e imágenes de los esquemas. Los archivos finales están en la carpeta principal y los de la iteración 1 en `Entrega pasada/`.

#### `bom/`
Bill of Materials (lista de materiales) con modelos, cantidades y costos. Total del prototipo: $113.520 CLP.

#### `fotos/`
Fotografías del prototipo ensamblado. Las de la iteración 1 están en `Fotos pasadas/` y las de la iteración 2 (final) en esta misma carpeta, junto con los videos de las pruebas.

---

## Instrucciones de Ensamble (versión final)

### Componentes Principales
1. **Celdas de carga de 50 kg (x4)** - Miden el peso sobre el mat para detectar si alguien lo pisa.
2. **Módulo HX711** - Amplifica y digitaliza la señal de las celdas de carga.
3. **Wemos D1 R2 (ESP8266) en el mat** - Lee el HX711 y envía la alerta al control por ESP-NOW.
4. **Wemos D1 mini (ESP8266) en el control** - Recibe la alerta, activa el buzzer y el LED, y mide la batería.
5. **Buzzer activo** - Emite la alerta sonora al cuidador.
6. **Transistor 2N2222 y resistencia de 1 kΩ** - Permiten que el Wemos D1 mini active el buzzer.
7. **Pulsador** - Permite al cuidador silenciar la alarma.
8. **LED WS2812 (mat y control)** - Indica el estado del mat y del control (alarma, batería).
9. **Interruptor KCD11 (mat y control)** - Enciende y apaga cada equipo.
10. **Módulo UPS con batería 18650 (mat y control)** - Alimenta el equipo y entrega respaldo si se corta la luz.
11. **Resistencias:** 1 kΩ para la señal de cada LED y 100 kΩ para medir la batería del control.

### Pasos de Ensamblaje

**Mat**
1. Unir las 4 celdas de carga en un solo puente y conectarlas al HX711, según `esquemas/esquema_mat_final.png`. Las etiquetas iguales (E+, E−, A+, A−) son el mismo punto:
   - Celdas 1 y 3: negro → E+, blanco → E−, rojo → A+.
   - Celdas 2 y 4: negro → E−, blanco → E+, rojo → A−.
2. Conectar el HX711 al Wemos D1 R2: VCC a 3V3, GND a G, DT a D5 (GPIO14) y SCK a D6 (GPIO12).
3. Conectar el LED WS2812: señal a D7 (GPIO13) por una resistencia de 1 kΩ, y alimentación a 5 V y GND.
4. Alimentar el Wemos D1 R2 desde los pads 5V y GND del módulo UPS, pasando por el interruptor KCD11.
5. Montaje mecánico: fijar las 4 celdas sobre la base de acero galvanizado, dejar los topes a ~2 mm de la placa y poner el acrílico encima. La electrónica va en la caja eléctrica, con el cable de las celdas entrando por el costado y el interruptor y el LED en la tapa.

**Control**
1. Conectar el buzzer con el transistor 2N2222: D5 (GPIO14) a la base por la resistencia de 1 kΩ, el emisor a GND y el buzzer entre 5 V y el colector.
2. Conectar el pulsador entre D6 (GPIO12) y GND.
3. Conectar el LED WS2812: señal a D1 (GPIO5) por una resistencia de 1 kΩ, y alimentación a 5 V y GND.
4. Conectar el pin A0 al positivo de la batería por una resistencia de 100 kΩ, para medir su voltaje.
5. Alimentar el Wemos D1 mini desde los pads 5V y GND del módulo UPS, pasando por el interruptor KCD11, según `esquemas/esquema_control_final.png`.
6. Montaje mecánico: caja impresa en 3D, con el interruptor, el LED, las perforaciones del buzzer y el pulsador en la tapa.

**Ambos**
1. Insertar la batería 18650 en el módulo UPS y cargarla con el cargador USB por el puerto micro-USB (el LED rojo indica que está cargando).
2. Cargar el código de `software/final/` en cada Wemos (mat y control) y verificar que las direcciones MAC coincidan.
3. Calibrar el mat con un peso conocido (`FACTOR_ESCALA` ≈ 19260) y probar la alerta (umbral de 20 kg).

### Precauciones
- ⚠️ El interruptor propio del módulo UPS solo corta la salida USB-A; los pads 5V y GND siguen activos. Por eso cada equipo lleva un interruptor KCD11 en la entrada de 5 V: usar ese interruptor para apagarlo.
- ⚠️ Respetar la polaridad de la batería 18650 al insertarla en el módulo UPS.
- ⚠️ El ESP8266 trabaja con lógica de 3,3 V: el HX711 se alimenta con 3V3, no con 5 V.
- ⚠️ Cargar la batería antes de usar el prototipo (con la batería cargada mide cerca de 4,1 V).
- ⚠️ El mat toma el cero al encenderse: encenderlo siempre con el mat vacío y quieto.
- ⚠️ La señal ESP-NOW no atraviesa bien las paredes de concreto: dejar el control cerca del mat.

---

## Especificaciones Técnicas (versión final)

**Alimentación:** mat y control: 5 V desde un módulo UPS con batería 18650 de 3,7 V (carga por micro-USB)  
**Consumo:** control en reposo ~60 mA (estimado); mat sin medir  
**Autonomía:** control 24 a 30 horas (estimada)  
**Dimensiones del mat:** 51 cm x 82 cm (sobre una base de acero galvanizado de 50 cm x 81 cm y acrílico de 49 cm x 80 cm)  
**Dimensiones de las cajas:** caja del mat 150 mm x 110 mm x 70 mm; caja del control 120 mm x 80 mm x 47,5 mm  
**Comunicación:** ESP-NOW entre mat y control (sin WiFi ni router)  
**Alcance:** ~9 m en línea de vista; 7,3 m con 2 tabiques de yeso cartón; 3 a 4 m con una pared de concreto de 22 cm  
**Umbral de detección:** 20 kg, con reposo de 20 s entre alertas  
**Costo total (BOM):** $113.520 CLP

---

## Troubleshooting

| Problema | Posible Causa | Solución |
|----------|---------------|----------|
| El control no enciende o no suena | Batería sin carga, interruptor KCD11 en OFF o cable de 5 V desconectado | Cargar la batería (LED rojo del UPS), activar el interruptor y revisar los pads 5V y GND |
| El control recibe la alerta pero el buzzer no suena | Transistor al revés o resistencia mal conectada | Revisar base (D5 por la resistencia), colector (buzzer) y emisor (GND) |
| El LED del mat parpadea en rojo | El HX711 no responde (mal contacto en VCC, GND, DT o SCK) o falla ESP-NOW | Revisar las 4 conexiones entre el HX711 y el Wemos D1 R2 y reiniciar el mat |
| El peso sale negativo o con valores raros | Cables A+/A− o blanco/negro de las celdas al revés, topes mal ajustados o factor de calibración incorrecto | Invertir los cables de la celda afectada, revisar la holgura de los topes y recalibrar `FACTOR_ESCALA` con un peso conocido |
| El mat dice "Entrega FALLO" | El control está apagado, fuera de alcance o con otra MAC o canal | Encender el control, acercarlo al mat (evitar paredes de concreto) y verificar las MAC en el código |
| El control no recibe la alerta | Direcciones MAC mal configuradas o uno de los equipos apagado | Verificar las MAC en el código (`software/final/`) y que ambos estén encendidos |
| La alarma suena sin que nadie pise el mat | Umbral de peso demasiado bajo o mat sin tarar | Ajustar `UMBRAL_KG` en el código del mat y encenderlo con el mat vacío |
| Una mascota activa la alarma | Su peso supera el umbral de 20 kg | Subir `UMBRAL_KG` en el código del mat |
| El LED del control sigue naranjo o verde tras desenchufar | El cargador se detecta por voltaje y la batería está casi llena | Es una limitación conocida (ver `iteraciones/iteracion_2/limitaciones_deteccion_alimentacion.md`); no afecta la alarma |

---

## Versión anterior (iteración 1)

Se conserva como referencia de cómo era el hardware en el prototipo alpha. Los esquemas y fotos de esa versión están en `esquemas/Entrega pasada/` y `fotos/Fotos pasadas/`.

### Componentes de la iteración 1
1. **Celdas de carga de 50 kg (x4)** y **módulo HX711**.
2. **Wemos D1 (ESP8266) en el mat** y **Wemos D1 mini (ESP8266) en el control**.
3. **Buzzer**, **transistor 2N2222 y resistencia de 1 kΩ**, y **pulsador** en el control.
4. **Módulo UPS con batería 18650** - Alimentaba el control y entregaba respaldo si se cortaba la luz. En el mat estaba previsto, pero no instalado.

### Ensamblaje de la iteración 1
**Mat**
1. Unir las 4 celdas de carga en un solo puente y conectarlas al HX711, según `esquemas/Entrega pasada/esquema_mat_entrega_pasada.png`. Al HX711 llegaban 4 cables: los dos blancos a E+ y E−, el rojo a A− y el negro a A+.
2. Conectar el HX711 al Wemos D1: VCC a 3V3, GND a G, DT a D5 (GPIO14) y SCK a D6 (GPIO12).
3. Alimentar el Wemos D1 por cable USB (el mat no tenía respaldo de batería).

**Control**
1. Conectar el buzzer con el transistor 2N2222: D5 (GPIO14) a la base por la resistencia de 1 kΩ, el emisor a GND y el buzzer entre 5 V y el colector.
2. Conectar el pulsador entre D6 (GPIO12) y GND.
3. Alimentar el Wemos D1 mini desde los pads 5V y GND del módulo UPS, según `esquemas/Entrega pasada/esquema_control_entrega_pasada.png`.

### Especificaciones de la iteración 1
**Alimentación:** control: 5 V desde el módulo UPS (batería 18650 de 3,7 V, carga por micro-USB); mat: cable USB (UPS previsto)  
**Consumo:** sin medir  
**Dimensiones (diseño 3D):** mat 1200 mm x 700 mm x 35 mm (barra de circuitos); control 111 mm x 72,6 mm x 33,5 mm  
**Peso:** mat 1411 g y control 264 g  
**Comunicación:** ESP-NOW entre mat y control (sin WiFi ni router)

### Cambios de la iteración 1 a la 2
| Aspecto | Iteración 1 | Iteración 2 |
|---|---|---|
| Alimentación del mat | Cable USB | UPS con batería 18650 |
| Encendido | Desconectar el cable de 5 V | Interruptor KCD11 |
| Indicadores | Solo buzzer | Buzzer + LED WS2812 en el control; LED en el mat |
| Batería del control | Sin medición | Medición por A0 con resistencia de 100 kΩ |
| Estructura del mat | Marco de madera con alfombra | Base de acero galvanizado y acrílico |
| Montaje | Protoboard | Mat en caja sin protoboard; control en caja con mini protoboard |