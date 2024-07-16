inherit ros_distro_humble

DESCRIPTION = "A package containing recipe for ROS2 based common platform interfaces for Motur   ."
AUTHOR = "MacAndKaj"
ROS_AUTHOR = "MacAndKaj"
HOMEPAGE = "https://github.com/MacAndKaj/MoturHeadPlatform.git"
SECTION = "devel"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=2b4979d09879e981e1254b2df7436023"

ROS_CN = "motur-head-platform"
ROS_BPN = "motoros-interfaces"


ROS_BUILD_DEPENDS = " \
    builtin-interfaces \
"

ROS_BUILDTOOL_DEPENDS = " \
    ament-cmake-native \
    ament-cmake-ros-native \
    rosidl-default-generators-native \
"

ROS_EXEC_DEPENDS = " \
    rosidl-default-runtime \
"

ROS_BUILDTOOL_EXPORT_DEPENDS = ""

ROS_EXPORT_DEPENDS = " \
    builtin-interfaces \
"

DEPENDS = "${ROS_BUILD_DEPENDS} ${ROS_BUILDTOOL_DEPENDS} ${ROS_EXPORT_DEPENDS} ${ROS_BUILDTOOL_EXPORT_DEPENDS}"
RDEPENDS:${PN} += "${ROS_EXEC_DEPENDS}"


SRC_URI = "git://github.com/MacAndKaj/MoturHeadPlatform.git;branch=main;protocol=https"
SRCREV = "f470ebe3baf2305e90ad73b9a66c88d8a12e596d"

S = "${WORKDIR}/git/libs/motoros_interfaces"



FILES:${PN} = " \
    ${libdir} \
"

FILES:${PN}-dev = " \
    ${datadir} \
    ${includedir} \
"

ROS_BUILD_TYPE = "ament_cmake"

inherit ros_${ROS_BUILD_TYPE}

