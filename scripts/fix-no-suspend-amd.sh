#!/bin/sh
set -e

sudo tee /etc/udev/rules.d/10-fix-no-suspend-amd.rules > /dev/null << EOF
SUBSYSTEM=="usb", DRIVER=="usb", ATTR{idVendor}=="0b05", ATTR{idProduct}=="193b", ATTR{power/wakeup}="disabled"
EOF
