#!/bin/sh
set -e

# Console TTY Font
sudo tee /etc/vconsole.conf > /dev/null << EOF
KEYMAP="ru"
FONT="latarcyrheb-sun32"
EOF
