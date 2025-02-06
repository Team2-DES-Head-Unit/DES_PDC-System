#!/bin/bash

# Set the vsomeip configuration environment variable
export VSOMEIP_CONFIGURATION=/usr/bin/vsomeip-client.json
echo "VSOMEIP_CONFIGURATION is set to $VSOMEIP_CONFIGURATION"

# Add the multicast route
sudo route add -host 224.224.224.225 dev wlan0
echo "Multicast route added for 224.224.224.225 on wlan0"
