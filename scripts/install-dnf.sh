#!/bin/bash
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
    "libvirt"
    "virt-install"
    "virt-viewer"
    "guestfs-tools"
    "tuned"
    "virtio-win"
    # Fonts
    "nerd-fonts"
    "fira-code-fonts"
    # Programming
    "strace"
    "ltrace"
    "dotnet-sdk-8.0"
    "python3-pip"
    # Pano requirements
    "libgda-sqlite"
    # Media downloader
    "python3-streamlink"
    # Fuzzy search
    "fzf"
    # OpenH264 (for live-streams viewing)
    "gstreamer1-plugin-openh264"
    "mozilla-openh264"
)

# Create symlink from fastfetch to neofetch
ln -s /usr/bin/fastfetch /usr/bin/neofetch

for app in "${APPS[@]}"
do
    sudo dnf install -y "$app"
done
