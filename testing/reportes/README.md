# Reporte de Testing con Usuarios - SafeRest

**Proyecto:** SafeRest (ODS 3, Salud y Bienestar), TEI201, Universidad Adolfo Ibáñez
**Versión del prototipo:** iteración 2 (versión final)
**Fecha:** 22-11-2026

---

## 1. Introducción

### Objetivo
Verificar que el prototipo SafeRest cumple su función: detectar cuando una persona se levanta y pisa el mat, avisar al cuidador mediante el control, y no activarse con mascotas. Además, conocer la experiencia de personas cercanas al cuidado de adultos mayores y recoger su opinión sobre el sistema.

### Metodología
Se hicieron dos tipos de evaluación:
1. **Pruebas del prototipo** con 5 personas (2 de ellas adultos mayores) y 2 perros, además de pruebas de alcance y de autonomía.
2. **Encuesta anónima** en Google Forms, con 26 respuestas, sobre el contexto de cuidado de adultos mayores, la utilidad percibida de SafeRest y preferencias de diseño.

---

## 2. Descripción de Participantes

### Pruebas del prototipo
| Sujeto | Peso | Perfil |
|---|---|---|
| Persona 1 | 51 kg | Adulta |
| Persona 2 | 55 kg | Adulta |
| Persona 3 | 57 kg | Adulta |
| Persona 4 | 65 kg | Adulta mayor, mujer, 78 años |
| Persona 5 | 78 kg | Adulto mayor, hombre, 61 años |
| Perro 1 | 18 kg | Mascota |
| Perro 2 | 15 kg | Mascota |

### Encuesta
- **Respuestas:** 26, recibidas entre el 11 y el 22 de noviembre de 2026. Es voluntaria y anónima (no se pidieron nombres ni datos de contacto).
- **Perfil:** 18 personas (69 %) tienen o tuvieron un familiar o persona cercana adulta mayor. Estas 18 respondieron el cuestionario completo. Las otras 8 (31 %) no tienen una persona adulta mayor cercana y solo respondieron las primeras 3 preguntas.
- **Muestra:** de conveniencia, entre personas cercanas al equipo. No es representativa de la población.

| Pregunta 1: ¿tiene o tuvo un adulto mayor cercano? | Respuestas |
|---|---|
| Sí | 18 (69 %) |
| No | 8 (31 %) |

| Pregunta 2: ¿ha participado en su cuidado? | Respuestas |
|---|---|
| Sí, de manera frecuente | 3 (12 %) |
| Sí, ocasionalmente | 15 (58 %) |
| No | 8 (31 %) |

| Pregunta 3: ¿vive o vivió con una persona adulta mayor? | Respuestas |
|---|---|
| Sí, actualmente | 4 (15 %) |
| Sí, antes, pero ya no | 10 (38 %) |
| No | 12 (46 %) |

---

## 3. Protocolo Aplicado

### Pruebas del prototipo
1. Se enciende el mat con la superficie vacía y quieta, para que tome el cero (tara) y se enciende el control.
2. Cada persona pisa el mat. Se observa si el control suena, con el buzzer y el LED blanco parpadeando.
3. Cada perro se sube al mat. Se observa que el control no suene.
4. Se repite con el control en otra habitación.
5. Se mide el alcance de la comunicación ESP-NOW a distintas distancias y con distintas paredes.
6. Se mide el voltaje de la batería del control durante su funcionamiento para estimar la autonomía.
- **Umbral de detección:** 20 kg, con al menos 20 s entre alertas.

### Encuesta
Cuestionario de 13 preguntas en Google Forms, con tres bloques:
- **Contexto (preguntas 1 a 3):** cercanía con adultos mayores.
- **Experiencia (4 a 8):** si vive de manera independiente, si se levanta sola de noche, si tuvo caídas y cuánto preocupan.
- **Opinión sobre SafeRest y diseño (9 a 13):** utilidad percibida (1 a 5), intención de uso y preferencia de ubicación del compartimento electrónico.

---

## 4. Resultados Cuantitativos

