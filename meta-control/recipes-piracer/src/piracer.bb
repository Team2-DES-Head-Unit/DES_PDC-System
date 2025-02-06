SUMMARY = "PiRacer control Python code"
DESCRIPTION = "PiRacer control code from GitHub"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://piracer_py_v0.1.1.tar.xz \
"
SRC_URI[sha256sum] ="968c0708e75f56309617c37c9f2ae91218b8c361203a37894c3f871545813cab"


S = "${WORKDIR}/piracer_py_v0.1.1"

inherit allarch python3-dir

do_install() {
    install -d ${D}${bindir}/piracer
    cp -r ${S}/piracer/* ${D}${bindir}/piracer
}

FILES:${PN} += "${bindir}/piracer"

