ifconfig eth0 192.168.1.3 netmask 255.255.255.0 up
route add -n 224.224.224.225 dev eth0
export VSOMEIP_CONFIGURATION=/usr/bin/vsomeip-server.json
LD_LIBRARY_PATH=/usr/lib

