#!/bin/bash

docker build . -t localhost:5000/cddns
docker push localhost:5000/cddns
