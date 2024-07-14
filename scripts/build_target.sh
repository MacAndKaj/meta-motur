#!/bin/bash
# <path>/build_target.sh <path_to_root_dir> <machine> <target>

source "$1"/poky/oe-init-build-env

# machine - setup from yocto (qemuarm64/qemux86-64/raspberrypi3-64)
export MACHINE=$2
export DISTRO=poky

bitbake "$3"