# Historial de Iteraciones

## Propósito

Esta carpeta documenta la evolución del prototipo a través de las dos versiones desarrolladas durante el curso: el prototipo alpha (iteración 1, Avance #2) y la versión final (iteración 2, Avance #3).

El Avance #1 fue solo una presentación con la teoría básica y el informe inicial, sin prototipo armado, por lo que no tiene carpeta de iteración.

El proceso iterativo se puede seguir comparando ambas carpetas: cada una tiene su descripción, fotos, esquemas, código y notas de esa versión.

---

## Estructura de Carpetas

Cada iteración tiene su propia carpeta con la documentación de esa versión:

```
iteraciones/
├── iteracion_1/    # Prototipo alpha (Avance #2)
└── iteracion_2/    # Versión final - Prototipo funcional (Avance #3)
```

---

## Contenido de Cada Iteración

Cada carpeta incluye:

1. **README.md** - Descripción de la versión
2. **Fotos** - Imágenes del prototipo en ese estado
3. **Esquema** - Circuito de esa versión
4. **Código** - Versión del software de esa iteración
5. **Notas** - Problemas identificados y mejoras planificadas

---

## Tabla Comparativa de Iteraciones

| Aspecto | v1 | v2 |
|---------|----|----|
| **Fecha** | 19/10/2026 | 22/11/2026 |
| **Estado** | Prototipo alpha - Prueba de concepto | Prototipo funcional final |
| **Sensores** | 4 celdas de carga + HX711 | 4 celdas de carga + HX711; medición de voltaje de batería en el control |
| **Actuadores** | Buzzer | Buzzer + LED WS2812 (mat y control) |
| **Conectividad** | ESP-NOW | ESP-NOW |
| **Alimentación** | Control con UPS y batería 18650; mat por cable | Mat y control con UPS y batería 18650 |
| **Encendido** | Desconectando el cable | Interruptor KCD11 en mat y control |
| **Encapsulado** | Mat: marco de madera con alfombra; control: diseño 3D | Mat: caja eléctrica, base de acero galvanizado y acrílico; control: caja impresa en 3D |
| **Montaje del circuito** | Protoboard | Mat: sin protoboard; control: mini protoboard dentro de la caja |
| **Testing** | Solo el equipo, con un objeto | 5 personas y 2 perros; alcance medido; corte de energía del mat; autonomía estimada; encuesta de 26 respuestas |

---

## Evolución del Diseño

### Versión 1 (Iteración 1) - Prototipo Alpha
**Fecha:** 19/10/2026  
**Estado:** Prototipo alpha - Prueba de concepto

**Características:**
- Mat con 4 celdas de carga y HX711 que detecta el peso
- Prototipo físico del mat: marco de madera con alfombra
- Alerta inalámbrica al control por ESP-NOW (sin WiFi)
- Control con buzzer, pulsador y respaldo con batería 18650 (funciona conectado a la red y sin ella)
- Modelos 3D del mat y del control, BOM y esquemas de conexión
- Circuito del control en protoboard

**Problemas principales:**
- El mat aún no tiene respaldo de batería instalado
- El interruptor del UPS no apaga los pads 5V/GND
- Circuito del control frágil y cajas sin imprimir
- Umbral de peso de prueba (1 kg)

**Aprendizajes clave:**
- ESP-NOW funciona sin WiFi ni router
- Con un UPS el control sigue funcionando sin estar conectado a la corriente eléctrica
- La altura de las celdas y los circuitos limita lo bajo que puede quedar el mat

### Versión 2 (Iteración 2) - Versión Final
**Fecha:** 22/11/2026  
**Estado:** Prototipo funcional final

**Mejoras implementadas:**
- UPS con batería 18650 instalado también en el mat
- Interruptor KCD11 y LED WS2812 en el mat y en el control
- Mat calibrado con peso conocido y umbral de detección fijado en 20 kg
- Tiempo de reposo de 20 s entre alertas
- Estructura nueva del mat: base de acero galvanizado y acrílico sobre las celdas
- Circuitos dentro de cajas (caja eléctrica para el mat y caja impresa en 3D para el control)
- Pruebas con 5 personas (2 adultos mayores) y 2 perros, alcance medido, corte de energía del mat y autonomía estimada
- Encuesta anónima a usuarios con 26 respuestas

**Problemas pendientes:**
- El control aún usa una mini protoboard sin soldar
- La señal ESP-NOW no atraviesa bien paredes de concreto
- No se detecta de forma directa el cargador ni el corte de luz (ver `limitaciones_deteccion_alimentacion.md`)
- Usabilidad con adultos mayores y cuidadores limitada: no hubo pruebas de uso prolongado en su entorno

**Resultado:**
- Sistema completo que detecta a una persona sobre el mat (probado entre 51 y 78 kg), avisa al control (incluso en otra habitación) con sonido y luz, y se silencia con un pulsador. No alertó con perros de 18 y 15 kg. Si se corta la luz, el mat sigue funcionando con su batería.

---

## Justificación de Cambios

### Hardware
**De v1 a v2:**
- **Cambio:** UPS con batería 18650 en el mat.
  - Razón: en la iteración 1 el mat dependía de la alimentación por cable y no funcionaba en un corte de luz.
  - Impacto: el mat sigue funcionando con la batería; se probó desenchufando el cargador, sin que se reiniciara.
- **Cambio:** interruptor KCD11 en la entrada de 5 V del mat y del control.
  - Razón: el interruptor del UPS solo cortaba la salida USB-A y la batería se descargaba igual.
  - Impacto: se pueden apagar los dos equipos sin desconectar cables.
- **Cambio:** LED WS2812 en el mat y en el control.
  - Razón: pedido del feedback del Avance #2, y para mostrar el estado sin depender solo del sonido.
  - Impacto: el control muestra la alarma (blanco), la batería baja (rojo) y la carga (naranjo y verde); el mat muestra su estado de inicio y error.
- **Cambio:** base de acero galvanizado y acrílico en el mat, con topes bajo la placa.
  - Razón: apoyo uniforme sobre las 4 celdas y mayor rigidez.
  - Impacto: lecturas estables (0,0 a 0,2 kg en reposo).
- **Cambio:** circuitos dentro de cajas.
  - Razón: la protoboard abierta era frágil y dejaba los cables sueltos.
  - Impacto: equipos cerrados y transportables.

### Software
**De v1 a v2:**
- Umbral de detección ajustado de 1 kg (valor de prueba) a 20 kg, y factor de calibración corregido con un peso conocido (de 11150 a ≈ 19260).
- Tiempo de reposo de 20 s entre alertas, y envío de la alerta 3 veces por ESP-NOW para asegurar que llegue.
- LED de estado en el mat y en el control, y luz blanca de arranque en el control.
- El control mide el voltaje de su batería y detecta cuándo se conecta o desconecta el cargador.
- El mat informa "Entrega OK" o "Entrega FALLO" según si el control recibió la alerta.

### Diseño 3D
**De v1 a v2:**
- Se pasó del diseño con marco de madera a la estructura final del mat: base de acero galvanizado, acrílico, topes y caja eléctrica con tapa para el interruptor y el LED.
- La caja del control se imprimió en 3D, con aberturas para el interruptor, el LED, el buzzer y el pulsador.

---

## Incorporación de Feedback

### Feedback del Avance #2 → Cambios en v2
1. Calibrar el mat con más peso para comprobar que funciona.
   - Acción tomada: se calibró con un peso conocido (6,67 kg), se fijó el umbral en 20 kg y se probó con 5 personas de entre 51 y 78 kg y con 2 perros.
2. Revisar el tema de las baterías.
   - Acción tomada: UPS con batería 18650 en el mat, prueba de corte de luz del mat, medición de voltaje en el control y autonomía del control estimada en 24 a 30 horas.
3. Incluir alguna luz LED.
   - Acción tomada: LED WS2812 en el mat (estado) y en el control (alarma y batería).
4. Hacer pruebas con personas.
   - Acción tomada: se probó con 5 personas (2 adultos mayores) y 2 perros, y se hizo una encuesta a usuarios. La evaluación con más adultos mayores y cuidadores en su entorno queda pendiente.

### Feedback de Usuarios
Encuesta anónima en Google Forms, con 26 respuestas entre el 11 y el 22 de noviembre de 2026. 18 personas tienen o tuvieron un adulto mayor cercano y respondieron todas las preguntas:
- 89 % se levanta de noche al menos a veces (16 de 18) y 67 % conoce una caída (12 de 18).
- Preocupación por una caída nocturna: promedio de 4,6 sobre 5.
- Utilidad percibida de SafeRest: promedio de 4,6 sobre 5 (las 18 respuestas fueron 4 o 5).
- 83 % lo usaría o probablemente lo usaría (15 de 18; nadie respondió "no").
- 83 % prefirió un compartimento externo conectado a la alfombra, como el diseño del prototipo.
- 72 % considera lo más importante que no moleste al caminar.

Es una muestra por conveniencia, no representativa. El detalle está en `testing/reportes/README.md` y los datos en `testing/datos/`.

---

## Métricas de Mejora

| Métrica | v1 | v2 | Mejora |
|---------|----|----|--------|
| Umbral de detección | 1 kg (valor de prueba) | 20 kg (calibrado) | Detecta a las 5 personas (51 a 78 kg) sin alertar con perros de 18 y 15 kg |
| Calibración del peso | Sin calibrar | Factor corregido (11150 → ≈ 19260) | Con el factor inicial el mat marcaba 11,52 kg para un objeto de 6,67 kg (73 % de error); con el nuevo factor coincide con el peso real |
| Estabilidad en reposo | Sin medir | 0,0 a 0,2 kg | - |
| Alcance de ESP-NOW | Sin medir | ~9 m en línea de vista; 7,3 m con 2 tabiques de yeso cartón; 3 a 4 m con 1 pared de concreto | Alcance medido |
| Autonomía del control | Sin medir | 24 a 30 horas (estimada) | Estimación |
| Corte de luz en el mat | Sin respaldo | Sigue funcionando con su batería, sin reiniciarse | Probado |
| Costo documentado | No | BOM con total de $113.520 CLP | Costo conocido |

---

## Lecciones Aprendidas

### Técnicas
- ESP-NOW permite comunicar mat y control sin WiFi ni router.
- El HX711 se alimenta con 3V3 por la lógica de 3,3 V del ESP8266.
- El interruptor del módulo UPS solo corta la salida USB-A, no los pads de 5 V.
- Las celdas de carga de 3 cables se combinan en un solo puente; invertir el negro y el blanco de una celda cambia el signo de su lectura.
- La calibración sale de una regla simple: factor nuevo = factor anterior × (lectura / peso real).
- El yeso cartón casi no afecta la señal de ESP-NOW, pero el concreto la debilita mucho.
- Detectar el cargador solo por el voltaje de la batería tiene límites cuando la batería está casi llena.

### De Proceso
- Las celdas de carga hay que probarlas con la placa puesta y con un peso conocido, no apretándolas con la mano.
- Conviene medir el alcance y la autonomía con pruebas simples y anotarlas, aunque sean aproximadas.
- Hay que guardar y versionar el código final de cada placa en el repositorio, junto con el esquema y las fotos de esa versión.
- Documentar el costo (BOM) y las fuentes desde el principio evita rehacerlos al final.
- Una encuesta corta con usuarios reales aporta evidencia rápida de utilidad, aunque no sea una muestra representativa.