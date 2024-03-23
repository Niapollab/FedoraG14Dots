#!/bin/sh
set -e

APPS=(
    # Gnome extensions manager
    "gnome-extensions-cli"
)

for app in "${APPS[@]}"
do
    pip3 install --upgrade "$app"
done
