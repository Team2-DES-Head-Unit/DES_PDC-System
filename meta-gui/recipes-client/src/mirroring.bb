DESCRIPTION = "Scrcpy - Android screen mirroring tool"
HOMEPAGE = "https://github.com/Genymobile/scrcpy"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57"

SRC_URI = "git://github.com/Genymobile/scrcpy.git;branch=master;protocol=https"
SRC_URI[server.sha256sum] = "a23c5659f36c260f105c022d27bcb3eafffa26070e7baa9eda66d01377a1adba"

SRCREV = "04dd72b5944dbe8de2a2fa438f920e88c03e4ff8"


S = "${WORKDIR}/git"
B = "${WORKDIR}/build" 

DEPENDS = "libsdl2 ffmpeg libusb1 gradle-native"
RDEPENDS:${PN} += "libavformat"
inherit meson pkgconfig

