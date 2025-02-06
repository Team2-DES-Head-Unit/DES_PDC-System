SUMMARY = "Client"
DESCRIPTION = "Client application using vSomeIP"
LICENSE = "CLOSED"

SRC_URI = "git://github.com/Team2-DES-Head-Unit/DES_Head-Unit.git;branch=master;protocol=https"
SRCREV = "a4c2b8e1e0029df57b0fc61f604ccba965547a88"

S = "${WORKDIR}/git"

inherit cmake pkgconfig

DEPENDS += "vsomeip boost"

# CMake 설정에서 필요한 라이브러리와 헤더 파일 경로를 pkg-config로 처리
do_configure() {
    cmake -B ${B} -S ${S}/src \
        -DCMAKE_INSTALL_PREFIX=${D}/usr \
        -DPKG_CONFIG_EXECUTABLE=${STAGING_BINDIR_NATIVE}/pkg-config \
        -Dvsomeip_DIR=${STAGING_DIR_TARGET}/usr/lib/cmake/vsomeip3 \
        -DBOOST_ROOT=${STAGING_DIR_TARGET}/usr
}

do_compile() {
    cmake --build ${B}
}

do_install() {
    install -d ${D}/usr/bin
    install -m 0755 ${B}/HelloWorldClient ${D}/usr/bin/
    install -m 0755 ${S}/config/vsomeip-client.json ${D}/usr/bin/
}

# pkgconfig 관련 경고를 무시
INSANE_SKIP:${PN} += "pkgconfig"

# 패키지에 포함되는 파일 목록
FILES:${PN} += "/usr/bin/HelloWorldClient"

