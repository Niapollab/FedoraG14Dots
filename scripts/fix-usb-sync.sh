#!/bin/sh
set -e

sudo tee /usr/lib/sysctl.d/10-fix-usb-sync.conf > /dev/null << EOF
vm.dirty_bytes=$((48*1024*1024))
vm.dirty_background_bytes=$((16*1024*1024))
EOF
