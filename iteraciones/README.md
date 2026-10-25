# Historial de Iteraciones

## Propósito

Esta carpeta documenta la evolución del prototipo a través de las diferentes versiones desarrolladas durante el curso.

---

## Estructura de Carpetas

Cada iteración tiene su propia carpeta con documentación de esa versión:

```
iteraciones/
├── iteracion_1/    # Concepto inicial - Prototipo alpha
├── iteracion_2/    # Primera iteración - Avance #2
└── iteracion_3/    # Versión final - Avance #3
```

---

## Contenido de Cada Iteración

Cada carpeta incluye:

1. **README.md** - Descripción de la versión
2. **Fotos** - Imágenes del prototipo en ese estado
3. **Esquema** - Circuito de esa versión 
4. **Código** - Versión del software
5. **Notas** - Problemas identificados y mejoras planificadas

---

## Tabla Comparativa de Iteraciones

| Aspecto | v1 | v2 | v3 |
|---------|----|----|----| 
| **Fecha** | 19/10/2026 | [fecha] | [fecha] |
| **Sensores** | 4 celdas de carga + HX711 | [lista] | [lista] |
| **Actuadores** | Buzzer | [lista] | [lista] |
| **Conectividad** | ESP-NOW | [tipo] | [tipo] |
| **Encapsulado** | Mat: marco de madera y control: diseño 3D | Prototipo | Finalizado |
| **Testing** | Solo equipo | 2 usuarios | 5+ usuarios |
| **Funcionalidad** | 50% | 80% | 100% |

---

## Evolución del Diseño

### Versión 1 (Iteración 1) - Concepto Inicial
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

### Versión 2 (Iteración 2) - Primera Mejora
**Fecha:** [XX/XX/2026]  
**Estado:** Prototipo funcional mejorado

**Mejoras implementadas:**
- [Mejora 1]
- [Mejora 2]

**Problemas pendientes:**
- [Problema 1]
- [Problema 2]

### Versión 3 (Iteración 3) - Versión Final
**Fecha:** [XX/XX/2026]  
**Estado:** Prototipo de alta resolución

**Mejoras finales:**
- [Mejora 1]
- [Mejora 2]

**Resultado:**
- [Resultado]

---

## Justificación de Cambios

### Hardware
**De v1 a v2:**
- Cambio: [Descripción]
- Razón: [Justificación técnica]
- Impacto: [Mejora cuantitativa]

**De v2 a v3:**
- Cambio: [Descripción]
- Razón: [Justificación técnica]
- Impacto: [Mejora cuantitativa]

### Software
**De v1 a v2:**
- [Cambios principales]

**De v2 a v3:**
- [Cambios principales]

### Diseño 3D
**De v1 a v2:**
- [Cambios en encapsulado]

**De v2 a v3:**
- [Cambios finales]

---

## Incorporación de Feedback

### Feedback del Avance #1 → Cambios en v2
1. [Comentario profesor/ayudante]
   - Acción tomada: [Descripción]

### Feedback del Avance #2 → Cambios en v3
1. [Comentario profesor/ayudante]
   - Acción tomada: [Descripción]

### Feedback de Usuarios → Cambios en v3
1. [Comentario común de usuarios]
   - Acción tomada: [Descripción]

---

## Métricas de Mejora

| Métrica | v1 | v2 | v3 | Mejora Total |
|---------|----|----|----| -------------|
| Tiempo respuesta (ms) | [por medir] | [por medir] | [por medir] | [por calcular] |
| Consumo (mA) | [por medir] | [por medir] | [por medir] | [por calcular] |
| Tasa de errores (%) | [por medir] | [por medir] | [por medir] | [por calcular] |
| Satisfacción usuario (1-5) | [por medir] | [por medir] | [por medir] | [por calcular] |

---

## Lecciones Aprendidas

### Técnicas
- ESP-NOW permite comunicar mat y control sin WiFi ni router.
- El HX711 se alimenta con 3V3 por la lógica de 3,3 V del ESP8266.
- El interruptor del módulo UPS solo corta la salida USB-A, no los pads de 5 V.

### De Proceso
- [Lección 1]
- [Lección 2]

### De Trabajo en Equipo
- [Lección 1]
- [Lección 2]