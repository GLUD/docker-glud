#!/bin/bash

docker exec -it $(docker ps -f 'name=reverse_nginx.1'  -q) nginx -t && \
docker exec -it $(docker ps -f 'name=reverse_dockergen.1'  -q) docker-label-sighup org.glud.nginx_proxy


