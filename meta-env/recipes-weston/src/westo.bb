SUMMARY = "weston automatically activate code"
DESCRIPTION = "weston code"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = "file://app.service \
file://application.sh \
 "

RDEPENDS:${PN} += "bash" 
S = "${WORKDIR}"

inherit systemd

do_install() {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/app.service ${D}${systemd_system_unitdir}/app.service
    install -d ${D}${bindir}/
    install -m 0755 ${S}/application.sh ${D}${bindir}/application.sh
}


SYSTEMD_SERVICE:${PN} = "app.service"
SYSTEMD_AUTO_ENABLE = "enable"


FILES:${PN} += "${systemd_system_unitdir}/app.service"
FILES:${PN} += "${bindir}/application.sh"
