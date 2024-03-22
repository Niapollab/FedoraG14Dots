#!/bin/sh
set -e

APPS=(
    # Nvidia
    "kernel-devel"
    "akmod-nvidia"
    "xorg-x11-drv-nvidia-cuda"
    # Asus toolsa
    "asusctl"
    "supergfxctl"
    "asusctl-rog-gui"
    # Text editors
    "micro"
    "code"
    # Shell
    "zsh"
    # System fetch
    "fastfetch"
    # Cursor theme
    "bibata-cursor-themes"
    # Gnome theme editor
    "nwg-look"
    # Internal VPN
    "zerotier-one"
    # Android
    "android-tools"
    # Virtualization
    "docker"
    "virt-manager"
    # Fonts
    "nerd-fonts"
    # Programming
    "strace"
    "ltrace"
    "dotnet-sdk-8.0"
    "python3-pip"
    # Pano requirements
    "libgda-sqlite"
)

for app in "${APPS[@]}"
do
    sudo dnf install -y "$app"
done
