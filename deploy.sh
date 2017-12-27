#!/bin/bash

for s in drupal slud wordpress moodle wetty ghost ; do
cd $s
docker stack deploy -c docker-stack.yml $s
cd ..
done
