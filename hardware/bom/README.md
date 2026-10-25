# Bill of Materials (BOM)

## Formato del Archivo

El archivo BOM debe incluir las siguientes columnas:

| Columna | Descripción | Ejemplo |
|---------|-------------|---------|
| Cantidad | Número de unidades | 1 |
| Componente | Nombre descriptivo | ESP32 DevKit V1 |
| Especificación | Detalles técnicos | 30 pines, WiFi+BT |
| Fabricante | Marca del componente | Espressif |
| Código/SKU | Identificador único | ESP32-WROOM-32 |
| Proveedor | Tienda/distribuidor | AliExpress, MercadoLibre |
| Precio Unitario | Costo por unidad (CLP) | $8,990 |
| Precio Total | Cantidad × Precio | $8,990 |
| Datasheet | Link a especificaciones | [URL] |

---

## Archivos a Incluir

- `bom_completo.xlsx` - Lista completa de materiales usados hasta ahora (mat y control)
- `bom_completo.pdf` - Versión PDF para visualización
- `datasheets/` - Carpeta con PDFs de componentes críticos (HX711 y celda de carga)

> El BOM incluye solo los materiales utilizados en el prototipo actual y se amplía en cada iteración.

---

## Presupuesto Total

**Costo Total Estimado:** $46.360 CLP

| Sistema | Costo |
|---------|-------|
| Mat | $23.390 |
| Control | $22.970 |

### Desglose por Categoría
- Microcontrolador: $13.480 (Wemos D1 del mat y Wemos D1 mini del control)
- Sensores: $11.900 (4 celdas de carga y módulo HX711)
- Actuadores: $300 (buzzer)
- Estructura/Encapsulado: $0 (por definir: placa de pisada, caja y barra impresas en 3D)
- Otros: $20.680 (módulo UPS, batería 18650, protoboard, cargador, cables y pulsador)