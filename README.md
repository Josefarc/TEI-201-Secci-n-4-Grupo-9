### Información del Equipo
- **Integrantes:**
  - Beatriz Chaparro I
  - Miguel Colín M
  - Benjamín Gil R
  - Josefa Ramírez C
  - Alfred Tamm V
  
- **ODS Seleccionado:** ODS 3, Salud y Bienestar
- **Problema a resolver:** las caídas nocturnas son un riesgo frecuente en adultos mayores que se levantan de noche, y muchas veces nadie se entera a tiempo. Las soluciones existentes dependen de supervisión constante, de internet, son costosas o lo fueron creadas para este problema en específico.

### Descripción del Proyecto
SafeRest es un sistema de dos dispositivos que se comunican entre sí:

- **Mat:** Una superficie con 4 celdas de carga junto a la cama. Detecta cuando la persona pisa el mat y envía una alerta al control del cuidador para que este asista al adulto mayor.
- **Control:** Un dispositivo pequeño con buzzer y botón. Suena cuando recibe la alerta, y el cuidador lo silencia con el botón. Al silenciarlo, avisa al mat que la alarma fue atendida para que deje de emitir alertas.

Funciona sin WiFi (comunicación directa por ESP-NOW) y el control funciona de manera inalámbrica gracias a una bateria, además el mat poseerá como respaldo una batería ante cortes de luz para su continuo funcionamiento.


### Estado del Proyecto
- **Versión actual:** v1.0
- **Última actualización:** [Fecha]
- **Estado:** Prototipo funcional: El mat y el control se comunican, el control funciona con batería.

---

##  Estructura del Repositorio
```
├── hardware/         # Esquemas, lista de materiales (BOM) y diagramas de conexión
├── software/         # Código Arduino (mat, control, calibración, lectura de MAC)
├── diseno_3d/        # Scripts de Fusion 360 (carcasa del control y mat) y renders
├── testing/          # Pruebas, problemas encontrados y soluciones
├── documentacion/    # Informes y presentaciones
└── iteraciones/      # Evidencia del desarrollo y cambios del diseño
```

---

##  Inicio Rápido

### Requisitos Previos
- Arduino IDE 2.x
- Fusion 360
- [Otras herramientas necesarias]

### Instalación
1. Clonar el repositorio
2. Instalar librerías (ver `software/librerias/`)
3. Cargar código en ESP32/Arduino
4. [Pasos adicionales]

---

##  Checklist de Entrega

### Hardware ✓
- [ ] Esquema del circuito (Fritzing/Wokwi)
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


---

##  Licencia
Este proyecto es desarrollado como parte del curso TEI201 - Facultad de Ingenieria y Ciencias - Universidad Adolfo Ibañez
