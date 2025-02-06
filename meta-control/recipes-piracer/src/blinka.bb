SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://Adafruit_Blinka.tar.xz"

S = "${WORKDIR}/Adafruit_Blinka"

inherit python3-dir


RDEPENDS:${PN} += "glibc libgpiod python3-requests"

do_install:append() {
    find ${D} -name "libgpiod_pulsein" -delete
    find ${D} -name ".debug" -type d -exec rm -rf {} +
    install -d ${D}${bindir}/blinka/src/adafruit_blinka/microcontroller/bcm283x/pulseio
    cp ${WORKDIR}/Adafruit_Blinka/src/adafruit_blinka/microcontroller/bcm283x/pulseio/libgpiod_pulsein64 \
       ${D}${bindir}/blinka/src/adafruit_blinka/microcontroller/bcm283x/pulseio/libgpiod_pulsein
       
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/
    cp -r ${S}/src/* ${D}${PYTHON_SITEPACKAGES_DIR}/
    find ${D}${bindir}/blinka/src -name "libgpiod_pulsein" -delete
    find ${D}${bindir}/blinka/src -name ".debug" -type d -exec rm -rf {} +
    find ${D}${PYTHON_SITEPACKAGES_DIR}/ -name "libgpiod_pulsein" -delete
    find ${D}${PYTHON_SITEPACKAGES_DIR}/ -name ".debug" -type d -exec rm -rf {} +
}

COMPATIBLE_HOST = "aarch64.*-linux"
FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/blinka ${bindir}/blinka"
FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/"


