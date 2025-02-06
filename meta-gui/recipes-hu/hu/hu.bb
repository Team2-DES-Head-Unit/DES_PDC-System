SUMMARY = "Head unit GUI"
DESCRIPTION = "Head unit GUI"
LICENSE = "CLOSED"

SRC_URI = "git://github.com/Team2-DES-Head-Unit/DES_PDC-System.git;branch=HeadUnit;protocol=https"
SRCREV ="31fb60275bedee9ab46291f7dcd87a700bf8ab2f"
SRC_URI[sha256sum] = "fe192784ee4a1900f9aa87a633484286657c49a7fe69bcf7663ba53d74122ac6"

S = "${WORKDIR}/git/HeadUnit"

inherit cmake_qt5 

DEPENDS += "qtbase qtdeclarative qtquickcontrols2 qtmultimedia qtwebengine qtconnectivity vsomeip"


do_install() {
    install -d ${D}/usr/bin/hu
    install -m 0755 ${B}/HeadUnit ${D}/usr/bin/hu
    install -m 0755 ${S}/main.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/bluetooth_page.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/light_page.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/media_page_youtube.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/map_page.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/media_page.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/music_page.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/setting_page.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/media_page_youtube.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/mirror_page.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/light_page.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/usrinfo_page.qml ${D}/usr/bin/hu
    install -m 0755 ${S}/pdc_page.qml ${D}/usr/bin/hu

    install -d ${D}/usr/bin/Cover
    cp -r ${S}/Cover/* ${D}/usr/bin/Cover
    install -d ${D}/usr/bin/Music
    cp -r ${S}/Music/* ${D}/usr/bin/Music
}




FILES:${PN} += "/usr/bin/hu"
FILES:${PN} += "/usr/bin/Cover"
FILES:${PN} += "/usr/bin/Music"



