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
)

for app in "${APPS[@]}"
do
    pip3 install --upgrade "$app"
done
