#!/bin/bash
set -e

APPS=(
    "cheese"
    "mediawriter"
    "gnome-tour"
    "libreoffice-calc"
    "libreoffice-writer"
    "libreoffice-impress"
    "gnome-boxes"
    "PackageKit-command-not-found"
)

for app in "${APPS[@]}"
do
    sudo dnf remove -y "$app"
done
