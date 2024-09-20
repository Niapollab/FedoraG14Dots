#!/bin/bash
set -e

APPS=(
    # Media player
    "org.videolan.VLC"
    # Photo editor
    "org.gimp.GIMP"
    "com.github.flxzt.rnote"
    # Vector graphics editor
    "org.inkscape.Inkscape"
    # Video editor
    "org.shotcut.Shotcut"
    # Mail client
    "org.mozilla.Thunderbird"
    # Social networks
    "org.telegram.desktop"
    "io.github.spacingbat3.webcord"
    "com.skype.Client"
    "com.github.IsmaelMartinez.teams_for_linux"
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
    # Audio editor
    "org.tenacityaudio.Tenacity"
    # Reverse utils
    "org.ghidra_sre.Ghidra"
    "com.github.skylot.jadx"
    # Markdown editor
    "md.obsidian.Obsidian"
    "org.kde.ghostwriter"
    # P2P file sync
    "me.kozec.syncthingtk"
    # Tor browser
    "org.torproject.torbrowser-launcher"
    # RDP client
    "org.remmina.Remmina"
    # Games
    "org.gnome.Mines"
)

for app in "${APPS[@]}"
do
    flatpak install -y flathub "$app"
done

# Add syncthin-gtk to autostart
tee "$HOME/.config/autostart/me.kozec.syncthingtk.desktop" > /dev/null << EOF
[Desktop Entry]
Type=Application
Name=me.kozec.syncthingtk
Exec=flatpak run --command=syncthing-gtk me.kozec.syncthingtk --minimized
X-Flatpak=me.kozec.syncthingtk
EOF

# Install 2x scale for Ghidra
sed 's/\(VMARGS_LINUX=-Dsun.java2d.uiScale=\)[0-9]*/\12/g' -i ~/.var/app/org.ghidra_sre.Ghidra/config/ghidra.properties

# Install dark theme for Ghidra
GHIDRA_THEMES_PATH="$(find "$HOME" -name ".ghidra_*" | head -1)/themes"
GHIDRA_DARK_URL=$(curl -sL https://api.github.com/repos/zackelia/ghidra-dark-theme/releases | sed -n 's/.*\"browser_download_url\"\s*:\s*\"\(.*\)\"/\1/p' | grep '.theme' | head -1)

curl -sL "$GHIDRA_DARK_URL" -o "$GHIDRA_THEMES_PATH/ghidra-dark.theme"
