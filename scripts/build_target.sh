#!/bin/bash
# <path>/build_target.sh <path_to_root_dir> <machine> <target>

# machine - setup from yocto (qemuarm64/qemux86-64/raspberrypi3-64)
ROOTDIR_PATH=.
MACHINE=qemux86-64
DISTRO=poky
TARGET=core-image-minimal

while [[ $# -gt 0 ]]; do
  case $1 in
    -m|--machine)
      MACHINE="$2"
      echo "Machine set to $(MACHINE)"
      shift # past argument
      shift # past value
      ;;
    -p|--path)
      ROOTDIR_PATH="$2"
      echo "Root directory path set to $(ROOTDIR_PATH)"
      shift # past argument
      shift # past value
      ;;
    -t|--target)
      TARGET="$2"
      echo "Target set to $(TARGET)"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      shift
      ;;
  esac
done

cat "$ROOTDIR_PATH"/build/conf/bblayers.conf

source "$ROOTDIR_PATH"/poky/oe-init-build-env

bitbake "$TARGET"