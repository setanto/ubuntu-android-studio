#!/bin/sh

if [ ! "$(docker ps -q -f name=ubuntu-android-studio)" ]; then
  if [ "$(docker ps -aq -f status=exited -f name=ubuntu-android-studio)" ]; then
    sudo docker start  ubuntu-android-studio
  else
    docker run -dit \
    --privileged \
    --net=host \
    --env="DISPLAY" \
    --name ubuntu-android-studio \
    -v `pwd`/data/android-studio:/root \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v="$HOME/.Xauthority:/root/.Xauthority:rw" \
    -v /dev/bus/usb:/dev/bus/usb \
    -v /dev/kvm:/dev/kvm \
    setanto/ubuntu-android-studio /opt/android-studio/bin/studio.sh
  fi
fi
