# Hardware - Documentación

## Contenido
Esta carpeta contiene toda la documentación técnica del hardware del proyecto.

### 📁 Carpetas

#### `esquemas/`
Diagramas de circuitos y esquemáticos del sistema (mat y control remoto)

#### `bom/`
Bill of Materials (Lista de materiales)

#### `fotos/`
Fotografías de alta resolución del prototipo ensamblado

---

## Instrucciones de Ensamble

### Componentes Principales
1. **Celdas de carga de 50 kg (x4)** - Miden el peso sobre el mat para detectar si alguien lo pisa.
2. **Módulo HX711** - Amplifica y digitaliza la señal de las celdas de carga.
3. **Wemos D1 (ESP8266) en el mat** - Lee el HX711 y envía la alerta al control por ESP-NOW.
4. **Wemos D1 mini (ESP8266) en el control** - Recibe la alerta y activa el buzzer.
5. **Buzzer** - Emite la alerta sonora al cuidador.
6. **Transistor 2N2222 y resistencia de 1 kΩ** - Permiten que el Wemos D1 mini active el buzzer.
7. **Pulsador** - Permite al cuidador silenciar la alarma.
8. **Módulo UPS con batería 18650** - Alimenta el control y entrega respaldo si se corta la luz. En el mat está previsto, pero aún no está instalado.

### Pasos de Ensamblaje

**Mat**
1. Unir las 4 celdas de carga en un solo puente y conectarlas al HX711, según `esquemas/esquema_mat.png`. Al HX711 llegan 4 cables: los dos blancos a E+ y E−, el rojo a A− y el negro a A+.
2. Conectar el HX711 al Wemos D1: VCC a 3V3, GND a G, DT a D5 (GPIO14) y SCK a D6 (GPIO12).
3. Alimentar el Wemos D1 por cable USB (en la iteración 1 el mat no tiene respaldo de batería).

**Control**
1. Conectar el buzzer con el transistor 2N2222: D5 (GPIO14) a la base por la resistencia de 1 kΩ, el emisor a GND y el buzzer entre 5 V y el colector.
2. Conectar el pulsador entre D6 (GPIO12) y GND.
3. Alimentar el Wemos D1 mini desde los pads 5V y GND del módulo UPS, según `esquemas/esquema_control.png`.

**Ambos**
1. Insertar la batería 18650 en el módulo UPS del control y cargarla con el cargador USB por el puerto micro-USB (el LED rojo indica que está cargando).
2. Cargar el código de `software/src` en cada Wemos y verificar que las direcciones MAC coincidan.
3. Calibrar el mat con un peso conocido y probar la alerta.

### Precauciones
- ⚠️ El interruptor del módulo UPS solo corta la salida USB-A. Los pads 5V y GND siguen activos, así que para apagar el equipo hay que desconectar el cable de 5 V. Si queda conectado, la batería se descarga.
- ⚠️ Respetar la polaridad de la batería 18650 al insertarla en el módulo UPS.
- ⚠️ El ESP8266 trabaja con lógica de 3,3 V: el HX711 se alimenta con 3V3, no con 5 V.
- ⚠️ Cargar la batería antes de usar el prototipo para confirmar el respaldo (con la batería cargada mide cerca de 4,1 V).

---

## Especificaciones Técnicas

**Alimentación:** control: 5 V desde el módulo UPS (batería 18650 de 3,7 V, carga por micro-USB); mat: cable USB (UPS previsto)  
**Consumo:** [por medir]  
**Dimensiones (diseño 3D):** mat 1200 mm x 700 mm x 35 mm (barra de circuitos); control 111 mm x 72,6 mm x 33,5 mm  
**Peso:** mat 1411 g y control 264 g  
**Comunicación:** ESP-NOW entre mat y control (sin WiFi ni router)

---

## Troubleshooting

| Problema | Posible Causa | Solución |
|----------|---------------|----------|
| El control no enciende o no suena | Batería sin carga o cable de 5 V desconectado | Cargar la batería (LED rojo del UPS) y revisar los pads 5V y GND |
| El control recibe la alerta pero el buzzer no suena | Transistor al revés o resistencia mal conectada | Revisar base (D5 por la resistencia), colector (buzzer) y emisor (GND) |
| El monitor serie dice "HX711 no responde" | Mal contacto en VCC, GND, DT o SCK | Revisar las 4 conexiones entre el HX711 y el Wemos D1 |
| El peso sale negativo o con valores raros | Cables A+/A− o blanco/negro de las celdas al revés, o factor de calibración incorrecto | Invertir los cables de la celda afectada y recalibrar `FACTOR_ESCALA` con un peso conocido |
| El control no recibe la alerta | Direcciones MAC mal configuradas o uno de los equipos apagado | Verificar las MAC en el código (`software/src`) y que ambos estén encendidos |
| La alarma suena sin que nadie pise el mat | Umbral de peso demasiado bajo | Ajustar `UMBRAL_KG` en el código del mat |
| El control sigue encendido con el interruptor del UPS en OFF | El interruptor solo corta el USB-A, no los pads | Desconectar el cable de 5 V para apagarlo |