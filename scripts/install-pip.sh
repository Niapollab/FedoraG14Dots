#!/bin/bash
set -e

APPS=(
    # Gnome extensions manager
    "gnome-extensions-cli"
    # Pywal
    "pywal"
    "pywalfox"
)

for app in "${APPS[@]}"
do
    pip3 install --upgrade "$app"
done

# Install Pywalfox to Firefox
pywalfox install

PYWALFOX_PAGE="$(curl -sL 'https://addons.mozilla.org/en-US/firefox/addon/pywalfox/' | sed -n 's#.*\"https://addons.mozilla.org/firefox/downloads/file/\(.*\)\"#https://addons.mozilla.org/firefox/downloads/file/\1#p')"
PYWALFOX_PAGE="${PYWALFOX_PAGE%%\"*}"

curl -sL "$PYWALFOX_PAGE" -o '/tmp/pywalfox.xpi'
firefox '/tmp/pywalfox.xpi'
read -r -p "[@] Enter any key when extension will be installed"
rm '/tmp/pywalfox.xpi'
