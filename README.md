# SafeRest

### Información del Equipo

- **Integrantes:**
  - Beatriz Chaparro I (@beachaparro)
  - Miguel Colín M (@mcolinm)
  - Benjamín Gil R (@benjaingil)
  - Josefa Ramírez C (@Josefarc)
  - Alfred Tamm V (@alfredtamm)

- **ODS Seleccionado:** ODS 3, Salud y Bienestar
- **Problema a resolver:** las caídas nocturnas son un riesgo frecuente en adultos mayores que se levantan de noche, y muchas veces nadie se entera a tiempo. Las soluciones existentes dependen de supervisión constante, de internet, son costosas o no fueron creadas para este problema en específico.

### Descripción del Proyecto
SafeRest es un sistema de dos dispositivos que se comunican entre sí:

- **Mat:** Una superficie con 4 celdas de carga junto a la cama. Detecta cuando la persona pisa el mat y envía una alerta al control del cuidador para que este asista al adulto mayor. Tiene una batería 18650 de respaldo: si se corta la luz, sigue funcionando.
- **Control:** Un dispositivo pequeño con buzzer, LED y botón. Suena y se enciende cuando recibe la alerta, y el cuidador lo silencia con el botón. Funciona de manera inalámbrica gracias a su batería.

Funciona sin WiFi ni internet (comunicación directa por ESP-NOW).

### Estado del Proyecto
- **Versión actual:** v2.0 (versión final, iteración 2)
- **Última actualización:** 22-11-2026
- **Estado:** Prototipo funcional final. El mat y el control están dentro de sus cajas, con respaldo de batería en ambos, LED de estado e interruptor de encendido.

### Resultados de las pruebas
- **Detección:** las 5 personas probadas (de 51 a 78 kg, 2 de ellas adultos mayores) activaron la alarma, y los 2 perros (18 y 15 kg) no.
- **Alcance:** ~9 m en línea de vista; 7,3 m con 2 tabiques de yeso cartón; 3 a 4 m con una pared de concreto de 22 cm.
- **Autonomía del control:** 24 a 30 h (estimada).
- **Corte de luz:** el mat sigue funcionando con su batería, sin reiniciarse.
- **Encuesta (26 respuestas):** utilidad percibida de 4,6 sobre 5, y 83 % lo usaría o probablemente lo usaría.

El detalle está en `testing/`.

---

## Estructura del Repositorio
```
├── hardware/         # Esquemas, lista de materiales (BOM), datasheets y fotos
├── software/         # Código Arduino y librerías
│   ├── src/          # Códigos: mat_final, control_final, calibracion, mac y Entrega anterior
│   ├── librerias/    # Librerías necesarias (ver FUENTES.md)
│   └── docs/         # Manual del código
├── diseno_3d/        # Modelos de Fusion 360 (caja del control y mat), renders y planos
├── testing/          # Pruebas, encuesta, evidencias y reporte con usuarios
│   ├── reportes/     # Reporte de testing con usuarios
│   ├── evidencias/   # Descripción de los videos y fotos de las pruebas
│   └── datos/        # Datos de las pruebas y de la encuesta
├── documentacion/    # Informe final y presentación
├── iteraciones/      # Evidencia del desarrollo y cambios del diseño
│   ├── iteracion_1/  # Prototipo alpha (Avance #2)
│   └── iteracion_2/  # Versión final (Avance #3)
└── FUENTES.md        # Bibliografía, datasheets y librerías utilizadas
```

---

## Iteraciones

| Iteración | Fecha | Estado |
|---|---|---|
| Iteración 1 (v1) | 19-10-2026 | Prototipo alpha: prueba de concepto |
| Iteración 2 (v2) | 22-11-2026 | Prototipo funcional final |

La comparación entre ambas está en `iteraciones/README.md`.

---

## Inicio Rápido

### Requisitos Previos
- Arduino IDE 2.x
- Fusion 360
- GitHub Desktop (para clonar el repositorio)

### Instalación
1. Clonar el repositorio (por ejemplo, con GitHub Desktop).
2. Instalar las librerías indicadas en `software/librerias/` y en `FUENTES.md`.
3. En Arduino IDE, elegir la placa `LOLIN(WEMOS) D1 R2 & mini`.
4. Leer la MAC de cada placa con `software/src/mac/` y escribirla en el código contrario (`macControl` en el mat, `macMat` en el control).
5. Cargar `software/src/mat_final/mat_final.ino` en el Wemos D1 R2 (mat) y `software/src/control_final/control_final.ino` en el Wemos D1 mini (control).
6. Si cambia el hardware del mat, recalibrar con `software/src/calibracion/` y ajustar `FACTOR_ESCALA` y `UMBRAL_KG` en el código del mat (valores finales: 19260 y 20 kg).

---

## Checklist de Entrega

### Hardware ✓
- [x] Esquema del circuito (diagramas de conexión del mat y del control)
- [x] BOM completo
- [x] Fotos de alta resolución

### Software ✓
- [x] Código comentado
- [x] Librerías documentadas
- [x] Manual de instalación

### Diseño 3D ✓
- [x] Archivos Fusion 360 (.f3d) con TODOS los componentes
- [x] Renders de alta calidad (1+ ángulos)
- [x] Planos técnicos

### Testing ✓
- [x] Reporte de testing con usuarios (mín. 5)
- [x] Evidencias fotográficas/videos
- [x] Datos cuantitativos

### Documentación ✓
- [x] Reporte final (máx. 15 páginas)
- [x] Presentación (10 min)

---

## Licencia
Este proyecto es desarrollado como parte del curso TEI201 - Facultad de Ingeniería y Ciencias - Universidad Adolfo Ibáñez