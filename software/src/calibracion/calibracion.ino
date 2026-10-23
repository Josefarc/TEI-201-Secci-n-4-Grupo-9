/*
  SafeRest - Calibracion del mat (celdas de carga + HX711)
  --------------------------------------------------------
  Placa: Wemos D1 (mat). Pasos:
   1. Con el mat vacio y quieto, carga este programa. Toma el cero (tara).
   2. Pon un peso conocido (por ejemplo una botella de 2 kg o 6,5 kg).
   3. Divide la "lectura cruda" por el peso en kg: ese es el FACTOR_ESCALA.
      (En nuestro prototipo resulto aproximadamente 11150.)
   4. Escribe ese valor en FACTOR_ESCALA del programa del mat.
*/
#include <HX711.h>

HX711 balanza;

void setup() {
  Serial.begin(115200);
  balanza.begin(14, 12);            // DT = GPIO14, SCK = GPIO12
  Serial.println("Mat vacio, calibrando cero...");
  delay(3000);
  balanza.tare(20);                 // Promedia 20 lecturas para fijar el cero
  Serial.println("Listo. Pon un peso conocido.");
}

void loop() {
  if (balanza.is_ready()) {
    Serial.print("Lectura cruda: ");
    Serial.println(balanza.get_value(10));   // Promedio de 10 lecturas, sin escala
  }
  delay(500);
}
