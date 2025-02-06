SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://Adafruit_Python_PlatformDetect-main.tar.xz \
"
SRC_URI[md5sum] ="a5558c817bed84f22cbe293464fdafe7"


S = "${WORKDIR}/Adafruit_Python_PlatformDetect-main"

inherit allarch python3-dir

do_install() {
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/adafruit_platformdetect
    cp -r ${S}/adafruit_platformdetect/* ${D}${PYTHON_SITEPACKAGES_DIR}/adafruit_platformdetect
}


FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/adafruit_platformdetect"

