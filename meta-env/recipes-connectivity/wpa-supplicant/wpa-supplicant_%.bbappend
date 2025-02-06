FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
file://wpa_supplicant.conf \
file://wpa.service \
"
inherit systemd

do_install:append() {
    install -d ${D}/etc
    install -m 0644 ${WORKDIR}/wpa_supplicant.conf ${D}/etc/wpa_supplicant.conf
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/wpa.service ${D}${systemd_system_unitdir}/wpa.service
    
}
SYSTEMD_SERVICE:${PN} = "wpa.service"
SYSTEMD_AUTO_ENABLE = "enable"
FILES:${PN} += "/etc/wpa_supplicant.conf"
FILES:${PN} += "${systemd_system_unitdir}/wpa.service"
