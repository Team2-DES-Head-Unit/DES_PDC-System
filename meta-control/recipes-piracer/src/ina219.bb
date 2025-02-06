SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://Adafruit_CircuitPython_INA219.tar.xz \
"
SRC_URI[md5sum] ="f1b35522f15bed74fc0190bb961c4a53"


S = "${WORKDIR}/Adafruit_CircuitPython_INA219"

inherit allarch python3-dir

do_install() {
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/
    cp -r ${S}/adafruit_ina219.py ${D}${PYTHON_SITEPACKAGES_DIR}/
}

FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/"
