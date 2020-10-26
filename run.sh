#!/bin/bash

#xhost +local:$USER
docker run -it \
    --name=jetpack-sdk \
    --rm=true \
    --net=host \
    --ipc host \
    --privileged \
    --cap-add=NET_ADMIN \
    --entrypoint= \
    --volume="/dev/bus/usb:/dev/bus/usb" \
    --user "$(id -u):$(id -g)" \
    --env="DISPLAY=$DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    jetpack-sdk /bin/bash