### 4.1 Detección de personas y mascotas
| Sujeto | Peso | Resultado esperado | Resultado obtenido |
|---|---|---|---|
| Persona 1 | 51 kg | Alarma | Alarma |
| Persona 2 | 55 kg | Alarma | Alarma |
| Persona 3 | 57 kg | Alarma | Alarma |
| Persona 4 | 65 kg | Alarma | Alarma |
| Persona 5 | 78 kg | Alarma | Alarma |
| Perro 1 | 18 kg | Sin alarma | Sin alarma |
| Perro 2 | 15 kg | Sin alarma | Sin alarma |

**Resultado: 7 de 7 pruebas correctas.** Las 5 personas activaron la alarma y los 2 perros no. El control también sonó con el control en otra habitación.

### 4.2 Alcance de la comunicación
| Escenario | Distancia | Resultado |
|---|---|---|
| Línea de vista | ~9 m | Funciona |
| 2 tabiques de yeso cartón (3 habitaciones) | 7,3 m | Funciona |
| 1 pared de concreto de 22 cm | 3 a 4 m | Funciona |
| 1 pared de concreto de 22 cm | ~9 m | No llega la alerta |

### 4.3 Autonomía del control
Con la batería a 4,1 V, tras ~3 h de funcionamiento bajó a 4,0 V. Con un consumo de ~60 mA (estimado) y una batería de 1800 mAh, se estima una autonomía de 24 a 30 horas.

### 4.4 Resultados de la encuesta
Las preguntas 4 a 13 las respondieron las 18 personas con un adulto mayor cercano.

**Pregunta 4: ¿esa persona vive de manera independiente?**
| Respuesta | N | % |
|---|---|---|
| Sí, pero vive con otras personas | 10 | 56 % |
| Sí, vive sola | 2 | 11 % |
| No, requiere asistencia o cuidados frecuentes | 5 | 28 % |
| Prefiero no responder | 1 | 6 % |

**Pregunta 5: ¿se levanta sola durante la noche?**
| Respuesta | N | % |
|---|---|---|
| Frecuentemente | 8 | 44 % |
| A veces | 8 | 44 % |
| No lo sé | 2 | 11 % |

16 de 18 (89 %) se levanta de noche al menos a veces.

**Pregunta 6: ¿sabe de alguna caída de esa persona?**
| Respuesta | N | % |
|---|---|---|
| Sí | 12 | 67 % |
| No | 3 | 17 % |
| No lo sé | 3 | 17 % |

**Pregunta 7: si hubo caída, ¿ocurrió de noche o al levantarse de la cama?** (13 personas respondieron)
| Respuesta | N |
|---|---|
| Sí | 8 |
| No | 3 |
| No lo sé | 2 |

**Pregunta 8: preocupación de que sufra una caída o necesite ayuda al levantarse de noche** (1 = nada, 5 = mucha)
| Valor | N |
|---|---|
| 5 | 14 |
| 4 | 1 |
| 3 | 3 |
| 1 o 2 | 0 |

Promedio: 4,6 (mediana 5). 15 de 18 respondieron 4 o 5.

**Pregunta 9: utilidad de un sistema como SafeRest** (1 = nada útil, 5 = muy útil)
| Valor | N |
|---|---|
| 5 | 11 |
| 4 | 7 |
| 1 a 3 | 0 |

Promedio: 4,6 (mediana 5). Las 18 respuestas fueron 4 o 5.

**Pregunta 10: ¿usaría un dispositivo como SafeRest si tuviera a un adulto mayor a su cuidado?**
| Respuesta | N | % |
|---|---|---|
| Sí | 5 | 28 % |
| Probablemente sí | 10 | 56 % |
| No estoy seguro/a | 3 | 17 % |
| No / Probablemente no | 0 | 0 % |

15 de 18 (83 %) lo usaría o probablemente lo usaría. Nadie respondió que no.

**Pregunta 11: ubicación preferida del compartimento electrónico**
| Opción | N | % |
|---|---|---|
| C: compartimento externo conectado a la alfombra | 15 | 83 % |
| A: en uno de los lados largos de la alfombra | 2 | 11 % |
| B: en uno de los lados cortos de la alfombra | 1 | 6 % |

