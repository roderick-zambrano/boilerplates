#!/bin/bash

docker volume create portainer_data # Without volume creation, docker run will fail.
# Docker compose makes portainer lose authority over its own container. `docker run` exec avoids this.
docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest
