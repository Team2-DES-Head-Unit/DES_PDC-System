IMG_BASE = " \
    python3 \
    python3-numpy \ 
    wpa-supplicant \
    openssh \
    i2c-tools \
    bash \
    git \
    can-utils \
    libsocketcan \
    bcm2835-dev \
    bcm2835-tests \
    psplash \
    python3-typing-extensions \
    cmake \
    sudo \
    mesa \
    mpv \
    fontconfig \
    liberation-fonts \
    ttf-bitstream-vera \
    udev-rules-rpi \
"



GSTREAMER_PKGS = " \
    gstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-ugly \
    pulseaudio \
    gstreamer1.0-omx \
"

QT_BASE = " \
    qtbase \
    qtbase-dev \
    qtbase-mkspecs \
    qtbase-plugins \
    qtbase-tools \
"

QT_PKGS = " \
    qtwayland \
    qtwayland-dev \
    qtwayland-mkspecs \
    qtwayland-tools \
    qtconnectivity \
    qtconnectivity-dev \
    qtconnectivity-mkspecs \
    qtquickcontrols \
    qtquickcontrols-qmlplugins \
    qtquickcontrols2 \
    qtquickcontrols2-dev \
    qtquickcontrols2-mkspecs \
    qtquickcontrols2-qmlplugins \
    qtdeclarative \
    qtdeclarative-dev \
    qtdeclarative-mkspecs \
    qtdeclarative-qmlplugins \
    qtgraphicaleffects \
    qtgraphicaleffects-dev \
    qtmultimedia \
    qtmultimedia-plugins \
    qtmultimedia-qmlplugins \
    qtlocation-dev \ 
    qtlocation-mkspecs \ 
    qtlocation-plugins \
    qtlocation-qmlplugins \
    qtlocation \ 
    qtwebengine \
"


PIRACER = " \
    python3-pip \
    piracer \
    v4l-utils \
    python3-dev \
    python3-setuptools \
    raspi-gpio \
    rpio \
    rpi-gpio \
    pi-blaster \
    python3-adafruit-circuitpython-register \
    platformdetect \
    python3-adafruit-pureio \
    blinka \
    busdevice \
    ina219 \
    pca9685 \
    pygame \
    pyserial \
    ssd \
    requests \
    framebuf \
    typing \
    connectionmanager \
"

Application =" \
    hu \
    ic \
"
WESTON =" \
    westo \
"
BOOTING=" \
    audiboot \
"
COMMUNICATION =" \
    vsomeip \
    ichu \
    serveric \
"

IMAGE_INSTALL += " \
    ${GSTREAMER_PKGS} \
    ${IMG_BASE} \
    ${QT_BASE} \
    ${QT_PKGS} \
    ${PIRACER} \
    ${WESTON} \
    ${Application} \
    ${COMMUNICATION} \
"
