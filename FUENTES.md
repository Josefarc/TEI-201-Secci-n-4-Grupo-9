# Fuentes y referencias

## Librerías de software

| Librería | Uso | Versión | Enlace |
|---|---|---|---|
| HX711 (autor: bogde) | Lectura de las celdas de carga a través del amplificador HX711 | 0.7.5 | https://github.com/bogde/HX711 |
| Adafruit NeoPixel | Control del LED WS2812 del mat y del control | 1.15.5 | https://github.com/adafruit/Adafruit_NeoPixel |
| ESP8266 Arduino Core (ESP8266WiFi, espnow) | Soporte de las placas ESP8266 y comunicación ESP-NOW | 3.1.2 | https://github.com/esp8266/Arduino |

**Instalación:**
- `HX711`: Arduino IDE → Gestor de Librerías → buscar "HX711" (autor: Bogdan Necula, bogde).
- `Adafruit NeoPixel`: Arduino IDE → Gestor de Librerías → buscar "Adafruit NeoPixel" (autor: Adafruit).
- Placas ESP8266: Arduino IDE → Preferencias → agregar la URL del gestor de placas del ESP8266 → Gestor de Placas → instalar "esp8266". Luego elegir la placa `LOLIN(WEMOS) D1 R2 & mini`.

## Hardware y datasheets

Los datasheets descargados están en `hardware/bom/datasheets/` y el detalle de cada componente (código, proveedor y precio) en `hardware/bom/bom_completo.xlsx`.

| Componente | Documento | Enlace |
|---|---|---|
| HX711 | Datasheet, Avia Semiconductor | https://cdn.sparkfun.com/datasheets/Sensors/ForceFlex/hx711_english.pdf |
| Módulo HX711 | Ficha del vendedor (Afel) | https://afel.cl/products/sensor-peso-y-presion-transmisor-de-celda-de-carga-hx711 |
| Celdas de carga 50 kg | Datasheet (`hardware/bom/datasheets/celda_carga_datasheet.pdf`) y ficha del vendedor (Hubot) | https://hubot.cl/producto/celda-de-carga-50-kg/ |
| ESP-NOW | Descripción del protocolo, Espressif | https://www.espressif.com/en/products/software/esp-now/overview |
| Wemos D1 R2 (mat) | Ficha del vendedor (Afel) | https://afel.cl/products/wemos-d1-wifi-esp8266-microcontrolador?variant=45125241274520 |
| Wemos D1 mini (control) | Documentación de la placa y ficha del vendedor (Afel) | https://www.wemos.cc/en/latest/d1/d1_mini.html · https://afel.cl/products/wemos-d1-mini-esp8266-wifi-esp-12f?variant=45125214142616 |
| Buzzer activo | Ficha del vendedor (Afel) | https://afel.cl/products/buzzer-activo?variant=45125217190040 |
| Pulsador | Ficha del vendedor (Afel) | https://afel.cl/products/boton-tactil-tapa-12x12x7-3-interruptor?variant=45125247631512 |
| Transistor 2N2222 | Datasheet (`hardware/bom/datasheets/2N2222_datasheet.pdf`, variante P2N2222A) y ficha del vendedor (Hubot) | https://hubot.cl/producto/transistor-2n2222-to-92-sku-668h3/ |
| Módulo LED RGB (WS2812) | Ficha del vendedor (Hubot) | https://hubot.cl/producto/modulo-led-rgb-ws2811-sku-480f2/ |
| Módulo UPS con batería 18650 | Ficha del vendedor (Hubot) | https://hubot.cl/producto/modulo-cargador-usb-para-bateria-18650-v3-para-mcu-sku-672/ |
| Batería 18650 de 1800 mAh | Ficha del vendedor (Afel) | https://afel.cl/products/bateria-recargable-18650-3-7v-1800mah?variant=47345143513240 |
| Interruptor KCD11 | Ficha del vendedor (Hubot) | https://hubot.cl/producto/interruptor-switch-kcd11-10x15mm-2-posiciones-on-off-sku-4101/ |
| Resistencias (1 kΩ y 100 kΩ) | Ficha del vendedor (Hubot) | https://hubot.cl/producto/20-resistencias-14w-1-distintos-valores/ |
| Mini protoboard de 170 puntos | Ficha del vendedor (Hubot) | https://hubot.cl/producto/mini-protoboard-de-170-puntos-para-ensayos-de-circuitos/ |
| Cargador USB 5 V | Ficha del vendedor (Hubot) | https://hubot.cl/producto/adaptador-dc-raspberry-pi-3-5v-3-amperes/ |
| Cable micro-USB | Ficha del vendedor (MCI Electronics) | https://mcielectronics.cl/shop/product/cable-micro-usb-30cm/ |
| Cables de conexión (Dupont) | Ficha del vendedor (Afel) | https://afel.cl/products/cable-dupont-plano-40-pines-1mt?variant=45125273223320 |
| Caja eléctrica ABS 150 x 110 x 70 mm | Datasheet (`hardware/bom/datasheets/caja_electrica_datasheet.pdf`) y ficha del vendedor (Vitel Energía) | https://vitelenergia.com/es/caja-dist-abs-150x110x70mm-ip55-s-conos-l-h.html |

