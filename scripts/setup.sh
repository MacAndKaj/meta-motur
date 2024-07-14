#!/bin/bash

# balena/yocto-build-env:24b1d67
META_BRANCH=kirkstone

git clone https://git.yoctoproject.org/poky -b $META_BRANCH
git clone https://git.openembedded.org/meta-openembedded -b $META_BRANCH
git clone https://git.yoctoproject.org/poky -b $META_BRANCH

source poky/oe-init-build-env

bitbake-layers add-layer "$1"/meta-openembedded/meta-oe
bitbake-layers add-layer "$1"/meta-openembedded/meta-python
bitbake-layers add-layer "$1"/meta-openembedded/meta-networking
bitbake-layers add-layer "$1"/meta-ros/meta-ros-common
bitbake-layers add-layer "$1"/meta-ros/meta-ros2
bitbake-layers add-layer "$1"/meta-ros/meta-ros2-humble
bitbake-layers add-layer "$1"/meta-motur

# machine - setup from yocto (qemuarm64/qemux86-64/raspberrypi3-64)
export MACHINE=$1
export DISTRO=poky
