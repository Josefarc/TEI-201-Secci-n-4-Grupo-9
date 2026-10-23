# Librerías

## Librerías Estándar (Arduino IDE)

Instalar desde el Library Manager de Arduino IDE:

1. **HX711 (autor: bogde)** - v0.7.5
   - Propósito: leer las celdas de carga a través del amplificador HX711.
   - Instalación: `Sketch > Include Library > Manage Libraries > Buscar "HX711"` (autor: bogde).

2. **ESP8266 Arduino Core (ESP8266WiFi y espnow)** - v3.1.2
   - Propósito: soporte de las placas Wemos D1 y D1 Mini, y comunicación ESP-NOW entre el mat y el control.
   - Instalación: `Tools > Board > Boards Manager > Buscar "esp8266"`, y luego seleccionar la placa `LOLIN(WEMOS) D1 R2 & mini`.

---

## Librerías Personalizadas/Modificadas

No se usan librerías modificadas ni personalizadas. Todas se instalan desde el Arduino IDE, por eso esta carpeta no incluye archivos de librerías.

---

## Dependencias Completas

| Librería | Versión | Fuente | Obligatoria |
|----------|---------|--------|-------------|
| ESP8266WiFi | Incluida en el core 3.1.2 | ESP8266 Arduino Core | ✅ |
| espnow | Incluida en el core 3.1.2 | ESP8266 Arduino Core | ✅ |
| HX711 (bogde) | 0.7.5 | Arduino Library Manager | ✅ |