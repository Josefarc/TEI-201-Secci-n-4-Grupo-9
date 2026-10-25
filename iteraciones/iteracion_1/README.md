# Iteración 1 - Concepto Inicial

## Información General

**Fecha:** 19/10/2026  
**Versión:** v1.0  
**Estado:** Prototipo alpha - Prueba de concepto  
**Avance asociado:** Planificación inicial / Avance #1

---

## Descripción

Primera versión del prototipo SafeRest: un mat con celdas de carga que detecta cuando un adulto mayor se levanta de noche y avisa al cuidador mediante un control remoto con buzzer.

**Objetivo de esta iteración:**
- Probar la lectura de peso con celdas de carga y HX711
- Validar la comunicación inalámbrica entre mat y control (ESP-NOW, sin WiFi)
- Demostrar la alerta sonora y el silenciado con pulsador
- Probar el respaldo de energía con batería ante cortes de luz
- Diseñar en 3D el mat y la caja del control
- Circuito básico en protoboard

---

## Componentes Utilizados

### Hardware
- Microcontrolador: Wemos D1 (ESP8266) en el mat y Wemos D1 mini (ESP8266) en el control
- Sensores:
  - 4 celdas de carga de 50 kg con módulo HX711
- Actuadores:
  - Buzzer (alerta sonora)
- Otros: pulsador, módulo UPS con batería 18650 (control), cargador USB, protoboard, cables de conexión

### Software
- IDE: Arduino IDE
- Librerías: HX711 (bogde v0.7.5), núcleo ESP8266 v3.1.2 (incluye ESP-NOW)
- Versión código: v1.0

---

## Fotos del Prototipo

Incluir en esta carpeta:
- `v1_circuito_protoboard.jpg`
- `v1_vista_general.jpg`
- `v1_detalle_conexiones.jpg`

---

## Resultados de Testing Inicial

### Funcionalidad Lograda
✅ El mat lee el peso con las 4 celdas de carga  
✅ El mat envía la alerta al control por ESP-NOW, sin WiFi  
✅ El control hace sonar el buzzer y el pulsador silencia la alarma  
✅ El control sigue funcionando con la batería 18650 en un corte de energía (probado)  
✅ Modelos 3D del mat y del control con todos sus componentes  
❌ El mat todavía no tiene respaldo de batería instalado  
❌ Alcance de ESP-NOW y autonomía de la batería sin medir  
❌ Sin pruebas con usuarios

### Problemas Identificados

1. **Problema 1: el interruptor del UPS no apaga los pads**
   - Descripción: el interruptor solo corta la salida USB-A. Los pads 5V y GND siguen activos y la batería se descarga aunque esté en OFF.
   - Causa probable: diseño del módulo UPS.
   - Solución propuesta: apagar desconectando el cable de 5 V y dejarlo documentado en el manual.

2. **Problema 2: mat sin respaldo de energía**
   - Descripción: el respaldo con batería solo está probado en el control.
   - Causa probable: el UPS del mat quedó previsto en el diseño, pero no instalado.
   - Solución propuesta: instalar un UPS con batería 18650 dentro de los circuitos del mat.

3. **Problema 3: circuito en protoboard**
   - Descripción: las conexiones son frágiles y los cables quedan sueltos.
   - Causa probable: prototipo de prueba, sin soldaduras ni encapsulado.
   - Solución propuesta: pasar el circuito a una placa perforada e imprimir las cajas diseñadas.

4. **Problema 4: umbral de peso sin calibrar**
   - Descripción: el umbral de detección es un valor de prueba (`UMBRAL_KG`).
   - Causa probable: aún no se calibra con personas reales.
   - Solución propuesta: calibrar con un peso conocido y probar con usuarios.

---

## Aprendizajes

### Técnicos
- ESP-NOW permite comunicar mat y control sin WiFi ni router.
- El HX711 se alimenta con 3V3 por la lógica de 3,3 V del ESP8266.
- Con un UPS, el equipo cambia a la batería automáticamente si se corta la luz.

### De Diseño
- La altura de las celdas de carga define lo bajo que puede quedar el mat.
- Hay que prever en el diseño las aberturas para cargar el UPS y acceder a su interruptor.

---

## Plan para Iteración 2

### Mejoras Planificadas

**Hardware:**
- [ ] Instalar el UPS con batería 18650 en el mat
- [ ] Reemplazar la protoboard por una placa perforada
- [ ] Medir consumo, autonomía de la batería y alcance de ESP-NOW

**Software:**
- [ ] Calibrar el mat con un peso conocido
- [ ] Ajustar el umbral de detección (`UMBRAL_KG`)

**Diseño:**
- [ ] Imprimir la caja del control y la barra de circuitos del mat
- [ ] Mejorar ruteo de cables

**Testing:**
- [ ] Probar con un objeto de mayor peso

---

## Archivos en esta Carpeta

- `v1_codigo.ino` - Código de esta versión
- `v1_esquema.png` - Esquema del circuito
- `v1_fotos/` - Fotografías del prototipo
- `v1_notas.txt` - Notas adicionales del equipo