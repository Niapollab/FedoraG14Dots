#!/bin/bash
set -e

# RPM Fusion
sudo dnf install -y \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# RPM Fusion Rawhide (in disabled mode)
sudo dnf install -y \
    "rpmfusion-free-release-rawhide" \
    "rpmfusion-nonfree-release-rawhide"

# VSCode
sudo rpm --import 'https://packages.microsoft.com/keys/microsoft.asc'
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/CORP_yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.CORP_repos.d/vscode.repo'

# VirtIO
sudo curl -sL https://fedorapeople.org/groups/virt/virtio-win/virtio-win.repo -o /etc/yum.repos.d/virtio-win.repo

# Docker CE
sudo curl -sL 'https://download.docker.com/linux/fedora/docker-ce.repo' -o '/etc/yum.repos.d/docker-ce.repo'

# Nvidia Docker toolkit (https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
sudo curl -sL https://nvidia.github.io/libnvidia-container/centos8/libnvidia-container.repo -o /etc/yum.repos.d/nvidia-container-toolkit.repo

CORP_REPOS=(
    # Asus tools
    "lukenukem/asus-linux"
    # Bibata cursors
    "peterwu/rendezvous"
    # Nerd-fonts
    "che/nerd-fonts"
    # Nwg-look
    "tofik/nwg-shell"
    # Scrcpy
    "zeno/scrcpy"
    # PortProton
    "boria138/portproton"
    # WezTerm
    "wezfurlong/wezterm-nightly"
)

for repo in "${CORP_REPOS[@]}"
do
    sudo dnf -y copr enable "$repo"
done
