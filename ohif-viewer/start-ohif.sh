#!/bin/bash

docker rm -f ohif-viewer-container
docker image rm ohif-viewer-image:latest

docker build /projects/Viewers -t ohif-viewer-image

docker run -d -p 3000:80/tcp --name ohif-viewer-container ohif-viewer-image
