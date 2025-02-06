SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://pygame.tar.xz \
"
SRC_URI[md5sum] ="2374d55bb616709259275ce2666fe81b"


S = "${WORKDIR}/pygame"

inherit python3-dir

RDEPENDS:${PN} += "python3-numpy bash"


do_install() {
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/pygame
    cp -r ${S}/* ${D}${PYTHON_SITEPACKAGES_DIR}/pygame
}

FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/pygame"
