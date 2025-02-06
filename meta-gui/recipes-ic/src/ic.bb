SUMMARY = "INSTRUMENT CLUSTER GUI"
DESCRIPTION = "INSTRUMENT CLUSTER GUI"
LICENSE = "CLOSED"

SRC_URI = "git://github.com/Team2-DES-Head-Unit/DES_PDC-System.git;branch=HeadUnit;protocol=https"
SRCREV ="31fb60275bedee9ab46291f7dcd87a700bf8ab2f"


S = "${WORKDIR}/git/IC_TEST"

inherit cmake_qt5 

DEPENDS += "qtbase qtdeclarative qtquickcontrols2 qtwayland wayland weston vsomeip"


do_install() {
    install -d ${D}/usr/bin/ic
    install -m 0755 ${B}/IC_TEST ${D}/usr/bin/ic
    install -m 0755 ${S}/main.qml ${D}/usr/bin/ic
}


FILES:${PN} += "/usr/bin/ic"




