#!/bin/bash
set -e

# RPM Fusion
sudo dnf install \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/CORP_yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.CORP_repos.d/vscode.repo'

# VirtIO
sudo curl -sL https://fedorapeople.org/groups/virt/virtio-win/virtio-win.repo -o /etc/yum.repos.d/virtio-win.repo

CORP_REPOS=(
    # Asus tools
    "lukenukem/asus-linux"
    # Bibata cursors
    "peterwu/rendezvous"
    # Nerd-fonts
    "che/nerd-fonts"
    # Nwg-look
    "tofik/nwg-shell"
)

for repo in "${CORP_REPOS[@]}"
do
    sudo dnf -y copr enable "$repo"
done
