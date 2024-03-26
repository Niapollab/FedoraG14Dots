#!/bin/sh
set -e

APPS=(
    # Media player
    "org.videolan.VLC"
    # Photo editor
    "org.gimp.GIMP"
    # Vector graphics editor
    "org.inkscape.Inkscape"
    # Social networks
    "org.telegram.desktop"
    "io.github.spacingbat3.webcord"
    # Streaming
    "com.obsproject.Studio"
    # Zip utils
    "io.github.peazip.PeaZip"
    # Torrent tracker
    "org.qbittorrent.qBittorrent"
    # Flatpak packages manager
    "com.github.tchx84.Flatseal"
    # Hex editor
    "net.werwolv.ImHex"
    # Traffic sniffer
    "org.wireshark.Wireshark"
    # System resource viewer
    "io.missioncenter.MissionCenter"
    # Office
    "org.libreoffice.LibreOffice"
    # Gnome theme editor
    "io.github.realmazharhussain.GdmSettings"
    "ca.desrt.dconf-editor"
    "com.mattjakeman.ExtensionManager"
    # Webcamera checker
    "org.gnome.Cheese"
    # Audio editor
    "org.tenacityaudio.Tenacity"
    # Reverse utils
    "org.ghidra_sre.Ghidra"
    # Markdown editor
    "md.obsidian.Obsidian"
)

for app in "${APPS[@]}"
do
    flatpak install -y flathub "$app"
done
