SUMMARY = "IP setting"
DESCRIPTION = "Ip setting"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = "file://server.sh \
 "
 
S = "${WORKDIR}"


do_install() {
    install -d "${D}${sysconfdir}/profile.d"
    install -m 0644 "${WORKDIR}/server.sh" "${D}${sysconfdir}/profile.d"
}



