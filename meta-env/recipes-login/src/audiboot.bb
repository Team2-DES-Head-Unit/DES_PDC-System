DESCRIPTION = "booting animation"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

LICENSE = "CLOSED"
SRC_URI = "file://audiboot.mp4 \
file://audiboot.service \
file://audi.sh \
"

S = "${WORKDIR}"

inherit systemd
RDEPENDS:${PN} += "bash" 
do_install() {
    install -d ${D}${systemd_unitdir}/system/
    install -m 644 ${WORKDIR}/audiboot.service ${D}${systemd_unitdir}/system/
    install -d ${D}/usr/bin/
    install -m 644 ${WORKDIR}/audiboot.mp4 ${D}/usr/bin/audiboot.mp4
    install -d ${D}${bindir}/
    install -m 0755 ${S}/audi.sh ${D}${bindir}/audi.sh
}


SYSTEMD_SERVICE:${PN} = "audiboot.service"
SYSTEMD_AUTO_ENABLE = "enable"
FILES:${PN} += "${systemd_unitdir}/system/audiboot.service"
FILES:${PN} += "/usr/bin/audiboot.mp4"
FILES:${PN} += "/usr/bin/audi.sh"

