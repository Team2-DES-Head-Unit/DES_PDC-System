SUMMARY = "INSTRUMENT CLUSTER GUI"
DESCRIPTION = "INSTRUMENT CLUSTER GUI"
LICENSE = "CLOSED"

SRC_URI = "git://github.com/Team2-DES-Head-Unit/DES_Head-Unit.git;branch=HU;protocol=https"
SRCREV ="2dc6d5b3707c12d50f04fb915dac81d1c3d82e1d"


S = "${WORKDIR}/git/HeadUnit_Project/IC_TEST"

inherit cmake_qt5 

DEPENDS += "qtbase qtdeclarative qtquickcontrols2 qtwayland wayland weston vsomeip"


do_install() {
    install -d ${D}/usr/bin/ic
    install -m 0755 ${B}/IC_TEST ${D}/usr/bin/ic
    install -m 0755 ${S}/main.qml ${D}/usr/bin/ic
}


FILES:${PN} += "/usr/bin/ic"




