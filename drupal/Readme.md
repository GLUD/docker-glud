# Drupal

Esta configuracion se estará usando para la página principal de GLUD.

Contiene una imagen `Dockerfile` de Drupal con Composer instalado para mayor flexibilidad en la adicion de módulos PHP
como tambien un archivo de Docker Stack para desplegar el servicio completo

## Imagen Cruda
La imagen de Drupal se puede optener de dockerhub así:

```bash
docker pull glud/drupal:latest
```

ó construirla directamente con el comando:
```bash
docker build -t glud/drupal:latest . #en el directorio donde está el archivo Dockerfile
```

## Docker stack (recomendado)

Para produccion se está usando un archivo de Docker Stack `docker-stack.yml` que permite traer automaticamente la imagen de Drupal
y configurarla con la imagen de base de datos, los directorios de configuracion, claves, usuarios, etc.
Para que esta configuración funcione se debe tener la última version de [docker-ce](https://www.docker.com/community-edition#/download) instalada.

Se despliega el stack con el siguiente comando:
```bash
docker stack deploy -c docker-stack.yml
```

### Notas:
- Se deberá crear un(unos) archivos `.priv` con las contraseñas requeridas por el archivo `docker-stack.yml` con una sola línea la cual es la contraseña.
- Revisar los puertos que se le quieren asignar al servicio y otras configuraciones pertinentes.


