# fsociety
A Capture The Flag style laboratory inspired by the Mr. Robot series, built inside a Docker container.

# FSOCIETY – Mr. Robot Inspired CTF (Dockerized)

**FSOCIETY** es un laboratorio estilo CTF inspirado en la serie **Mr. Robot**, construido dentro de un único contenedor Docker.  
El objetivo es completar 4 niveles de desafíos de investigación, lógica y análisis forense, siguiendo una narrativa temática de fsociety.

Este entorno NO contiene vulnerabilidades reales ni exploits peligrosos; todos los retos están simulados para ser educativos y seguros.

---

# Temática

El laboratorio simula un **servidor de iniciación de fsociety**, donde el jugador debe demostrar sus habilidades para “ganarse un lugar” dentro del grupo.

Incluye:

- Mensajes ocultos estilo Mr. Robot  
- Directorios sospechosos  
- Criptografía simple  
- Servicios internos no documentados  
- Cronjobs falsos  
- Narrativa completa a lo largo de 4 niveles  

---

# Niveles del CTF

### ** Nivel 1 — “HELLO FRIEND”**
Descubre la contraseña inicial para acceder por SSH analizando la web, su código fuente y el archivo `robots.txt`.

### ** Nivel 2 — “ARE YOU A ONE OR A ZERO?”**
Explora el sistema como el usuario *elliot*. Encuentra archivos ocultos y analiza logs generados por cronjobs.

### ** Nivel 3 — “CONTROL IS AN ILLUSION”**
Descifra un archivo encriptado con cifrado simple para obtener el **FSOCIETY TOKEN**.

### ** Nivel 4 — “WELCOME TO FSOCIETY”**
Accede a un servicio secreto escuchando en un puerto oculto y obtén la **FSOCIETY BADGE**.

---

# ¿Qué incluye este repositorio?

- `Dockerfile` completo  
- Estructura del lab dentro del contenedor  
- Archivos HTML, notas, scripts, mensajes encriptados  
- Servicio interno Python  
- Narrativa y pistas  
- Instructivo de resolución  

---

# 🐳 Instalación

1. Clonar el repositorio:
```bash
git clone https://github.com/tuusuario/fsociety-ctf.git
cd fsociety-ctf
```
2. Construir imagen:
```bash
docker build -t fsociety .
```
3. Desplegar el contenedor:
```bash
docker run -p 80:80 -p 22:22 fsociety
```
