# Iteración 2 - Notas del Equipo

Prototipo final SafeRest (22/11/2026)

Este archivo detalla los problemas identificados, las limitaciones conocidas y las mejoras planificadas que se resumen en el README de la iteración.

---

## Problemas Resueltos en esta Iteración

### 1. Celdas de carga con lecturas negativas o inestables
- **Descripción:** durante las pruebas, algunas celdas marcaban valores negativos o variaban mucho, y el peso total no coincidía con el real.
- **Causa probable:** conexión de los cables de las celdas (invertir el negro y el blanco de una celda cambia el signo de su lectura) y holgura bajo el extremo libre de cada celda.
- **Solución aplicada:** se revisó el conexionado de las 4 celdas en un solo puente, se ajustaron los topes a ~2 mm de la placa y se probó con la placa puesta, no apretando con la mano.
- **Resultado:** lecturas estables, entre 0,0 y 0,2 kg en reposo, sin cambios al mover los cables.

### 2. Calibración incorrecta
- **Descripción:** con el factor inicial (`11150`) el mat marcaba 11,52 kg para un objeto de 6,67 kg.
- **Causa probable:** factor de escala sin calibrar con un peso conocido.
- **Solución aplicada:** factor nuevo = factor anterior × (lectura / peso real) ≈ 19260.
- **Resultado:** la lectura coincide con el peso real.

### 3. Mat sin respaldo de energía
- **Solución aplicada:** UPS con batería 18650 instalado en el mat.

### 4. El interruptor del UPS no apaga los pads 5V/GND
- **Solución aplicada:** interruptor KCD11 en la entrada de 5 V, en el mat y en el control.

---

## Limitaciones Conocidas

El detalle está en `limitaciones_deteccion_alimentacion.md`.

### 1. Detección del cargador en el control
- **Descripción:** el LED del control indica que se está cargando (naranjo) o que la batería está llena (verde). Para eso necesita saber si hay un cargador conectado.
- **Causa:** al medir con multímetro, todos los pads del módulo UPS marcaron 5 V, con y sin cargador. El módulo no tiene un punto accesible que indique solo la presencia del cargador. La única forma sería soldar un cable al pin de 5 V del micro-USB del UPS, que es muy pequeño y arriesga dañar el módulo.
- **Solución adoptada:** el control infiere el cargador por el voltaje de la batería (pin A0). Si sube de golpe, se enchufó; si baja desde su máximo, se desenchufó.
- **Limitación resultante:** con la batería casi llena, el voltaje casi no cambia al desenchufar y el LED verde puede tardar en apagarse. No afecta la alarma ni el aviso de batería baja.

### 2. Aviso de corte de luz en el mat
- **Descripción:** se quería que el mat avisara al control cuando se corta la corriente de la pared.
- **Causa:** el mismo problema; sin un pad de entrada del cargador no se puede saber si hay corriente. Medir el voltaje de la batería no sirve, porque el mat está casi siempre con la batería llena.
- **Qué queda:** el mat sigue funcionando con la batería durante un corte de luz, pero no avisa que hubo un corte.

---

## Problemas Pendientes

### 1. Control con mini protoboard dentro de la caja
- **Descripción:** es más estable que el prototipo de la iteración 1, pero las conexiones siguen sin soldar.
- **Causa probable:** falta de tiempo para pasar el circuito a una placa perforada.
- **Solución propuesta:** soldar el circuito en una placa perforada.

### 2. Pared de concreto bloquea la señal
- **Descripción:** con una pared de concreto de 22 cm la alerta llega a 3–4 m, pero no a ~9 m. Los tabiques de yeso cartón casi no afectan.
- **Causa probable:** el concreto atenúa la señal de 2,4 GHz.
- **Solución propuesta:** dejar el control cerca del mat, o usar un repetidor ESP-NOW o una antena de mayor ganancia.

### 3. Autonomía medida solo de forma aproximada
- **Descripción:** la autonomía del control se estimó en 24 a 30 horas por la caída de voltaje (de 4,1 V a 4,0 V en ~3 h). La del mat no se midió por separado.
- **Solución propuesta:** medir el tiempo real hasta el apagado de cada equipo, también con la alarma sonando.

### 4. Sin evaluación de usabilidad con adultos mayores y cuidadores
- **Descripción:** se probó el mat con personas y mascotas, pero no se evaluó la facilidad de uso con el público objetivo.
- **Solución propuesta:** probar con adultos mayores y cuidadores y recoger su opinión.

### 5. Alerta con "Entrega FALLO"
- **Descripción:** si el control está apagado, fuera de alcance o con otra MAC o canal, el mat no puede avisar.
- **Solución propuesta:** que el mat reintente o avise con su propia luz o sonido.

---

## Mejoras Planificadas

**Hardware:**
- [ ] Pasar el circuito del control a una placa perforada
- [ ] Usar un módulo UPS o de carga que exponga un pin de estado de carga (por ejemplo, CHRG/STDBY de un TP4056) o un pad de entrada de 5 V
- [ ] Medir la autonomía real del mat y del control

**Software:**
- [ ] Detectar el cargador y el corte de luz con un pin digital (con el módulo anterior), y avisar del corte al control
- [ ] Reintentar el envío o avisar desde el mat cuando la entrega falla

**Diseño:**
- [ ] Repetidor ESP-NOW o antena de mayor ganancia para viviendas con muros de concreto

**Testing:**
- [ ] Pruebas de usabilidad con adultos mayores y cuidadores
- [ ] Medir alcance en distancias mayores