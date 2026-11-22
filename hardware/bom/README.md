# Bill of Materials (BOM)

## Formato del Archivo

El archivo BOM incluye las siguientes columnas:

| Columna | Descripción | Ejemplo |
|---------|-------------|---------|
| Sistema | Parte del prototipo donde se usa | Mat, Control, Control y Mat |
| Categoría | Tipo de componente | Microcontrolador, Sensores, Actuadores, Estructura, Otros |
| Cantidad | Número de unidades | 1 |
| Componente | Nombre descriptivo | Wemos D1 mini (ESP8266) |
| Especificación | Detalles técnicos | ESP-NOW |
| Fabricante | Marca del componente | Kuongshun |
| Código | Identificador del producto | 1513 |
| Proveedor | Tienda y enlace del producto | afel.cl |
| Precio Unitario | Costo por unidad (CLP) | $4.990 |
| Precio Total | Cantidad × Precio | $4.990 |
| Datasheet | Ficha técnica o enlace a las especificaciones | `datasheets/HX711_datasheet.pdf` |

---

## Archivos a Incluir

- `bom_completo.xlsx` - Lista completa de materiales usados hasta ahora (mat y control), con una hoja de resumen del presupuesto por categoría
- `bom_completo.pdf` - Versión PDF para visualización
- `datasheets/` - Carpeta con los PDF de componentes críticos (HX711, celda de carga, transistor 2N2222 y caja eléctrica)

> El BOM incluye solo los materiales utilizados en el prototipo actual.
> Se mantiene como un único archivo, actualizado con la versión vigente del prototipo.

---

## Criterio de Costos

Los materiales que no se compraron para este proyecto (reutilizados, sobrantes o prestados por la universidad) figuran con su **costo de mercado referencial**, calculado a partir de un producto equivalente en una tienda y proporcional a la cantidad usada. En la columna Especificación se indica el cálculo, y en Proveedor la tienda y el enlace del producto de referencia.

Materiales con costo referencial: plancha de acero galvanizada, plancha de acrílico, espiral protector de cables y caja impresa en 3D (control).

---

## Presupuesto Total

**Costo Total Estimado:** $113.520 CLP

| Sistema | Costo |
|---------|-------|
| Mat | $78.951 |
| Control | $15.989 |
| Control y Mat (componentes compartidos) | $18.580 |

### Desglose por Categoría
- Microcontrolador: $13.480 (Wemos D1 del mat y Wemos D1 mini del control)
- Sensores: $11.900 (4 celdas de carga y módulo HX711)
- Actuadores: $2.380 (buzzer, transistor 2N2222 y 2 módulos LED RGB WS2812)
- Estructura: $60.150 (plancha de acero galvanizada, plancha de acrílico, caja eléctrica, espiral protector, alfombra y caja impresa en 3D)
- Otros: $25.610 (2 módulos UPS, 2 baterías 18650, 2 interruptores KCD11, protoboard, cargador, cable micro-USB, cables de conexión, pulsador y resistencias de 1 kΩ y 100 kΩ)