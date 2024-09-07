#!/bin/bash
set -e

APPS=(
    # Gnome extensions manager
    "gnome-extensions-cli"
    # Pywal
    "pywal"
    "pywalfox"
    # Reverse
    "frida-tools"
    "qiling"
    # Python debugger
    "debugpy"
    # Youtube media downloader
    "yt-dlp"
)

for app in "${APPS[@]}"
do
    pip3 install --upgrade "$app"
done
