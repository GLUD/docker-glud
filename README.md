# Docker GLUD

Este repositorio contiene pilas de servicios de Docker (stacks) que es estan usando en el GLUD; 
estas pilas entán organizadas por carpetas donde cada una contiene un archivo llamado `docker-stack.yml` que declara uno o varios
contenedores de Docker, sus redes y volumenes de datos necesarios para completar la aplicación (como bases de datos, etc).
También pueden controner uno o varios Archivos `Dockerfile` que permiten contruir imagenes personalizadas por el equipo del GLUD.

## Construccion de las imagenes

Para construir las imagenes de Docker, se debe ejecutar los siguientes comandos dentro de la carpeta del servicio escogido:

```bash
docker build . -f <Nombre-del-docker-file>
```
## Iniciando la pila de servicios

para iniciar el stack, ejecutar directamente:

```bash
docker swarm init #si antes no se habia hecho
docker stack deploy -c docker-stack.yml <aqui-un-nombre-para-el-stack>
```

**NOTA:**
hay que tener en cuenta que puede que el archivo `docker-stack.yml` puede que esté configurado para usar **archivos de contraseñas** con la característica
de [docker secrets](https://docs.docker.com/engine/swarm/secrets/) para hacer más seguros los servicios. En estos casos se deberá crear en la carpeta los
correspondientes archivos *.priv* que indica el archivo `docker-stack.yml` y agregar una contraseña segura, preferiblemente este archivo debe terner solo
una línea con la correspondiente contraseña.

## Aplicaciones actuales:

- moodle (implementa una base de datos postgresql pero es configurable para mariadb)
- drupal (con drush y composer)
- ghost (en pruebas)
- wordpress
- nginx-proxy (ayuda a hacer el proxy reverso)
- slud (montado en joomla)
- wetty
- taiga
