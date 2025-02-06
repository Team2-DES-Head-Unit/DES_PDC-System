SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://Adafruit_CircuitPython_PCA9685.tar.xz \
"
SRC_URI[md5sum] ="1633e1063a4f6002cfaa25bd72bd4d92"


S = "${WORKDIR}/Adafruit_CircuitPython_PCA9685"

inherit allarch python3-dir


do_install() {
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/
    cp -r ${S}/adafruit_pca9685.py ${D}${PYTHON_SITEPACKAGES_DIR}/
}

FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/"
