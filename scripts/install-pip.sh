#!/bin/bash
set -e

APPS=(
    # Gnome extensions manager
    "gnome-extensions-cli"
    # Reverse
    "frida-tools"
    "qiling"
    # HTTP intercepting proxy
    "mitmproxy"
    # Python debugger
    "debugpy"
    # Youtube media downloader
    "yt-dlp"
    # Python linter and code formatter
    "ruff"
    # Nautilus extension
    "nautilus-open-any-terminal"
)

# Recompile dconf schemas
glib-compile-schemas "$HOME/.local/share/glib-2.0/schemas/"

for app in "${APPS[@]}"
do
    pip3 install --upgrade "$app"
done
