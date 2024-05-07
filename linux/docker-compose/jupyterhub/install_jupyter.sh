#!/bin/bash

# Drop into the docker container and install jupyter to enable spinning up the notebooks
docker exec -it jupyterhub /bin/bash -c "pip3 install jupyter"
