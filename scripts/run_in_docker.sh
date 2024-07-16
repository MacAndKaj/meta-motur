#!/bin/bash

IMAGE=balena/yocto-build-env
TAG=24b1d67

docker run \
    -it \
    -v /home:/home \
    -v /etc/passwd:/etc/passwd \
    -v /etc/group:/etc/group \
    --group-add sudo \
    --net=host \
    --user $(id -u):$(id -g) \
    --env=DISPLAY \
    -w `pwd` \
    $IMAGE:$TAG
