#!/bin/sh
set -e

case "$1" in
    # Set light theme
    light)
        gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
        gsettings set org.gnome.desktop.interface color-scheme 'default'
        ;;

    # Set dark theme
    dark)
        gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
        ;;

    # Drop theme to default
    *)
        gsettings reset org.gnome.desktop.interface gtk-theme
        gsettings reset org.gnome.desktop.interface color-scheme
        ;;
esac
