ENABLE_SPI_BUS = "1"
ENABLE_I2C = "1"


do_deploy:append() { 
    echo "hdmi_safe=1" >> $CONFIG
    echo "#hdmi_force_hotplug=1" >> $CONFIG
    echo "#hdmi_drive=2" >> $CONFIG
    echo "#arm_boost=1" >> $CONFIG
    echo "#hdmi_group=2" >> $CONFIG
    echo "#hdmi_mode=87" >> $CONFIG
    echo "#hdmi_cvt 1024 600 60 6 0 0 0" >> $CONFIG
    echo "dtparam=i2c_arm=on" >> $CONFIG
    echo "dtoverlay=spi1-3cs" >> $CONFIG
    echo "dtoverlay=spi0-3cs" >> $CONFIG
    echo "dtoverlay=mcp251xfd,spi0-0,interrupt=25" >> $CONFIG
    echo "dtoverlay=mcp251xfd,spi1-0,interrupt=24" >> $CONFIG
    echo "# Automatically load overlays for detected cameras" >> $CONFIG
    echo "camera_auto_detect=1" >> $CONFIG

    echo "# Automatically load overlays for detected DSI displays" >> $CONFIG
    echo "display_auto_detect=1" >> $CONFIG

    echo "# Enable DRM VC4 V3D driver" >> $CONFIG
    echo "dtoverlay=vc4-kms-v3d" >> $CONFIG
    echo "max_framebuffers=2" >> $CONFIG
    echo "dtoverlay=vc4-kms-dsi-waveshare-panel,7_9_inch" >> $CONFIG

    echo "# Disable compensation for displays with overscan" >> $CONFIG
    echo "disable_overscan=1" >> $CONFIG

    echo "# Enable CAN" >> $CONFIG
    echo "#dtoverlay=seeed-can-fd-hat-v1" >> $CONFIG

    echo "# Enable audio" >> $CONFIG
    echo "dtparam=audio=on" >> $CONFIG
    
    
    echo "disable_splash=1" >> $CONFIG
}


