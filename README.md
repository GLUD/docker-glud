# docker-glud

Este repositorio contiene pilas de servicios de Docker (stacks) que es estan usando en el GLUD; 
estas pilas entán organizadas por carpetas donde cada una contiene un archivo llamado `docker-stack.yml` que declara uno o varios
contenedores de Docker, sus redes y volumenes de datos necesarios para completar la aplicación (como bases de datos, etc).
También pueden controner uno o varios Archivos `Dockerfile` que permiten contruir imagenes personalizadas por el equipo del GLUD.

Para construir las imagenes de Docker, se debe ejecutar los siguientes comandos dentro de la carpeta del servicio escogido:

```bash
docker build .
```

pero para iniciar el stack, ejecutar directamente:

```bash
docker swarm init #si antes no se habia hecho
docker stack deploy -c docker-stack.yml <aqui-un-nombre-para-el-stack>
```
## Aplicaciones actuales:

- moodle

