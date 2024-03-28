#!/bin/bash
set -e

EXTENSIONS=(
    # Clipboard manager
    "pano@elhan.io"
    # Blur utilities
    "blur-my-shell@aunetx"
    # Workspace wraparound
    "just-perfection-desktop@just-perfection"
)

for extension in "${EXTENSIONS[@]}"
do
    gnome-extensions-cli install "$extension"
done
