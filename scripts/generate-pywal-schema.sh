#!/bin/sh
set -e

# Get current Gnome desktop background path
WALLPAPER_PATH="$(gsettings get org.gnome.desktop.background picture-uri)"

# Sanitize path
WALLPAPER_PATH="/${WALLPAPER_PATH##*//}"
WALLPAPER_PATH="${WALLPAPER_PATH%\'*}"

# Set the color scheme
wal -q -n -s -t -e -i "$WALLPAPER_PATH"
