#!/bin/bash
set -e

APPS=(
    # Nvidia
    "kernel-devel"
    "akmod-nvidia"
    "xorg-x11-drv-nvidia-cuda"
    # Asus tools
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
    # GTK apps theme
    "adw-gtk3-theme"
    # Gnome theme editor
    "nwg-look"
    # Internal VPN
    "zerotier-one"
    # Android
    "android-tools"
    # Virtualization
    "docker"
    "docker-buildx-plugin"
    "docker-compose-plugin"
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
    "rustup"
    "nodejs-npm"
    # Pano requirements
    "libgda-sqlite"
    # Media downloader
    "python3-streamlink"
    # Fuzzy search
    "fzf"
    # OpenH264 (for live-streams viewing)
    "gstreamer1-plugin-openh264"
    "mozilla-openh264"
    # System backups
    "timeshift"
    # Extended cat util
    "bat"
    # Extended ls util
    "eza"
    # Battery profiler
    "powertop"
    # Android screen mirroring
    "scrcpy"
    # Gaming
    "portproton"
    "steam"
    # Windows Hello
    "howdy"
)

# Enable buildx plugin for Docker
docker buildx install

# Create symlink from fastfetch to neofetch
ln -s /usr/bin/fastfetch /usr/bin/neofetch

# Initialize Rust
rustup-init -y

for app in "${APPS[@]}"
do
    sudo dnf install -y "$app"
done
