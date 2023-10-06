#!/bin/bash

docker rm -f ohif-viewer-container
docker pull ohif/viewer
docker run -d -p 3000:80/tcp --name ohif-viewer-container --platform linux/arm64/v8 ohif/viewer
