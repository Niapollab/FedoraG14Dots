#!/bin/bash
set -e

APPS=(
    "mediawriter"
    "gnome-tour"
    "libreoffice-calc"
    "libreoffice-writer"
    "libreoffice-impress"
    "gnome-boxes"
    "PackageKit-command-not-found"
    "gnome-connections"
    "gnome-terminal"
    "ptyxis"
)

for app in "${APPS[@]}"
do
    sudo dnf remove -y "$app"
done
