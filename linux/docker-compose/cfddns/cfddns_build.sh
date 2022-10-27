#!/bin/bash

docker build . -t localhost:5000/cfddns
docker push localhost:5000/cfddns
