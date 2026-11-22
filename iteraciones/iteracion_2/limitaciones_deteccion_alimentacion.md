# Limitaciones conocidas: detección del cargador / corte de luz

Este documento reúne dos funciones que se quisieron agregar y que **no se implementaron como se planeó**, con el motivo y la solución adoptada. Es para releerlo después y para el informe.

## Causa común

Al medir con multímetro los pads del módulo UPS (18650), **todos marcaron 5 V**, tanto con el cargador enchufado como sin él (con la batería puesta). El módulo entrega la misma tensión por todos sus pads y **no tiene un punto accesible que indique solo la presencia del cargador**.

La única forma de obtener esa señal sería soldar un cable directamente al pin de 5 V del conector micro-USB del UPS. Ese pin es muy pequeño y la soldadura es delicada: hay riesgo de dañar el módulo, y la complejidad no se justifica para un prototipo. Por eso **se consideró dejar ambas soluciones como están**.

La idea descartada era medir esos 5 V con un divisor de voltaje de 3 resistencias de 100 kΩ (1 en serie y 2 en serie a GND) hacia un pin digital de la Wemos (D2 en el control, D1 en el mat), de modo que el pin lea 1 con cargador y 0 sin cargador.

---

## 1. Control: indicación de carga con el LED

### Qué se quería lograr

El LED del control indica el estado de la batería:

- **Naranjo:** el control se está cargando.
- **Verde:** batería cargada (aprox. 4,1 V o más).
- **Rojo:** batería bajo ~20 % (aprox. 3,55 V).
- **Blanco intermitente:** alarma activa (junto con el buzzer).

Para que el naranjo y el verde se apaguen apenas se desenchufa el cargador, lo ideal es saber **con certeza** si hay cargador conectado.

### Solución adoptada

El control detecta el cargador **por el voltaje de la batería**, leído en el pin A0:

- Si el voltaje sube de golpe, se interpreta que se enchufó el cargador (LED naranjo).
- Si el voltaje baja respecto de su máximo, se interpreta que se desenchufó (el LED se apaga).
- Al llegar a 4,1 V o más con el cargador conectado, el LED pasa a verde.
- Después de una alarma se ignoran los cambios de voltaje durante 5 s, para no confundir la recuperación de la batería con un cargador.

### Limitación resultante

Este método **infiere** el cargador y no lo mide directamente. Con la batería **casi llena**, el cargador entrega muy poca corriente, por lo que al desenchufar el voltaje casi no cambia. En ese caso el LED verde puede tardar en apagarse o quedarse encendido.

Esto **no afecta** la función principal: la alarma (buzzer y LED blanco) y el aviso de batería baja (LED rojo) funcionan de forma independiente.

---

## 2. Mat: aviso de corte de luz

### Qué se quería lograr

Que el mat detecte cuando se corta la corriente de la pared (pasa a funcionar con la batería del UPS) y avise al control por ESP-NOW.

### Por qué no se implementó

Es el mismo problema: sin un pad de entrada del cargador, el mat no puede saber si hay corriente de pared. Medir el voltaje de la batería no sirve aquí, porque el mat está casi siempre con la batería llena (donde el cambio de voltaje al cortarse la luz es mínimo y poco confiable).

### Qué queda en el mat

El mat solo agrega el módulo UPS, de modo que **sigue funcionando con la batería durante un corte de luz**. Lo único que no existe es el **aviso** de que hubo un corte.

---

## Posible mejora futura

Usar un módulo UPS o de carga que exponga un pin de estado de carga (por ejemplo, la señal CHRG/STDBY de un TP4056) o un pad de entrada de 5 V, y leerlo con un pin digital de la Wemos mediante un divisor de voltaje. Con eso se podrían implementar ambas funciones de forma confiable, y el mat podría enviar un aviso de corte de luz al control.
