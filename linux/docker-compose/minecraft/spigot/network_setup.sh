#!/bin/bash

docker network rm spigot_minecraft

docker network create \
  -d bridge \
  --attachable \
  --subnet=172.21.0.0/29 \
  --ip-range=172.21.0.0/29 \
  --gateway=172.21.0.1 \
spigot_minecraft
