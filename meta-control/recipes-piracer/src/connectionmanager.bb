SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://Adafruit_CircuitPython_ConnectionManager-main.tar.xz \
"
SRC_URI[md5sum] ="3771423ace66e5a4cccc9393e82c4516"


S = "${WORKDIR}/Adafruit_CircuitPython_ConnectionManager-main"

inherit allarch python3-dir

do_install() {
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/
    cp -r ${S}/adafruit_connection_manager.py ${D}${PYTHON_SITEPACKAGES_DIR}/
}


FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/"

