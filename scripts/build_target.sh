#!/bin/bash
# <path>/build_target.sh <path_to_root_dir> <machine> <target>

# machine - setup from yocto (qemuarm64/qemux86-64/raspberrypi3-64)
MACHINE=$2
DISTRO=poky

source "$1"/poky/oe-init-build-env

bitbake "$3"