#!/bin/bash

docker container rm --force ohif-viewer
docker image pull mtjvankuik/ohif:v3.7.0
docker run --detach --publish 3000:80/tcp --name ohif-viewer mtjvankuik/ohif:v3.7.0
