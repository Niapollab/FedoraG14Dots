#!/bin/bash
set -e

EXTENSIONS=(
    # Clipboard manager
    "pano@elhan.io"
    # Blur utilities
    "blur-my-shell@aunetx"
    # Workspace wraparound
    "just-perfection-desktop@just-perfection"
    # Stay display alive
    "caffeine@patapon.info"
)

for extension in "${EXTENSIONS[@]}"
do
    gnome-extensions-cli install "$extension"
done
