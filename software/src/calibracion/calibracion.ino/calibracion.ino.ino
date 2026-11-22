/*
  SafeRest - CONTROL (Wemos D1 Mini)
  ----------------------------------
  Recibe la alerta del mat por ESP-NOW y hace sonar un buzzer.
  El cuidador lo silencia con un boton, y el control avisa al mat
  que la alarma fue atendida.

  LED RGB (WS2812):
   - Blanco intermitente: solo mientras suena la alarma (se apaga al apretar el boton)
   - Rojo fijo: bateria bajo ~20 % (se mantiene hasta que se conecte el cargador)
   - Naranjo: cargando (desde que se enchufa hasta llegar a ~100 %)
   - Verde: bateria cargada (>= 4,1 V) y aun enchufado
   - Al desenchufar, naranjo/verde se apagan en ~1 s
   - Apagado: el resto del tiempo (ahorra bateria)

  Conexiones:
   - D5 (GPIO14) -> resistencia 1k -> base del transistor 2N2222 (buzzer)
   - D6 (GPIO12) -> boton -> GND (INPUT_PULLUP)
   - D1 (GPIO5)  -> resistencia 1k -> DIN del LED WS2812
   - A0          -> bateria (+) por resistencia de 100k
   - Alimentacion: UPS con bateria 18650 -> interruptor -> 5V
*/
#include <ESP8266WiFi.h>
#include <espnow.h>
#include <Adafruit_NeoPixel.h>
extern "C" {
  #include <user_interface.h>
}

// MAC del mat (leerla con mac.ino y reemplazarla si cambia la placa)
uint8_t macMat[] = {0x24, 0xD7, 0xEB, 0xF2, 0x89, 0xF8};

const uint8_t PIN_BUZZER = 14;      // D5
const uint8_t PIN_BOTON  = 12;      // D6
const uint8_t PIN_LED    = 5;       // D1
const uint8_t CANAL = 1;

// ---- Bateria ----
const float FACTOR_V     = 4.07;    // calibrado con multimetro
const float V_BAJA       = 3.55;    // ~20 %  -> rojo
const float V_LLENA      = 4.10;    // ~100 % -> verde
const float SALTO_ENCHUFE = 0.03;   // subida (V) en 2 s que indica que se enchufo el cargador
const float CAIDA_DESENCHUFE = 0.03; // caida (V) desde el maximo que indica que se desenchufo
const unsigned long T_MEDIR = 2000;  // se compara cada 2 s

enum Estado { NORMAL, BAJA, CARGANDO, LLENA };
Estado estado = NORMAL;

float vActual = 4.0;
float vAnterior = 0;
float vPico = 0;
unsigned long ultimaMedida = 0;
unsigned long ultimaLectura = 0;
unsigned long ignorarHasta = 0;      // tras una alarma el voltaje se recupera: no confundir con enchufe

Adafruit_NeoPixel led(1, PIN_LED, NEO_GRB + NEO_KHZ800);

typedef struct { uint8_t tipo; } Mensaje;   // 1 = alerta, 2 = atendida
volatile bool alarmaActiva = false;

void alRecibir(uint8_t *mac, uint8_t *datos, uint8_t largo) {
  Mensaje m;
  memcpy(&m, datos, sizeof(m));
  if (m.tipo == 1) alarmaActiva = true;
}

void colorLed(uint8_t r, uint8_t g, uint8_t b) {
  led.setPixelColor(0, led.Color(r, g, b));
  led.show();
}

float leerBateria() {
  long suma = 0;
  for (int i = 0; i < 16; i++) suma += analogRead(A0);
  return (suma / 16.0) / 1023.0 * FACTOR_V;
}