**Pregunta 12: razón principal de esa ubicación**
| Razón | N |
|---|---|
| Interferiría menos al caminar o pisar la alfombra | 9 |
| Permitiría ubicar el compartimento en un lugar más conveniente, separado de la alfombra | 6 |
| Permitiría ocultar mejor el compartimento debajo de la cama | 2 |
| Se vería más ordenado o discreto | 1 |

**Pregunta 13: característica más importante al elegir la ubicación**
| Característica | N | % |
|---|---|---|
| Que no interfiera al caminar | 13 | 72 % |
| Que se adapte a diferentes camas y dormitorios | 3 | 17 % |
| Que sea fácil acceder a los componentes | 1 | 6 % |
| Que quede lo menos visible posible | 1 | 6 % |

---

## 5. Observaciones y Problemas Identificados

- **Detección:** el mat distingue a una persona de una mascota con el umbral de 20 kg. Las personas probadas pesaban entre 51 y 78 kg, y los perros entre 15 y 18 kg.
- **Alcance:** las paredes de concreto reducen mucho el alcance (3 a 4 m con una de 22 cm), por lo que conviene dejar el control cerca del mat.
- **Diseño del compartimento:** la mayoría pidió que no interfiera al caminar. El prototipo ya usa una caja externa conectada al mat por un cable protegido, que corresponde a la opción preferida (C).
- **Estado de la batería:** el LED del control indica batería baja, cargando o llena. Con la batería casi llena, la detección del cargador por voltaje puede fallar. Es una limitación conocida que no afecta la alarma.
- **Alcance de la encuesta:** se aplicó a personas cercanas al equipo, a partir de la descripción del proyecto, y no incluyó una prueba de uso del prototipo por parte de los encuestados.

---

## 6. Relación con el ODS 3

SafeRest apunta al ODS 3 (Salud y Bienestar) al reducir el riesgo y el tiempo de respuesta ante caídas nocturnas de adultos mayores. Lo que muestra la encuesta:
- 89 % de las personas con un adulto mayor cercano dice que este se levanta de noche al menos a veces.
- 67 % conoce al menos una caída, y de 13 respuestas sobre dónde ocurrió, 8 fue de noche o al levantarse.
- La preocupación por una caída nocturna tuvo un promedio de 4,6 sobre 5.
- La utilidad percibida de SafeRest tuvo un promedio de 4,6 sobre 5, y 83 % lo usaría o probablemente lo usaría.

No se midió una reducción real de caídas, porque eso requiere un estudio de más duración. Los resultados muestran necesidad y aceptación, no impacto comprobado.

---

## 7. Conclusiones

### Fortalezas
- Detectó correctamente a las 5 personas y no se activó con los 2 perros (7 de 7 pruebas).
- Funciona sin WiFi ni internet, con ~9 m de alcance en línea de vista y con el control inalámbrico.
- La encuesta muestra alta preocupación (4,6 de 5) y alta utilidad percibida (4,6 de 5).

### Limitaciones
- No se probó con personas de menos de 51 kg, así que el rango entre 20 y 51 kg no está verificado.
- Solo se probó con 2 adultos mayores. Faltan pruebas de usabilidad con más adultos mayores y cuidadores.
- La autonomía del control es una estimación y no hay una medición de descarga completa. No se midió el consumo del mat.
- El alcance se reduce con paredes de concreto.
- La encuesta es una muestra de conveniencia, no representativa.

### Mejoras futuras
- Probar con personas más livianas y con más mascotas, en especial perros cercanos a 20 kg.
- Hacer pruebas de uso con adultos mayores y cuidadores en su entorno.
- Medir la autonomía con una descarga completa.
- Mejorar la detección del cargador cuando la batería está casi llena.

---

## 8. Anexos

- **Encuesta:** https://docs.google.com/forms/d/e/1FAIpQLScST9OGpb6jBOlyr7oj6F6Dm_mvbPy2ckD9lPvLSlmFQeuLQQ/viewform
- **Datos de las pruebas:** `testing/datos/README.md`
- **Evidencia (videos y fotos):** `testing/evidencias/README.md` y `hardware/fotos/`
- **Descripción de la iteración 2:** `iteraciones/iteracion_2/README.md`