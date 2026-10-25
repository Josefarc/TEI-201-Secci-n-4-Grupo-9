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
- Estructura del mat: marco de madera con alfombra sobre las celdas de carga (prototipo físico)

### Software
- IDE: Arduino IDE
- Librerías: HX711 (bogde v0.7.5), núcleo ESP8266 v3.1.2 (incluye ESP-NOW)
- Versión código: v1.0

---

## Fotos del Prototipo

Incluidas en la carpeta `v1_fotos/`:
- `v1_control_circuito.jpg`: circuito del control en protoboard con Wemos D1 mini, pulsador, buzzer y módulo UPS con batería 18650
- `v1_mat_armado.jpg`: prototipo del mat armado, con marco de madera y alfombra
- `v1_mat_celdas.jpg`: mat visto sin la alfombra, con las 4 celdas de carga fijadas a la placa de aluminio
- `v1_mat_circuito.jpg`: electrónica del mat (Wemos D1, HX711 y cableado desde las celdas) vista por debajo
- `v1_prueba_funcionamiento.mp4`: prueba del sistema completo con una pesa sobre el mat, el control recibe la alerta por ESP-NOW y activa el buzzer
- `v1_sistema_completo.jpg`: mat y control lado a lado

---

## Resultados de Testing Inicial

### Funcionalidad Lograda
✅ El mat lee el peso con las 4 celdas de carga  
✅ El mat envía la alerta al control por ESP-NOW, sin WiFi  
✅ El control hace sonar el buzzer y el pulsador silencia la alarma  
✅ El control sigue funcionando con la batería 18650 en un corte de energía (probado)  
✅ Prototipo físico del mat armado (marco de madera con alfombra)  
✅ Modelos 3D del mat y del control con todos sus componentes  
❌ El mat todavía no tiene respaldo de batería instalado  
❌ Alcance de ESP-NOW y autonomía de la batería sin medir  
❌ Sin pruebas con usuarios

Los problemas identificados y las mejoras planificadas están detallados en `v1_notas.txt`.

---

## Aprendizajes

### Técnicos
- ESP-NOW permite comunicar mat y control sin WiFi ni router.
- El HX711 se alimenta con 3V3 por la lógica de 3,3 V del ESP8266.
- Con un UPS, el control cambia a la batería automáticamente si se corta la luz.

### De Diseño
- La altura de las celdas de carga y de los circuitos define lo bajo que puede quedar el mat.
- Hay que prever en el diseño las aberturas para cargar el UPS y acceder a su interruptor.

---

## Archivos en esta Carpeta

- `mat.ino` - Código del mat
- `control.ino` - Código del control
- `esquema_mat.png` - Esquema del circuito del mat
- `esquema_control.png` - Esquema del circuito del control
- `v1_fotos/` - Fotografías del prototipo 
- `v1_notas.txt` - Problemas identificados y mejoras planificadas