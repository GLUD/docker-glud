FROM webdevops/php-nginx:alpine-php5
LABEL maintainer "Sebastian Tabares Amaya <sytabaresa@gmail.com>"

ENV VERSION 33

RUN apk -U --no-progress add \
    acl mariadb-client postgresql-client php5-pgsql php5-opcache php5-pdo_pgsql

RUN curl https://download.moodle.org/download.php/direct/stable${VERSION}/moodle-latest-${VERSION}.tgz \
 | tar -xzC /tmp  \
 && mv /tmp/moodle/* /app \
 && rm -rf /tmp/moodle  \
 && chown -R root /app \
 && chmod -R 0755 /app \
 && find /app -type f -exec chmod 0644 {} \; \
 && chown -R nginx: /app


RUN mkdir /var/moodledata \
 && echo "placeholder" > /var/moodledata/placeholder \
 #&& chown -R www-data:www-data /var/moodledata \
 && chown -R nginx: /var/moodledata \
 && chmod 0777 /var/moodledata \
 && read pid cmd state ppid pgrp session tty_nr tpgid rest < /proc/self/stat

VOLUME ["/var/moodledata"]

COPY moodle_config.php /app/config.php
COPY php.ini /opt/docker/etc/php/php.ini
COPY nginx_10-php.conf /opt/docker/etc/nginx/vhost.common.d/10-php.conf
