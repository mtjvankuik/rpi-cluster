#!/bin/bash

docker image pull mtjvankuik/ohif:v3.7.0
docker service create --replicas 3 -p 3000:80 --name ohif-viewer mtjvankuik/ohif:v3.7.0
docker service ls