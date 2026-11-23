# Datos de Testing

Resultados de las pruebas del prototipo SafeRest y de la encuesta a usuarios. Los datos de las pruebas son de la iteración 2 (versión final) y se comparan con la iteración 1 cuando hay información. Las pruebas se hicieron con el mat armado y el control funcionando, y en `hardware/fotos/` hay videos de varias de ellas.

---

## Archivos de datos

| Archivo | Contenido |
|---|---|
| `respuestas_encuesta.xlsx` | Respuestas originales de la encuesta (26 respuestas, anónimas), exportadas de Google Forms |
| `Resultados_encuesta_SafeRest.pdf` | Gráficos con los resultados de cada pregunta de la encuesta, exportados de Google Forms |

El resto de los datos, es decir las pruebas del prototipo, están en este mismo README.

---

## Resumen de resultados (iteración 2)

| Prueba | Condición | Resultado |
|---|---|---|
| Detección de personas | 5 personas de 51, 55, 57, 65 y 78 kg pisan el mat (2 de ellas adultos mayores) | Las 5 activaron la alarma en el control |
| Mascotas | 2 perros de 18 y 15 kg sobre el mat | Ninguno activó la alarma |
| Alcance ESP-NOW, línea de vista | Mat y control sin obstáculos | ~9 m sin problemas |
| Alcance ESP-NOW, yeso cartón | 2 tabiques (3 habitaciones) | 7,3 m |
| Alcance ESP-NOW, concreto | Pared de concreto de 22 cm | 3 a 4 m; a ~9 m no llegó la señal |
| Autonomía del control | Batería 18650 de 1800 mAh, ~60 mA en reposo | 24 a 30 h (estimada) |
| Corte de energía del mat | Se desenchufa el cargador con el mat encendido | Sigue funcionando con la batería, sin reiniciarse |
| Calibración | Objeto de 6,67 kg con el factor inicial | Leía 11,52 kg; factor corregido a 19260 |
| Encuesta | 26 respuestas anónimas (18 con un adulto mayor cercano) | Utilidad percibida 4,6 de 5; 83 % lo usaría o probablemente lo usaría |

---

## Detalle de las pruebas

### 1. Detección de personas y mascotas
- **Umbral final:** 20 kg, con 20 s de reposo entre alertas.

| Sujeto | Peso | Resultado esperado | Resultado obtenido |
|---|---|---|---|
| Persona 1 | 51 kg | Alarma | Alarma |
| Persona 2 | 55 kg | Alarma | Alarma |
| Persona 3 | 57 kg | Alarma | Alarma |
| Persona 4 (adulta mayor, mujer, 78 años) | 65 kg | Alarma | Alarma |
| Persona 5 (adulto mayor, hombre, 61 años) | 78 kg | Alarma | Alarma |
| Perro 1 | 18 kg | Sin alarma | Sin alarma |
| Perro 2 | 15 kg | Sin alarma | Sin alarma |

- **Aciertos:** 7 de 7 pruebas, es decir, las 5 personas activaron la alarma y los 2 perros no.
- **Funcionamiento:** al pisar el mat, el control suena con el buzzer y el LED blanco parpadeando. También se probó con el control en otra habitación, como lo usaría un cuidador en la noche.
- **Videos:** perro de 18 kg en `hardware/fotos/v2_prueba_perro.mp4`, persona de 55 kg en `hardware/fotos/v2_prueba_persona_alcance.mp4` y funcionamiento del control en `hardware/fotos/v2_prueba_alerta_control.mp4`.

### 2. Alcance de la comunicación ESP-NOW
| Escenario | Distancia | Resultado |
|---|---|---|
| Línea de vista | ~9 m | Funciona |
| 2 tabiques de yeso cartón (3 habitaciones) | 7,3 m | Funciona |
| 1 pared de concreto de 22 cm | 3 a 4 m | Funciona |
| 1 pared de concreto de 22 cm | ~9 m | No llega la alerta |

Conclusión: en una casa con tabiques el alcance es suficiente, pero las paredes de concreto lo reducen mucho, así que conviene dejar el control cerca del mat.

- **Video:** `hardware/fotos/v2_prueba_persona_alcance.mp4`.

