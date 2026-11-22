# Iteración 2 - Versión Final del Prototipo

## Información General

**Fecha:** 22/11/2026  
**Versión:** v2.0  
**Estado:** Prototipo funcional final  
**Avance asociado:** Avance #3

---

## Descripción

Segunda y última versión del prototipo SafeRest: un mat con celdas de carga que detecta cuando un adulto mayor se levanta de noche y avisa al cuidador mediante un control remoto con buzzer y luz de estado. Esta versión corrige los problemas de la iteración 1, agrega respaldo de energía en el mat, indicadores luminosos en ambos equipos y deja los circuitos dentro de cajas, listos para su uso.

**Objetivos de esta iteración:**
- Corregir los problemas identificados en la iteración 1
- Instalar el respaldo de energía (UPS con batería 18650) también en el mat
- Calibrar el mat con un peso conocido y fijar el umbral de detección
- Agregar interruptor de encendido y luz de estado (LED) en el mat y en el control
- Evitar alertas repetidas seguidas con un tiempo de reposo
- Montar los circuitos dentro de cajas
- Medir el alcance de la comunicación y probar el sistema con personas y mascotas
- Documentar el costo del prototipo (BOM) y las fuentes

---

## Cambios Respecto a la Iteración 1

### Hardware
**Agregado:**
- Módulo UPS con batería 18650 en el mat (en la iteración 1 solo estaba en el esquema; el mat se alimentaba por cable)
- Interruptor KCD11 en el mat y en el control
- LED WS2812 en el mat y en el control
- Resistencias de 1 kΩ para la señal de los LED y de 100 kΩ para medir la batería del control
- Caja del mat y caja del control, ambas con tapa

**Modificado:**
- Estructura del mat: base de acero galvanizado con acrílico sobre las celdas (en la iteración 1 era un marco de madera con alfombra). Las 4 celdas quedan entre la base y el acrílico, con topes a ~2 mm de la placa.
- Conexionado de las celdas: las 4 celdas se unen en un solo puente de medición.

**Removido:**
- Protoboard en el mat - Razón: conexiones frágiles y cables sueltos (problema 3 de la iteración 1). El control aún usa una mini protoboard dentro de su caja (ver Problemas Pendientes).

### Software
**Nuevas funcionalidades:**
- Alerta cuando el peso supera el umbral de forma sostenida (300 ms), enviada 3 veces por ESP-NOW
- Tiempo de reposo entre alertas (20 s): el mat no vuelve a emitir hasta que pasó ese tiempo desde la última alerta
- El mat solo vuelve a quedar armado cuando el peso baja del umbral (evita repetir la alerta mientras la persona sigue sobre el mat)
- LED del mat: amarillo al iniciar y tarar, 3 destellos verdes cuando está listo, rojo intermitente si hay un error
- LED del control: blanco al arrancar, blanco intermitente sincronizado con el buzzer durante la alarma, rojo con batería baja, naranjo cargando, verde con batería cargada, apagado el resto del tiempo
- El control mide el voltaje de la batería por A0 y detecta cuándo se conecta o desconecta el cargador
- El mat informa "Entrega OK" o "Entrega FALLO" según si el control recibió la alerta

**Optimizaciones:**
- Umbral de detección ajustado de 1 kg (valor de prueba) a 20 kg
- Factor de calibración del HX711 corregido con un peso conocido (ver Resultados)
- Promedio de lecturas de la batería y 5 s de espera tras una alarma, para no confundir la recuperación del voltaje con un cargador enchufado

**Bugs corregidos:**
- Umbral sin calibrar (problema 4 de la iteración 1)
- Celdas con lecturas negativas o inestables (ver Resultados)

### Diseño Mecánico
- **Caja del mat:** caja eléctrica de plástico con tapa. Adentro van el UPS con la batería 18650 (a lo largo, arriba), el HX711 y la Wemos D1 R2. El cable de las celdas entra por el costado y el micro-USB del UPS (para cargar) queda accesible. En la tapa van el interruptor KCD11 y el módulo del LED.
- **Caja del control:** impresa en 3D, de color negro. En la tapa tiene el interruptor KCD11, el LED, las perforaciones del buzzer y el pulsador. Adentro van el UPS con la batería 18650, la Wemos D1 mini y la mini protoboard.
- Modelos 3D, renders y planos en la carpeta de diseño 3D.

---

## Componentes Utilizados

### Hardware
- Microcontrolador: Wemos D1 R2 (ESP8266) en el mat y Wemos D1 mini (ESP8266) en el control
- Sensores:
  - 4 celdas de carga de 50 kg con módulo HX711
  - Medición de voltaje de batería por A0 (control)
- Actuadores:
  - Buzzer activo con transistor 2N2222 (control)
  - LED WS2812 (mat y control)
- Otros: pulsador, interruptor KCD11 (mat y control), módulo UPS con batería 18650 (mat y control), cargador USB, cajas, cables de conexión
- Estructura del mat: base de acero galvanizado y acrílico sobre las celdas de carga

