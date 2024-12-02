#!/bin/bash
set -e

APPS=(
    # Nvidia
    "kernel-devel"
    "akmod-nvidia"
    "xorg-x11-drv-nvidia-cuda"
    "nvidia-container-toolkit"
    # Asus tools
    "asusctl"
    "supergfxctl"
    "asusctl-rog-gui"
    # Terminals
    "alacritty"
    "wezterm"
    # Nautilus python extensions
    "nautilus-python"
    # Text editors
    "micro"
    "code"
    # Wayland clipboard manager (for micro)
    "wl-clipboard"
    # Brightness CLI tool
    "brightnessctl"
    # Shell
    "zsh"
    # System fetch
    "fastfetch"
    # System monitoring
    "btop"
    # Cursor theme
    "bibata-cursor-themes"
    # Icons theme
    "papirus-icon-theme"
    "papirus-icon-theme-dark"
    "papirus-icon-theme-light"
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
    "docker-buildx"
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
    "go"
    "nodejs-npm"
    # Pano requirements
    "libgda-sqlite"
    # Media downloader
    "python3-streamlink"
    "aria2"
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
    # Extended cd util
    "zoxide"
    # Battery profiler
    "powertop"
    # Android screen mirroring
    "scrcpy"
    # Gaming
    "portproton"
    "steam"
    # Windows Hello
    "howdy"
    # SSH autoconnect
    "autossh"
)

# Enable buildx plugin for Docker
docker buildx install

# Create symlink from fastfetch to neofetch
ln -s /usr/bin/fastfetch /usr/bin/neofetch

# Create symlink from alacritty to gnome-terminal
ln -s /usr/bin/alacritty /usr/bin/gnome-terminal

# Initialize Rust
rustup-init -y

for app in "${APPS[@]}"
do
    sudo dnf install -y "$app"
done
