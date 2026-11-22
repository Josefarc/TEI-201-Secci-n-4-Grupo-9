/*
  SafeRest - MAT (Wemos D1 R2)
  ----------------------------
  Lee el peso de las 4 celdas de carga (HX711). Cuando alguien se sube al mat
  y el peso supera el umbral de forma sostenida, envia una alerta al control
  por ESP-NOW (sin WiFi ni router).

  Logica de la alerta:
   - Se alerta cuando el peso > UMBRAL_KG durante CONFIRMA_MS seguidos.
   - Una vez alertado, "pisado" queda activo y no se repite la alerta
     mientras el peso siga sobre el umbral. Se libera cuando el peso baja
     a UMBRAL_KG o menos.
   - Entre una alerta y la siguiente deben pasar al menos REPOSO_MS.
   - La alerta se envia 3 veces seguidas para asegurar que llegue.

  LED RGB (WS2812):
   - Amarillo: iniciando y haciendo la tara (el mat debe estar sin peso)
   - 3 destellos verdes: listo
   - Rojo intermitente: error (no responde el HX711)

  Conexiones:
   - HX711: DT -> D5 (GPIO14), SCK -> D6 (GPIO12), alimentado con 3V3
   - D7 (GPIO13) -> resistencia 1k -> DIN del LED WS2812
   - Alimentacion: UPS con bateria 18650 -> interruptor -> 5V
*/
#include <ESP8266WiFi.h>
#include <espnow.h>
#include <HX711.h>
#include <Adafruit_NeoPixel.h>
extern "C" {
  #include <user_interface.h>
}

// ---- Parametros ----
const float UMBRAL_KG            = 20.0;      // peso minimo para alertar
const unsigned long REPOSO_MS    = 20000;     // tiempo minimo entre alertas (20 s)
const unsigned long CONFIRMA_MS  = 300;       // el peso debe mantenerse sobre el umbral
const float FACTOR_ESCALA        = 19260.0;   // calibrado con peso conocido

// ---- Pines ----
const uint8_t PIN_DT  = 14;   // D5
const uint8_t PIN_SCK = 12;   // D6
const uint8_t PIN_LED = 13;   // D7

// ---- ESP-NOW ----
// MAC del control (leerla con mac.ino y reemplazarla si cambia la placa)
uint8_t macControl[] = {0x2C, 0xF4, 0x32, 0x7B, 0x6E, 0x2B};
const uint8_t CANAL = 1;

typedef struct { uint8_t tipo; } Mensaje;   // 1 = alerta, 2 = atendida

HX711 balanza;
Adafruit_NeoPixel led(1, PIN_LED, NEO_GRB + NEO_KHZ800);

bool pisado = false;
unsigned long sobreDesde = 0;     // desde cuando el peso esta sobre el umbral (0 = no lo esta)
unsigned long ultimaAlerta = 0;
bool hayAlertaPrevia = false;

void colorLed(uint8_t r, uint8_t g, uint8_t b) {
  led.setPixelColor(0, led.Color(r, g, b));
  led.show();
}

void alEnviar(uint8_t *mac, uint8_t estado) {
  Serial.println(estado == 0 ? "Entrega OK" : "Entrega FALLO");
}

void alRecibir(uint8_t *mac, uint8_t *datos, uint8_t largo) {
  Mensaje m;
  memcpy(&m, datos, sizeof(m));
  if (m.tipo == 2) Serial.println("Alarma atendida en el control");
}

void enviarAlerta() {
  Mensaje m = {1};
  for (int i = 0; i < 3; i++) {
    esp_now_send(macControl, (uint8_t *)&m, sizeof(m));
    delay(50);
  }
  Serial.println("Alerta enviada");
}

void errorHX711() {
  Serial.println("Error: el HX711 no responde");
  while (true) {                       // rojo intermitente
    colorLed(255, 0, 0); delay(300);
    colorLed(0, 0, 0);   delay(300);
  }
}

void setup() {
  Serial.begin(115200);
  led.begin();
  led.setBrightness(40);
  colorLed(255, 150, 0);               // amarillo: iniciando

  balanza.begin(PIN_DT, PIN_SCK);
  if (!balanza.wait_ready_timeout(3000)) errorHX711();
  balanza.set_scale(FACTOR_ESCALA);
  balanza.tare(10);                    // tara con el mat sin peso

  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  wifi_set_channel(CANAL);

  if (esp_now_init() != 0) {
    Serial.println("Error al iniciar ESP-NOW");
    errorHX711();                      // tambien indica error con el LED rojo
  }
  esp_now_set_self_role(ESP_NOW_ROLE_COMBO);
  esp_now_add_peer(macControl, ESP_NOW_ROLE_COMBO, CANAL, NULL, 0);
  esp_now_register_send_cb(alEnviar);
  esp_now_register_recv_cb(alRecibir);

  for (int i = 0; i < 3; i++) {        // 3 destellos verdes: listo
    colorLed(0, 255, 0); delay(200);
    colorLed(0, 0, 0);   delay(200);
  }
  Serial.println("Mat listo");
}

void loop() {
  if (!balanza.is_ready()) return;
  float peso = balanza.get_units(3);
  unsigned long ahora = millis();

  Serial.printf("Peso: %.1f kg\n", peso);

  if (peso > UMBRAL_KG) {
    if (!pisado) {
      if (sobreDesde == 0) sobreDesde = ahora;
      if (ahora - sobreDesde >= CONFIRMA_MS) {
        pisado = true;                 // ya se detecto; no repetir hasta que baje el peso
        if (!hayAlertaPrevia || ahora - ultimaAlerta >= REPOSO_MS) {
          enviarAlerta();
          ultimaAlerta = ahora;
          hayAlertaPrevia = true;
        }
      }
    }
  } else {
    sobreDesde = 0;
    pisado = false;                    // el peso bajo del umbral: queda listo de nuevo
  }
}