El detalle completo, con modelos, cantidades y costos, está en `hardware/bom/bom_completo.xlsx`. Costo total del prototipo: $113.520 CLP.

### Software
- IDE: Arduino IDE
- Librerías: HX711 (bogde v0.7.5), Adafruit NeoPixel, núcleo ESP8266 v3.1.2 (incluye ESP-NOW)
- Versión código: v2.0

---

## Fotos y Videos del Prototipo v2

Incluidos en la carpeta `v2_fotos/`:

**Fotos**
- `v2_sistema_completo.jpeg`: mat, caja del mat y control juntos
- `v2_mat_en_uso.jpeg`: mat junto a la cama con su caja
- `v2_mat_celdas.jpeg`: mat visto por debajo, con las 4 celdas de carga y los topes sobre la base de acero galvanizado
- `v2_mat_celda_tope.jpeg`: detalle de una celda y su tope
- `v2_mat_caja_interior.jpeg`: interior de la caja del mat (UPS, HX711, Wemos D1 R2 y tapa con interruptor y LED)
- `v2_control_exterior.jpeg`: control cerrado, con interruptor, LED, buzzer y pulsador
- `v2_control_interior.jpeg`: interior del control (UPS, Wemos D1 mini, mini protoboard y tapa)

**Videos**
- `v2_prueba_perro.mp4`: un perro de 18 kg sobre el mat, sin alarma
- `v2_prueba_persona_alcance.mp4`: una persona se sube al mat y la cámara sigue hasta el control, que está en el velador de **otra habitación** y suena y enciende el LED
- `v2_prueba_alerta_control.mp4`: el mat y el control, con el LED del control encendido durante la alerta

---

## Resultados de Testing

### Funcionalidad Lograda
✅ El mat lee el peso con las 4 celdas de carga con lecturas estables (variación entre 0,0 y 0,2 kg en reposo, sin cambios al mover los cables)  
✅ El mat detecta cuando el peso supera el umbral y envía la alerta al control por ESP-NOW  
✅ El control hace sonar el buzzer, enciende el LED blanco y el pulsador silencia la alarma  
✅ El mat respeta el tiempo de reposo entre alertas  
✅ LED de estado en el mat y en el control  
✅ Mat y control funcionan con su respaldo de batería  
✅ Calibración con peso conocido  
✅ Alcance de la comunicación medido  
✅ Prueba con personas y con mascotas  
✅ Autonomía del control estimada en 24 a 30 horas (ver Resultados)  
⚠️ Detección de cargador conectado limitada cuando la batería ya está casi llena (ver `limitaciones_deteccion_alimentacion.md`)

### Calibración

- Con el factor inicial (`11150`) el mat marcaba 11,52 kg para un objeto de 6,67 kg.
- Factor corregido: 11150 × 11,52 / 6,67 ≈ **19260**. Con el nuevo factor, la lectura coincide con el peso real.
- Umbral final: **20 kg**, con reposo de **20 s** entre alertas.

### Prueba con personas y mascotas

| Quién se sube al mat | Resultado |
|---|---|
| Persona de más de 20 kg | Se activa la alerta: el control suena y se enciende el LED blanco, incluso estando en otra habitación |
| Perro de 18 kg | Sin alerta |

El mat distingue a una persona de una mascota liviana. Esto es importante para evitar falsas alarmas en casas con animales.

Con el umbral de 20 kg, el mat no alerta con mascotas de menos de ese peso (probado con un perro de 18 kg). Un animal más pesado, o una persona de menos de 20 kg, podría activarlo o no detectarse, por lo que el umbral es ajustable en el código (`UMBRAL_KG`).

### Alcance de la comunicación (ESP-NOW)

| Distancia | Qué había en medio | ¿Llegó la alerta? |
|---|---|---|
| Hasta ~9 m | Sin paredes, en línea de vista | Sí |
| 7,3 m | 2 tabiques de yeso cartón (Volcanita) de 10 cm, atravesando 3 habitaciones contiguas (mat en la 1ª y control en la 3ª) | Sí |
| 3 a 4 m | 1 pared de concreto de 22 cm: habitación de al lado y pieza del segundo piso | Sí |
| ~9 m | Pared de concreto de 22 cm | No |

Los tabiques de yeso cartón casi no afectan la señal; el concreto sí la debilita bastante. No se probaron distancias mayores por falta de espacio, por lo que el alcance máximo no se determinó. Para el uso previsto, dentro de una vivienda, conviene dejar el control a pocos metros del mat y evitar paredes de concreto en medio.

### Autonomía de la batería

Se midió el control en reposo (sin alarma) con una batería 18650 de 1800 mAh, 3,7 V. En unas 3 horas el voltaje bajó de 4,1 V a 4,0 V, lo que equivale a cerca del 10 % de la carga. Con ese ritmo (~60 mA de consumo) se estima una **autonomía del orden de 24 a 30 horas**, más de un día sin enchufar.

Es una estimación a partir de la caída de voltaje, no una medición hasta el apagado. El consumo sube mientras suena la alarma (buzzer y LED encendidos). La autonomía del mat no se midió por separado.

