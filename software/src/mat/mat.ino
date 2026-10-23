/*
  SafeRest - MAT (Wemos D1)
  -------------------------
  Lee el peso con 4 celdas de carga (HX711). Si alguien pisa el mat y el
  peso supera el umbral de forma sostenida, envia una alerta al control
  por ESP-NOW (sin WiFi ni internet).

  Conexiones: HX711 DT -> GPIO14, SCK -> GPIO12.
*/
#include <ESP8266WiFi.h>
#include <espnow.h>
#include <HX711.h>
extern "C" {
  #include <user_interface.h>
}

// MAC del control (leerla con el programa mac.ino y reemplazarla si cambia la placa)
uint8_t macControl[] = {0x2C, 0xF4, 0x32, 0x7B, 0x6E, 0x2B};

const uint8_t PIN_DT  = 14;
const uint8_t PIN_SCK = 12;

const float FACTOR_ESCALA = 11150.0;        // Obtenido con calibracion.ino
const float UMBRAL_KG = 1.0;                // VALOR DE PRUEBA. Para uso real, ajustarlo
                                            // midiendo el peso de una persona al pisar el mat.
const unsigned long CONFIRMA_MS = 300;      // El peso debe mantenerse este tiempo
const unsigned long REPOSO_MS   = 8000;     // Espera minima entre alertas
const uint8_t CANAL = 1;

typedef struct {
  uint8_t tipo;                              // 1 = alerta, 2 = atendida
} Mensaje;

HX711 balanza;
bool pisado = false;
unsigned long inicioPeso = 0, ultimaAlerta = 0, ultimoPrint = 0;

// Se ejecuta al recibir un mensaje del control
void alRecibir(uint8_t *mac, uint8_t *datos, uint8_t largo) {
  Mensaje m;
  memcpy(&m, datos, sizeof(m));
  if (m.tipo == 2) Serial.println("El cuidador atendio la alarma");
}

// Informa si el mensaje llego al control
void alEnviar(uint8_t *mac, uint8_t estado) {
  Serial.println(estado == 0 ? "Entrega OK" : "Entrega FALLO");
}

// Envia la alerta 3 veces para asegurar que llegue
void enviarAlerta() {
  Mensaje m = {1};
  for (int i = 0; i < 3; i++) {
    esp_now_send(macControl, (uint8_t *)&m, sizeof(m));
    delay(100);
  }
  Serial.println("ALERTA enviada");
}

// Espera a que el HX711 responda (evita reinicios si hay un mal contacto)
void esperarHX711() {
  unsigned long t0 = millis();
  while (!balanza.is_ready()) {
    if (millis() - t0 > 3000) {
      Serial.println("HX711 no responde: revisa VCC, GND, DT y SCK");
      t0 = millis();
    }
    delay(10);
  }
}

void setup() {
  Serial.begin(115200);
  delay(500);
  Serial.println();
  Serial.println("Iniciando HX711...");

  // Primero el sensor y la tara, antes de activar WiFi (evita reinicios)
  balanza.begin(PIN_DT, PIN_SCK);
  balanza.set_scale(FACTOR_ESCALA);
  esperarHX711();
  Serial.println("Mat vacio y quieto...");
  delay(3000);
  balanza.tare(20);
  Serial.println("Cero tomado");

  // Despues, la comunicacion ESP-NOW
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  wifi_set_channel(CANAL);

  if (esp_now_init() != 0) {
    Serial.println("Error al iniciar ESP-NOW");
    return;
  }
  esp_now_set_self_role(ESP_NOW_ROLE_COMBO);
  esp_now_add_peer(macControl, ESP_NOW_ROLE_COMBO, CANAL, NULL, 0);
  esp_now_register_recv_cb(alRecibir);
  esp_now_register_send_cb(alEnviar);
  Serial.println("Mat listo");
}

void loop() {
  if (!balanza.is_ready()) return;

  float peso = balanza.get_units(1);

  // Muestra el peso una vez por segundo
  if (millis() - ultimoPrint > 1000) {
    Serial.print("Peso (kg): ");
    Serial.println(peso, 2);
    ultimoPrint = millis();
  }

  if (peso > UMBRAL_KG) {
    if (inicioPeso == 0) inicioPeso = millis();
    // Peso sostenido: confirma que es un paso real y envia la alerta
    if (!pisado && millis() - inicioPeso >= CONFIRMA_MS) {
      pisado = true;
      if (ultimaAlerta == 0 || millis() - ultimaAlerta > REPOSO_MS) {
        enviarAlerta();
        ultimaAlerta = millis();
      }
    }
  } else {
    inicioPeso = 0;
    pisado = false;
  }
}
