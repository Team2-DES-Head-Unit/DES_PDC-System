DESCRIPTION = "Custom getty@tty1.service with autologin for root"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

LICENSE = "CLOSED"
SRC_URI = "file://getty@tty1.service"

S = "${WORKDIR}"

inherit systemd

do_install() {
    install -d ${D}${systemd_unitdir}/system/
    install -m 644 ${WORKDIR}/getty@tty1.service ${D}${systemd_unitdir}/system/
}

SYSTEMD_SERVICE:${PN} = "getty@tty1.service"
SYSTEMD_AUTO_ENABLE = "enable"
FILES:${PN} += "${systemd_unitdir}/system/getty@tty1.service"

RDEPENDS:${PN} = "systemd"

