# Diseño 3D - Documentación

## ⚠️ REQUISITO CRÍTICO
✅ Encapsulado exterior completo (Base de la caja y tapa con marco de microswitch, aro de buzzer y rejilla)
✅ Placa Wemos D1 mini (con dimensiones exactas y pines/rieles)
✅ Todos los sensores en posición de instalación (Módulo HX711 y celdas de carga asociados al sistema general)
✅ Todos los actuadores (Buzzer Ø 10 mm, microswitch 12×12 mm, pulsador impreso)
✅ Batería / fuente de alimentación (Batería 18650 y Módulo UPS 105 × 29 mm con USB-A, micro-USB e interruptor)
✅ Cableado (Routing aproximado para cables del UPS al Wemos, buzzer, microswitch, etc.)
✅ Sistema de montaje (Pies de apoyo, tornillos M2/M3 para Wemos y UPS)
✅ Orificios de ventilación (Rejilla incluida en la tapa)

**NO ES ACEPTABLE:** Solo el encapsulado vacío sin componentes internos

---

## Carpetas

#### `fusion360/`
Archivos nativos de Fusion 360 (.f3d)

#### `renders/`
Imágenes renderizadas de alta calidad

#### `planos/`
Planos técnicos con cotas

---

## Especificaciones

Software: Autodesk Fusion 360
Unidades: Milímetros (mm)
Escala: 1:1 (dimensiones reales)
Dimensiones externas: 111 mm × 72,6 mm × 33,5 mm (Base de la caja)
Peso estimado: ~85-120 gramos (dependiendo del relleno e impresión de la caja y tapa)
Material: PETG / PLA (según preferencia de resistencia mecánica y térmica)

---

## Consideraciones de Diseño

### Funcionales
Acceso a puertos USB/alimentación del módulo UPS e interruptor lateral/trasero.
Ventilación adecuada mediante rejilla integrada en la tapa.
Protección y sujeción firme de componentes electrónicos sensibles (Wemos, protoboard y batería).
Fácil acceso para mantenimiento de la batería 18650 y la circuitería interna.
Resistencia a condiciones ambientales estándar de uso.

### Fabricación
Imprimible sin soportes excesivos (diseñado con orientaciones óptimas para la base y la tapa).
Tolerancias de ensamble (+0.2 mm) para encaje de la tapa, pulsador y componentes.
Grosor de pared mínimo de 2 mm para garantizar robustez estructural.
Sin ángulos imposibles (overhangs controlados por debajo de 45° o manejo de puentes en la rejilla).

---

## Configuración de Impresión 3D (si fue utilizada)

**Impresora:** [Modelo]  
**Material:** [PLA/ABS/PETG]  
**Calidad de capa:** 0.2mm  
**Relleno:** 20-30%  
**Soportes:** [Sí/No - dónde]  
**Temperatura nozzle:** [°C]  
**Temperatura cama:** [°C]  
**Velocidad:** [mm/s]

**Tiempo estimado de impresión:** [3.5 a 5 horas]  
**Peso de material:** 110g]
