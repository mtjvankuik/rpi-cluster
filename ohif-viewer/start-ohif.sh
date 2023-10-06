#!/bin/bash

docker rm -f ohif-viewer-container
docker image rm ohif-viewer-image:latest

docker build /projects/Viewers -t ohif-viewer-image

docker pull ohif/viewer
docker run -d -p 3000:80/tcp --name ohif-viewer-container --platform linux/arm64/v8 ohif-viewer-image