// Actualiza el estado de bateria (se llama cada 1 s)
void actualizarBateria() {
  float v = leerBateria();
  vActual = (vAnterior == 0) ? v : (vActual * 0.6 + v * 0.4);
  bool cargando = (estado == CARGANDO || estado == LLENA);

  if (millis() < ignorarHasta) {            // despues de la alarma: solo recalibrar
    vAnterior = vActual; vPico = vActual;
  } else {
    if (cargando) {
      if (vActual > vPico) vPico = vActual;
      if (vActual < vPico - CAIDA_DESENCHUFE) {      // desenchufado: se apaga casi al tiro
        estado = (vActual < V_BAJA) ? BAJA : NORMAL;
        vPico = 0;
      }
    } else if (millis() - ultimaMedida >= T_MEDIR) {
      if (vAnterior > 0 && vActual > vAnterior + SALTO_ENCHUFE) {
        estado = CARGANDO; vPico = vActual;
      }
    }
  }
  if (millis() - ultimaMedida >= T_MEDIR) { vAnterior = vActual; ultimaMedida = millis(); }

  if (estado == CARGANDO && vActual >= V_LLENA) estado = LLENA;
  if (estado == NORMAL && vActual < V_BAJA) estado = BAJA;   // rojo hasta enchufar
  if (estado == BAJA && vActual >= V_BAJA + 0.1) estado = NORMAL;
}

void mostrarBateria() {
  switch (estado) {
    case BAJA:     colorLed(255, 0, 0);   break;  // rojo fijo
    case CARGANDO: colorLed(255, 100, 0); break;  // naranjo
    case LLENA:    colorLed(0, 255, 0);   break;  // verde
    default:       colorLed(0, 0, 0);     break;  // apagado
  }
}

void setup() {
  pinMode(PIN_BUZZER, OUTPUT);
  digitalWrite(PIN_BUZZER, LOW);
  pinMode(PIN_BOTON, INPUT_PULLUP);
  Serial.begin(115200);

  led.begin();
  led.setBrightness(40);
  colorLed(0, 0, 0);

  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  wifi_set_channel(CANAL);

  if (esp_now_init() != 0) {
    Serial.println("Error al iniciar ESP-NOW");
    return;
  }
  esp_now_set_self_role(ESP_NOW_ROLE_COMBO);
  esp_now_add_peer(macMat, ESP_NOW_ROLE_COMBO, CANAL, NULL, 0);
  esp_now_register_recv_cb(alRecibir);

  vActual = leerBateria();
  if (vActual < V_BAJA) estado = BAJA;
  else if (vActual >= V_LLENA) estado = LLENA;

  colorLed(255, 255, 255);          // luz blanca de arranque
  digitalWrite(PIN_BUZZER, HIGH);   // pitido de arranque
  delay(200);
  digitalWrite(PIN_BUZZER, LOW);
  delay(1500);                       // la luz blanca queda ~1 s en total
  mostrarBateria();                 // vuelve al estado de la bateria (apagado, rojo, etc.)
  Serial.println("Control listo");
}

void loop() {
  if (alarmaActiva) {
    // Buzzer y LED blanco sincronizados: 300 ms encendido, 300 ms apagado
    bool on = (millis() / 300) % 2 == 0;
    digitalWrite(PIN_BUZZER, on ? HIGH : LOW);
    if (on) colorLed(255, 255, 255); else colorLed(0, 0, 0);

    if (digitalRead(PIN_BOTON) == LOW) {
      delay(30);
      if (digitalRead(PIN_BOTON) == LOW) {
        alarmaActiva = false;
        digitalWrite(PIN_BUZZER, LOW);
        ignorarHasta = millis() + 5000;
        mostrarBateria();
        Mensaje m = {2};
        esp_now_send(macMat, (uint8_t *)&m, sizeof(m));
        while (digitalRead(PIN_BOTON) == LOW) delay(10);
      }
    }
    return;
  }

  // Sin alarma: indicar estado de bateria
  if (millis() - ultimaLectura >= 1000) {
    ultimaLectura = millis();
    actualizarBateria();
    mostrarBateria();
    Serial.printf("Bateria: %.2f V  estado: %d\n", vActual, (int)estado);
  }
}