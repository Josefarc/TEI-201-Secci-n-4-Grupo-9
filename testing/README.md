# Testing y Validación

## Objetivo
Validar el funcionamiento del prototipo SafeRest con personas reales y conocer la opinión de personas cercanas al cuidado de adultos mayores sobre el sistema.

---

## 📁 Carpetas

#### `reportes/`
Reporte de testing con usuarios: participantes, protocolo, resultados, conclusiones y limitaciones.

#### `evidencias/`
Descripción de los videos y fotos de las pruebas. Los archivos están en `hardware/fotos/`.

#### `datos/`
Datos de las pruebas (detección, alcance, autonomía y calibración) y de la encuesta, incluidos el Excel con las respuestas originales (`respuestas_encuesta.xlsx`) y los gráficos de cada pregunta (`Resultados_encuesta_SafeRest.pdf`).

---

## Metodología de Testing

Se hicieron dos tipos de evaluación sobre la versión final del prototipo (iteración 2).

### 1. Pruebas del prototipo
- **Participantes:** 5 personas de 51, 55, 57, 65 y 78 kg (2 de ellas adultos mayores, de 78 y 61 años) y 2 perros de 18 y 15 kg.
- **Procedimiento:** con el mat encendido y vacío (para que tome el cero), cada persona pisa el mat y se observa si el control suena. Lo mismo con cada perro. También se probó con el control en otra habitación.
- **Alcance y autonomía:** se probó la comunicación a distintas distancias y con distintas paredes, y se midió el voltaje de la batería del control para estimar su duración.
- **Umbral de detección:** 20 kg, con al menos 20 s entre alertas.

### 2. Encuesta a usuarios
- Cuestionario anónimo de 13 preguntas en Google Forms, con 26 respuestas entre el 11 y el 22 de noviembre de 2026.
- 18 personas tienen o tuvieron un adulto mayor cercano y respondieron todas las preguntas. Las otras 8 solo respondieron las 3 primeras.
- Temas: experiencia con adultos mayores, caídas, preocupación, utilidad percibida de SafeRest, intención de uso y ubicación preferida del compartimento electrónico.

---

## Resultados principales

| Aspecto | Resultado |
|---|---|
| Detección de personas | 5 de 5 activaron la alarma |
| Mascotas | 0 de 2 perros activaron la alarma |
| Alcance ESP-NOW | ~9 m en línea de vista; 7,3 m con 2 tabiques; 3 a 4 m con una pared de concreto de 22 cm |
| Autonomía del control | 24 a 30 h (estimada) |
| Preocupación por una caída nocturna (encuesta, 1 a 5) | Promedio 4,6 |
| Utilidad percibida de SafeRest (encuesta, 1 a 5) | Promedio 4,6 |
| Usaría SafeRest (encuesta) | 83 % (Sí o Probablemente sí) |
| Compartimento preferido (encuesta) | 83 % eligió uno externo conectado a la alfombra |

El detalle completo está en `datos/README.md` y en `reportes/README.md`.

---

## Validación de Impacto ODS

**ODS seleccionado:** ODS 3, Salud y Bienestar.

**Meta específica del proyecto:** reducir el riesgo y el tiempo de respuesta ante caídas nocturnas de adultos mayores, avisando al cuidador cuando la persona se levanta de la cama.

**Qué se validó:**
- El prototipo detecta a personas de más de 20 kg y no se activa con mascotas pequeñas.
- La alerta llega al cuidador sin WiFi ni internet, hasta ~9 m en línea de vista.
- La encuesta muestra la necesidad: 89 % de las personas con un adulto mayor cercano dice que este se levanta de noche al menos a veces, y 67 % conoce al menos una caída.
- La encuesta muestra aceptación: utilidad percibida de 4,6 de 5 y 83 % lo usaría.

**Qué no se midió:** una reducción real de caídas, que requiere un estudio de más duración con el prototipo instalado en hogares. Por eso los resultados muestran necesidad y aceptación, no impacto comprobado.

---

## Limitaciones y pendientes
- Las personas probadas pesaban entre 51 y 78 kg, así que no se verificó el rango entre 20 y 51 kg.
- Solo se probó con 2 adultos mayores. Faltan pruebas de usabilidad con más adultos mayores y cuidadores.
- La autonomía del control es una estimación y no se midió el consumo del mat.
- La encuesta es una muestra de conveniencia, no representativa.