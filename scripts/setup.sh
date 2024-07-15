#!/bin/bash

# balena/yocto-build-env:24b1d67
META_BRANCH=kirkstone
BUILDDIR="$1"/build

git clone https://git.yoctoproject.org/poky -b $META_BRANCH "$1"/poky
git clone https://git.openembedded.org/meta-openembedded -b $META_BRANCH "$1"/meta-openembedded
git clone https://github.com/ros/meta-ros.git -b $META_BRANCH "$1"/meta-ros

source "$1"/poky/oe-init-build-env && pwd && ls -ls

bitbake-layers add-layer "$1"/meta-openembedded/meta-oe
bitbake-layers add-layer "$1"/meta-openembedded/meta-python
bitbake-layers add-layer "$1"/meta-openembedded/meta-networking
bitbake-layers add-layer "$1"/meta-ros/meta-ros-common
bitbake-layers add-layer "$1"/meta-ros/meta-ros2
bitbake-layers add-layer "$1"/meta-ros/meta-ros2-humble
bitbake-layers add-layer "$1"/meta-motur

cat conf/bblayers.conf
