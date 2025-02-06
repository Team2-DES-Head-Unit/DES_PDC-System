SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://pyserial.tar.xz \
"
SRC_URI[md5sum] ="3a9d02f57afec50f8bbdd862bd37de40"


S = "${WORKDIR}/pyserial"

inherit allarch python3-dir

do_install() {
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/pyserial
    cp -r ${S}/* ${D}${PYTHON_SITEPACKAGES_DIR}/pyserial
}

FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/pyserial"
