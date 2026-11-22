# Librerías

## Librerías Estándar (Arduino IDE)

Instalar desde el Library Manager de Arduino IDE:

1. **HX711 (autor: bogde)** - v0.7.5
   - Propósito: leer las celdas de carga a través del amplificador HX711 (mat).
   - Instalación: `Sketch > Include Library > Manage Libraries > Buscar "HX711"` (autor: bogde).

2. **Adafruit NeoPixel (autor: Adafruit)** - v1.15.5
   - Propósito: controlar el LED WS2812 del mat y del control (estados, alarma y batería). Agregada en la iteración 2.
   - Instalación: `Sketch > Include Library > Manage Libraries > Buscar "Adafruit NeoPixel"` (autor: Adafruit).

3. **ESP8266 Arduino Core (ESP8266WiFi, espnow y user_interface)** - v3.1.2
   - Propósito: soporte de las placas Wemos D1 R2 y D1 mini, y comunicación ESP-NOW entre el mat y el control.
   - Instalación: `Tools > Board > Boards Manager > Buscar "esp8266"`, y luego seleccionar la placa `LOLIN(WEMOS) D1 R2 & mini`.

---

## Librerías Personalizadas/Modificadas

No se usan librerías modificadas ni personalizadas. Todas se instalan desde el Arduino IDE, por eso esta carpeta no incluye archivos de librerías.

---

## Dependencias Completas

| Librería | Versión | Fuente | Usada en | Obligatoria |
|----------|---------|--------|----------|-------------|
| ESP8266WiFi | Incluida en el core 3.1.2 | ESP8266 Arduino Core | Mat y control | ✅ |
| espnow | Incluida en el core 3.1.2 | ESP8266 Arduino Core | Mat y control | ✅ |
| user_interface | Incluida en el core 3.1.2 | ESP8266 Arduino Core | Mat y control | ✅ |
| HX711 (bogde) | 0.7.5 | Arduino Library Manager | Mat | ✅ |
| Adafruit NeoPixel | 1.15.5 | Arduino Library Manager | Mat y control | ✅ |

---

## Cambios respecto a la iteración 1

En la iteración 1 solo se usaban el core ESP8266 (ESP8266WiFi y espnow) y la librería HX711. En la iteración 2 se agregó **Adafruit NeoPixel**, por el LED WS2812 del mat y del control.