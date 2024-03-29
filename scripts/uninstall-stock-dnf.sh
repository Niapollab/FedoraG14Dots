#!/bin/sh
set -e

APPS=(
    "cheese"
    "mediawriter"
    "gnome-tour"
    "libreoffice-calc"
    "libreoffice-writer"
    "libreoffice-impress"
    "gnome-boxes"
)

for app in "${APPS[@]}"
do
    sudo dnf remove -y "$app"
done