### Materiales con precio de mercado referencial

Estos materiales se reutilizaron, así que su costo en el BOM es proporcional al precio de mercado del producto de referencia.

| Material | Producto de referencia | Enlace |
|---|---|---|
| Plancha de acero galvanizado | Bandeja zincada MJM de 500 x 3000 mm, 1,5 mm (Dartel) | https://www.dartel.cl/bandeja-lisa-recta-500x100x3000-zincada-espesor-1-5mm-405021037-mjm/p |
| Plancha de acrílico transparente | Acrílico de 8 mm, 122 x 244 cm (DVP) | https://www.dvp.cl/acrilicos-y-publicidad/acrilico/acrilico-8mm-transparente-122x244mts-3020100074060.html |
| Espiral protector de cables | Espiral negro Ø4-6 mm, rollo de 10 m (Vitel Energía) | https://vitelenergia.com/es/espiral-negro-o4-6mm-rollo-10mts.html |
| Caja del control (impresión 3D) | Filamento PLA eSUN de 1 kg (Paris.cl). La impresión fue cedida por la universidad | https://www.paris.cl/filamentos-pla-esun-1kg-175mm-transparente-MKDUWZ4JQQ.html |
| Alfombra | Compra en tienda física Easy | Sin enlace |

## Herramientas

- Arduino IDE 2.x
- Autodesk Fusion 360 (modelado 3D, Fusion Electronics para los esquemas `.fsch`, y scripts en Python mediante su API). Documentación: https://help.autodesk.com/view/fusion360/ENU/
- Mermaid (diagramas de flujo de `software/docs/`), que GitHub muestra directamente en el README. https://mermaid.js.org
- GitHub Desktop
- Google Forms (encuesta a usuarios, ver `testing/`)

## Referencias del problema (ODS 3 y caídas en adultos mayores)

BAU Accesibilidad. (2025). *Senama: 43% de las caídas de adultos mayores se produce en sus viviendas*. https://bauaccesibilidad.cl/blogs/news/adaptabilidad-universal-vivienda-adultos-mayores

Portal Red Salud. (2025, 27 octubre). *Mes del Adulto Mayor: Los riesgos de las caídas y la complejidad de la recuperación*. https://portalredsalud.cl/2025/10/27/mes-del-adulto-mayor-los-riesgos-de-las-caidas-y-la-complejidad-de-la-recuperacion/

Anthropic. (2026). *Claude* [Modelo de lenguaje de gran escala]. https://claude.ai

## Código propio

El código del mat y del control (`software/src/`) fue desarrollado por el equipo a partir de la documentación de las librerías anteriores. Las pruebas, la calibración y los ajustes (umbral de 20 kg, factor de escala de 19260) se hicieron con el prototipo real.

## Uso de inteligencia artificial

Para la elaboración de este proyecto se utilizó apoyo de inteligencia artificial (Claude, Anthropic) en la redacción y organización de la documentación (README), corrección ortográfica, búsqueda de materiales, elaboración y revisión de código, y formato de las fuentes en estilo APA. Las pruebas, mediciones y decisiones de diseño se realizaron con el prototipo real.