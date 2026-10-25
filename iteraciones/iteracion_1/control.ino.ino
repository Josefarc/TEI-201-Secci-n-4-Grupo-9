/*
  SafeRest - CONTROL (Wemos D1 Mini)
  ----------------------------------
  Recibe la alerta del mat por ESP-NOW y hace sonar un buzzer.
  El cuidador lo silencia con un boton, y el control avisa al mat
  que la alarma fue atendida.

  Conexiones:
   - D5 (GPIO14) -> resistencia 1k -> base del transistor 2N2222 (maneja el buzzer)
   - D6 (GPIO12) -> boton -> GND (usa INPUT_PULLUP)
   - Alimentacion: modulo UPS (pads 5V y GND) con bateria 18650
*/
#include <ESP8266WiFi.h>
#include <espnow.h>
extern "C" {
  #include <user_interface.h>
}

// MAC del mat (leerla con el programa mac.ino y reemplazarla si cambia la placa)
uint8_t macMat[] = {0x24, 0xD7, 0xEB, 0xF2, 0x89, 0xF8};

const uint8_t PIN_BUZZER = 14;      // D5
const uint8_t PIN_BOTON  = 12;      // D6
const uint8_t CANAL = 1;            // Mat y control deben usar el mismo canal

// Mensaje entre dispositivos: 1 = alerta, 2 = atendida
typedef struct {
  uint8_t tipo;
} Mensaje;

volatile bool alarmaActiva = false;

// Se ejecuta al recibir un mensaje del mat
void alRecibir(uint8_t *mac, uint8_t *datos, uint8_t largo) {
  Mensaje m;
  memcpy(&m, datos, sizeof(m));
  if (m.tipo == 1) alarmaActiva = true;
}

void setup() {
  pinMode(PIN_BUZZER, OUTPUT);
  digitalWrite(PIN_BUZZER, LOW);
  pinMode(PIN_BOTON, INPUT_PULLUP);
  Serial.begin(115200);

  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  wifi_set_channel(CANAL);

  if (esp_now_init() != 0) {
    Serial.println("Error al iniciar ESP-NOW");
    return;
  }
  esp_now_set_self_role(ESP_NOW_ROLE_COMBO);       // Puede enviar y recibir
  esp_now_add_peer(macMat, ESP_NOW_ROLE_COMBO, CANAL, NULL, 0);
  esp_now_register_recv_cb(alRecibir);

  // Pitido corto de arranque
  digitalWrite(PIN_BUZZER, HIGH);
  delay(200);
  digitalWrite(PIN_BUZZER, LOW);
  Serial.println("Control listo");
}

void loop() {
  if (!alarmaActiva) return;

  // Buzzer intermitente: 300 ms encendido, 300 ms apagado
  digitalWrite(PIN_BUZZER, (millis() / 300) % 2 == 0 ? HIGH : LOW);

  // Boton presionado: silenciar y avisar al mat
  if (digitalRead(PIN_BOTON) == LOW) {
    delay(30);                                      // Antirrebote
    if (digitalRead(PIN_BOTON) == LOW) {
      alarmaActiva = false;
      digitalWrite(PIN_BUZZER, LOW);
      Mensaje m = {2};
      esp_now_send(macMat, (uint8_t *)&m, sizeof(m));
      while (digitalRead(PIN_BOTON) == LOW) delay(10);  // Espera a que suelten el boton
    }
  }
}