### Feedback del Avance #2

**Comentarios del profesor/ayudante:**
1. Calibrar el mat con más peso para comprobar que funciona.
   - Acción: se calibró con un peso conocido (6,67 kg), se fijó el umbral en 20 kg y se probó con personas de más de 20 kg y con mascotas.
2. Revisar el tema de las baterías.
   - Acción: se instaló el UPS con batería 18650 en el mat (el control ya lo tenía), el control mide su voltaje por A0, se midió el alcance de la comunicación y se estimó la autonomía del control en 24 a 30 horas.
3. Incluir alguna luz LED.
   - Acción: se agregó un LED WS2812 en el mat (estado) y en el control (alarma y batería).
4. Hacer pruebas con personas.
   - Acción: se probó el mat con personas y con mascotas (ver arriba). La evaluación de usabilidad con adultos mayores y cuidadores queda pendiente.

---

## Problemas Pendientes

1. **Detección de cargador con batería casi llena:**
   - Descripción: el control detecta que se enchufó el cargador por un salto de voltaje; si la batería ya está casi llena, el salto es muy pequeño y puede no detectarse.
   - Prioridad: Baja
   - Mejora futura: medir con un pin que detecte directamente los 5 V del cargador.

2. **Control con mini protoboard dentro de la caja:**
   - Descripción: es más estable que el prototipo de la iteración 1, pero las conexiones siguen sin soldar.
   - Prioridad: Media
   - Mejora futura: pasarlo a una placa perforada.

3. **Pared de concreto bloquea la señal:**
   - Descripción: con una pared de concreto de 22 cm la alerta llega a 3–4 m, pero no a ~9 m.
   - Prioridad: Media
   - Mejora futura: repetidor ESP-NOW o antena de mayor ganancia.

4. **Autonomía medida solo de forma aproximada:**
   - Descripción: la autonomía del control se estimó por la caída de voltaje; la del mat no se midió por separado.
   - Prioridad: Baja
   - Mejora futura: medir el tiempo real hasta el apagado de cada equipo, y con la alarma sonando.

5. **Sin evaluación de usabilidad con adultos mayores y cuidadores:**
   - Prioridad: Media
   - Mejora futura: probar con el público objetivo y recoger su opinión.

6. **Alerta con "Entrega FALLO":** si el control está apagado, fuera de alcance o con otra MAC o canal, el mat no puede avisar.
   - Prioridad: Media
   - Mejora futura: que el mat reintente o avise con su propia luz o sonido.

### Problemas de la iteración 1 y su estado

| Problema de la iteración 1 | Estado en la iteración 2 |
|---|---|
| El interruptor del UPS no apaga los pads 5V/GND | Se agregó un interruptor KCD11 en la entrada de 5 V |
| Mat sin respaldo de energía | UPS con batería 18650 instalado en el mat |
| Circuito en protoboard | Resuelto en el mat; el control aún usa una mini protoboard |
| Umbral de peso sin calibrar | Calibrado con peso conocido; umbral de 20 kg |

---

## Comparación v1 vs v2

| Aspecto | v1 | v2 |
|---|---|---|
| Umbral de detección | 1 kg (valor de prueba) | 20 kg |
| Calibración | Sin calibrar | Con peso conocido |
| Alertas repetidas | Sin control | Reposo de 20 s |
| Alimentación del mat | Por cable | UPS con batería 18650 |
| Encendido | Desconectar el cable | Interruptor KCD11 |
| Indicadores | Solo buzzer | Buzzer + LED en el control, LED en el mat |
| Montaje | Protoboard | Mat: caja sin protoboard; control: caja con mini protoboard |
| Estructura del mat | Marco de madera con alfombra | Base de acero galvanizado y acrílico |
| Pruebas | Con un objeto | Con personas y mascotas, y alcance medido |
| Costo documentado | No | BOM con total de $113.520 |

---

## Aprendizajes

### Técnicos
- Las celdas de carga de 3 cables se combinan en un solo puente; invertir el negro y el blanco de una celda cambia el signo de su lectura.
- Las pruebas apretando con la mano no sirven para validar las celdas; hay que cargarlas con la placa puesta y con un peso conocido.
- La calibración sale de una regla simple: factor nuevo = factor anterior × (lectura / peso real).
- El voltaje de la batería sube y baja con la carga, así que detectar el cargador solo por voltaje tiene límites.
- El yeso cartón casi no afecta la señal de ESP-NOW, pero el concreto la debilita mucho.

### De Diseño
- Hay que dejar holgura bajo el extremo libre de cada celda y mantener rígido el extremo fijo.
- La caja necesita aberturas para el cable de las celdas, el micro-USB de carga, el interruptor y el LED.

---

## Archivos en esta Carpeta

- `mat.ino` - Código del mat
- `control.ino` - Código del control
- `esquema_mat.png` - Esquema del circuito del mat
- `esquema_control.png` - Esquema del circuito del control
- `v2_fotos/` - Fotografías y videos del prototipo
- `v2_notas.md` - Problemas identificados y mejoras planificadas
