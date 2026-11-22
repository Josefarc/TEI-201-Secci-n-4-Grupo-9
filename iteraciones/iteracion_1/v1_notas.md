ITERACIÓN 1 - NOTAS DEL EQUIPO
Prototipo alpha SafeRest (19/10/2026)

Este archivo detalla los problemas identificados y las mejoras planificadas
que se resumen en el README de la iteración.

==================================================
PROBLEMAS IDENTIFICADOS
==================================================

1. El interruptor del UPS no apaga los pads 5V/GND
   - Descripción: el interruptor del módulo UPS solo corta la salida USB-A.
     Los pads 5V y GND siguen activos y la batería se descarga aunque el
     interruptor esté en OFF.
   - Causa probable: diseño del módulo UPS.
   - Solución propuesta: apagar el control desconectando el cable de 5 V y
     dejarlo documentado en el manual de usuario.

2. Mat sin respaldo de energía
   - Descripción: el respaldo con batería solo está probado en el control.
     El mat depende de la alimentación por cable.
   - Causa probable: el UPS del mat quedó previsto en el diseño 3D, pero no
     se instaló en el prototipo.
   - Solución propuesta: instalar un UPS con batería 18650 en el mat.

3. Circuito en protoboard
   - Descripción: las conexiones son frágiles y los cables quedan sueltos.
   - Causa probable: es un prototipo de prueba, sin soldaduras ni
     encapsulado.
   - Solución propuesta: pasar el circuito a una placa perforada e imprimir
     las cajas diseñadas.

4. Umbral de peso sin calibrar
   - Descripción: el umbral de detección (UMBRAL_KG) es un valor de prueba
     de 1 kg.
   - Causa probable: aún no se calibra con pesos más altos ni con personas.
   - Solución propuesta: calibrar con un peso más alto y probar con objetos
     más pesados.

==================================================
MEJORAS PLANIFICADAS
==================================================

Hardware:
[ ] Instalar el UPS con batería 18650 en el mat
[ ] Reemplazar la protoboard por una placa perforada
[ ] Medir consumo, autonomía de la batería y alcance de ESP-NOW

Software:
[ ] Calibrar el mat con un peso conocido
[ ] Ajustar el umbral de detección (UMBRAL_KG)

Diseño:
[ ] Imprimir la caja del control
[ ] Mejorar el ruteo de cables

Testing:
[ ] Probar con un objeto de mayor peso