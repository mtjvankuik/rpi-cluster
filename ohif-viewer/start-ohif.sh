#!/bin/bash

docker container rm --force ohif-viewer
docker image rm --force mtjvankuik/ohif:v3.7.0-beta.102

docker image pull mtjvankuik/ohif:v3.7.0-beta.102
docker run --detach --publish 3000:80/tcp --name ohif-viewer mtjvankuik/ohif:v3.7.0-beta.102
