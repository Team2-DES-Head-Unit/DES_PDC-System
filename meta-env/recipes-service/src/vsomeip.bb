SUMMARY = "vSomeIP Communication Library"
DESCRIPTION = "vSomeIP C++ middleware for SOME/IP services"
LICENSE = "CLOSED"

SRC_URI = "git://github.com/Team2-DES-Head-Unit/DES_Head-Unit.git;branch=master;protocol=https"
SRCREV = "3c44edbca9fcc5b26b8af13b38716475a5976a09"

S = "${WORKDIR}/git"
B_lib = "${WORKDIR}/build-lib"

inherit cmake pkgconfig
DEPENDS += "boost"

# CMake configure 단계
do_configure() {
    cmake -B ${B_lib} -S ${S} \
        -DCMAKE_INSTALL_PREFIX=${D}/usr \
        -DBOOST_ROOT=${STAGING_DIR_HOST}/usr \
        -DBOOST_INCLUDEDIR=${STAGING_DIR_HOST}/usr/include \
        -DBOOST_LIBRARYDIR=${STAGING_DIR_HOST}/usr/lib
}

# 컴파일 단계
do_compile() {
    cmake --build ${B_lib}
}

# 설치 단계
do_install() {
    # 라이브러리와 헤더 파일 설치
    cmake --install ${B_lib} --prefix=${D}/usr
    
    # 헤더 파일 확인 후 복사
    if [ -d "${S}/interface/vsomeip" ]; then
        install -d ${D}/usr/bin/vsomeip
        cp -r ${S}/interface/vsomeip/* ${D}/usr/bin/vsomeip/
    else
        echo "Error: ${S}/interface/vsomeip directory does not exist."
        exit 1
    fi

    # pkgconfig 파일 설치
    install -d ${D}${libdir}/pkgconfig
    if [ -f "${B_lib}/vsomeip3.pc" ]; then
        # 여기서 경로 수정 (임시 빌드 경로를 실제 설치 경로로 변경)
        sed -i "s|${D}|/usr|g" ${B_lib}/vsomeip3.pc
        install -m 0644 ${B_lib}/vsomeip3.pc ${D}${libdir}/pkgconfig/
    else
        echo "Error: ${B_lib}/vsomeip3.pc not found."
        exit 1
    fi

    # 불필요한 설정 파일 제거
    rm -rf ${D}/usr/etc
}

# 패키지 파일 정의
FILES:${PN} += "/usr/include /usr/lib /usr/bin/vsomeip"

# 불필요한 경고 방지를 위한 설정
INSANE_SKIP:${PN} = "installed-vs-shipped"
INSANE_SKIP:${PN} += "pkgconfig"

