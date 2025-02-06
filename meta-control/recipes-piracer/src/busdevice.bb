SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://Adafruit_CircuitPython_BusDevice.tar.xz \
"
SRC_URI[md5sum] ="4167f9c5ae49b7e5c5c0213139d5a44a"


S = "${WORKDIR}/Adafruit_CircuitPython_BusDevice"

inherit allarch python3-dir

do_install() {
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/
    cp -r ${S}/adafruit_bus_device ${D}${PYTHON_SITEPACKAGES_DIR}/
}


FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/"

