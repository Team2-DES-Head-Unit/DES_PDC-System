SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://Adafruit_CircuitPython_SSD1306.tar.xz \
"
SRC_URI[md5sum] ="03af6d23b67247acf964fb231f256332"


S = "${WORKDIR}/Adafruit_CircuitPython_SSD1306"

inherit allarch python3-dir

do_install() {
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/
    cp -r ${S}/adafruit_ssd1306.py ${D}${PYTHON_SITEPACKAGES_DIR}/
}

FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/"
