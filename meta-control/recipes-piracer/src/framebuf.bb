SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://Adafruit_CircuitPython_framebuf-main.tar.xz \
"
SRC_URI[md5sum] ="042b539c9bd0644334c9882cd7afe3ea"


S = "${WORKDIR}/Adafruit_CircuitPython_framebuf-main"

inherit allarch python3-dir

do_install() {
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/
    cp -r ${S}/adafruit_framebuf.py ${D}${PYTHON_SITEPACKAGES_DIR}/
}


FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/"

