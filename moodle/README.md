# Moodle
docker image of moodle, is based in Alpine Linux and uses a php-fpm and nginx server.

It is base in the latest 3.3+ release for Moodle.

## Environment Variables
this image uses several environment variables:

### `MOODLE_URL`
The URL in wich this moodle will be installed.

### `DB_TYPE`
Type of DataBase used for this image, the most common are mariadb and psql

### `DB_TCP_ADDR`
IP address for the db connection 

### `DB_ENV_DATABASE`
Name of the moodle database for create in the db

### `DB_ENV_USER`
User of the database
### `DB_ENV_PASSWORD`
Password for the database, is better use a file secret

### `DB_ENV_PASSWORD_FILE`
File for db password for use in [Docker secrets](https://docs.docker.com/engine/swarm/secrets/): the last line is the only valid one.

