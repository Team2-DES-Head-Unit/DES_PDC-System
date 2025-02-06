#!/bin/bash

check_wifi() {
   if ping -c 1 8.8.8.8 &> /dev/null; then
       return 0
   else
       return 1
   fi
}
check_usb() {
    if ls /dev/sda1 &> /dev/null; then
        return 0
    else
        return 1
    fi
}

while ! check_wifi; do
	echo "Waiting"
	sleep 1
done


export QT_QPA_PLATFORM=wayland

/usr/bin/hu/HeadUnit QT_QPA_PLATFORM=wayland --no-sandbox & /usr/bin/ic/IC_TEST QT_QPA_PLATFORM=wayland

