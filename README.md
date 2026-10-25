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

- **Mat:** Una superficie con 4 celdas de carga junto a la cama. Detecta cuando la persona pisa el mat y envía una alerta al control del cuidador para que este asista al adulto mayor.
- **Control:** Un dispositivo pequeño con buzzer y botón. Suena cuando recibe la alerta, y el cuidador lo silencia con el botón. Al silenciarlo, avisa al mat que la alarma fue atendida para que deje de emitir alertas.

Funciona sin WiFi (comunicación directa por ESP-NOW) y el control funciona de manera inalámbrica gracias a una batería. Además, el mat tendrá como respaldo una batería ante cortes de luz para su funcionamiento continuo.

### Estado del Proyecto
- **Versión actual:** v1.0
- **Última actualización:** 25-10-2026
- **Estado:** Prototipo funcional: el mat y el control se comunican, el control funciona con batería.

---

## Estructura del Repositorio
```
├── hardware/         # Esquemas, lista de materiales (BOM) y diagramas de conexión
├── software/         # Código Arduino y librerías
│   ├── src/          # Códigos: mat, control, calibración y MAC
│   ├── librerias/    # Librerías necesarias (ver FUENTES.md)
│   └── docs/         # Manual del código
├── diseno_3d/        # Scripts de Fusion 360 (carcasa del control y mat) y renders
├── testing/          # Pruebas, problemas encontrados y soluciones
├── documentacion/    # Informes y presentaciones
├── iteraciones/      # Evidencia del desarrollo y cambios del diseño
└── FUENTES.md        # Bibliografía, datasheets y librerías utilizadas
```

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
5. Cargar `software/src/mat/` en el Wemos D1 y `software/src/control/` en el Wemos D1 Mini.
6. Calibrar con `software/src/calibracion/` y ajustar `FACTOR_ESCALA` y `UMBRAL_KG` en el código del mat.

---

## Checklist de Entrega

### Hardware ✓
- [ ] Esquema del circuito (diagramas de conexión del mat y del control)
- [ ] BOM completo
- [ ] Fotos de alta resolución

### Software ✓
- [ ] Código comentado
- [ ] Librerías documentadas
- [ ] Manual de instalación

### Diseño 3D ✓
- [ ] Archivos Fusion 360 (.f3d) con TODOS los componentes
- [ ] Renders de alta calidad (1+ ángulos)
- [ ] Planos técnicos

### Testing ✓
- [ ] Reporte de testing con usuarios (mín. 5)
- [ ] Evidencias fotográficas/videos
- [ ] Datos cuantitativos

### Documentación ✓
- [ ] Reporte final (máx. 15 páginas)
- [ ] Presentación (10 min)

---

## Licencia
Este proyecto es desarrollado como parte del curso TEI201 - Facultad de Ingeniería y Ciencias - Universidad Adolfo Ibáñez