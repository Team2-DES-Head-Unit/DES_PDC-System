SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://Adafruit_CircuitPython_Requests-main.tar.xz \
"
SRC_URI[md5sum] ="bfd49fbcee6475d5580ca2e17bac4e2e"


S = "${WORKDIR}/Adafruit_CircuitPython_Requests-main"

inherit allarch python3-dir

do_install() {
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/
    cp -r ${S}/adafruit_requests.py ${D}${PYTHON_SITEPACKAGES_DIR}/
}


FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/"

