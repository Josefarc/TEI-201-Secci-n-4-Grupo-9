/*
  SafeRest - Lectura de la direccion MAC
  --------------------------------------
  Carga este programa en cada placa (una a la vez) y abre el Monitor Serial
  a 115200 baudios. Anota la MAC que aparece: se usa para que el mat y el
  control se reconozcan entre si por ESP-NOW.
*/
#include <ESP8266WiFi.h>

void setup() {
  Serial.begin(115200);
  delay(500);
  WiFi.mode(WIFI_STA);              // La MAC de estacion es la que usa ESP-NOW
  Serial.println();
  Serial.print("MAC: ");
  Serial.println(WiFi.macAddress());
}

void loop() {
  // No hace nada: solo se necesita leer la MAC una vez.
}
