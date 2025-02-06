SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://Adafruit_CircuitPython_Typing-main.tar.xz \
"
SRC_URI[md5sum] ="e4fda2f2e4578696543d5bb4a126b664"


S = "${WORKDIR}/Adafruit_CircuitPython_Typing-main"

inherit allarch python3-dir

do_install() {
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/circuitpython_typing
    cp -r ${S}/circuitpython_typing/* ${D}${PYTHON_SITEPACKAGES_DIR}/circuitpython_typing
}


FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/circuitpython_typing"