### 3. Autonomía de la batería del control
- **Medición:** con la batería cargada a 4,1 V, después de ~3 h de funcionamiento bajó a 4,0 V.
- **Consumo:** ~60 mA en reposo (estimado, no medido con instrumento).
- **Estimación:** 24 a 30 h de funcionamiento continuo con una batería 18650 de 1800 mAh.
- **Pendiente:** una descarga completa para confirmar el valor. La del mat no se midió.

### 4. Calibración del mat
- **Iteración 1:** factor 11150. Con un objeto de 6,67 kg el mat leía 11,52 kg.
- **Corrección:** factor nuevo = factor anterior × (lectura / peso real) ≈ 19260.
- **Iteración 2:** `FACTOR_ESCALA = 19260.0`.

### 5. Corte de energía del mat
- **Objetivo:** comprobar que el mat sigue funcionando si se corta la luz, gracias a su batería 18650.
- **Procedimiento:** con el mat vacío, encendido y conectado al cargador USB (que carga el módulo UPS), se desenchufó el cargador para simular un corte de luz.
- **Resultado:** el mat no se reinició (no repitió el LED amarillo ni los 3 destellos verdes) y siguió funcionando con la batería.
- **Límites de la prueba:** no se midió cuánto dura el mat solo con la batería, porque el consumo del mat no se midió.
- **Video:** `hardware/fotos/v2_prueba_corte_energia.mp4`.

---

## Encuesta a usuarios

Encuesta anónima en Google Forms ("SafeRest: Tecnología para el cuidado de adultos mayores"), con 26 respuestas recibidas entre el 11 y el 22 de noviembre de 2026. 18 personas tienen o tuvieron un adulto mayor cercano y respondieron las 13 preguntas. Las otras 8 solo respondieron las 3 primeras. Es una muestra de conveniencia, no representativa.

| Indicador (18 personas con un adulto mayor cercano) | Resultado |
|---|---|
| Se levanta de noche (frecuentemente o a veces) | 16 de 18 (89 %) |
| Conoce al menos una caída | 12 de 18 (67 %) |
| Preocupación por una caída nocturna (1 a 5) | Promedio 4,6 |
| Utilidad percibida de SafeRest (1 a 5) | Promedio 4,6; las 18 respuestas fueron 4 o 5 |
| Usaría un dispositivo como SafeRest | 15 de 18 (83 %): 5 "Sí" y 10 "Probablemente sí"; nadie respondió que no |
| Ubicación preferida del compartimento | 15 de 18 (83 %) eligió un compartimento externo conectado a la alfombra |
| Característica más importante del compartimento | "Que no interfiera al caminar": 13 de 18 (72 %) |

El detalle de cada pregunta está en `testing/reportes/README.md`, los gráficos de cada pregunta en `Resultados_encuesta_SafeRest.pdf` y las respuestas originales en `respuestas_encuesta.xlsx`.

---

## Comparación entre iteraciones

| Aspecto | Iteración 1 | Iteración 2 |
|---|---|---|
| Umbral de detección | 1 kg (valor de prueba) | 20 kg |
| Reposo entre alertas | 8 s | 20 s |
| Factor de calibración | 11150 | 19260 |
| Alcance medido | Sin medir | ~9 m en línea de vista |
| Autonomía del control | Sin medir | 24 a 30 h (estimada) |
| Distinción persona / mascota | No | Sí (20 kg): 5 de 5 personas detectadas y 2 de 2 perros ignorados |
| Alimentación del mat | Cable USB | UPS con batería 18650: sigue funcionando si se corta la luz |

---

## Pruebas pendientes

- Probar con personas de menos de 50 kg (por ejemplo, un adulto mayor muy liviano): las 5 personas probadas pesaban entre 51 y 78 kg, así que no se verificó el rango entre 20 y 51 kg.
- Pruebas formales de usabilidad con más adultos mayores y cuidadores (hasta ahora solo se probó con 2 adultos mayores).
- Descarga completa de la batería del control y medición del consumo del mat (para saber cuánto dura el mat solo con la batería).
- Probar con más mascotas, en especial perros de peso cercano a 20 kg.

---

## Evidencia

- Videos de las pruebas: `hardware/fotos/` (`v2_prueba_perro.mp4`, `v2_prueba_persona_alcance.mp4`, `v2_prueba_alerta_control.mp4`, `v2_prueba_corte_energia.mp4`).
- Reporte completo: `testing/reportes/README.md`.
- Descripción completa de la iteración y sus pruebas: `iteraciones/iteracion_2/README.md`.