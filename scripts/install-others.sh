#!/bin/bash
set -e

# Oh-my-zsh
sh -c "$(curl -fsSL 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh')"

# zsh-syntax-highlighting
git clone 'https://github.com/zsh-users/zsh-syntax-highlighting.git' "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# zsh-autosuggestions
git clone 'https://github.com/zsh-users/zsh-autosuggestions.git' "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# zsh-fzf-history-search
git clone 'https://github.com/joshskidmore/zsh-fzf-history-search.git' "$ZSH_CUSTOM/plugins/zsh-fzf-history-search"

# GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
rm -f "$HOME/.gdbinit"
mv -f "$(find ~ -name ".gef*" | head -1)" "$HOME/.gef.py"

# pwndbg
PWNDBG_URL=$(curl -sL 'https://api.github.com/repos/pwndbg/pwndbg/releases' | sed -n 's/.*\"browser_download_url\"\s*:\s*\"\(.*\)\"/\1/p' | grep '.x86_64.rpm' | head -1)
curl -sL "$PWNDBG_URL" -o "/tmp/pwndbg.rpm"
sudo dnf install -y "/tmp/pwndbg.rpm"
rm -f "/tmp/pwndbg.rpm"

# Install Pywalfox to Firefox
pywalfox install

PYWALFOX_PAGE="$(curl -sL 'https://addons.mozilla.org/en-US/firefox/addon/pywalfox/' | sed -n 's#.*\"https://addons.mozilla.org/firefox/downloads/file/\(.*\)\"#https://addons.mozilla.org/firefox/downloads/file/\1#p')"
PYWALFOX_PAGE="${PYWALFOX_PAGE%%\"*}"

curl -sL "$PYWALFOX_PAGE" -o '/tmp/pywalfox.xpi'
firefox '/tmp/pywalfox.xpi'
read -r -p "[@] Enter any key when extension will be installed"
rm '/tmp/pywalfox.xpi'

# Install ublock-origin to Firefox
UBLOCK_ORIGIN_PAGE="$(curl -sL 'https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/' | sed -n 's#.*\"https://addons.mozilla.org/firefox/downloads/file/\(.*\)\"#https://addons.mozilla.org/firefox/downloads/file/\1#p')"
UBLOCK_ORIGIN_PAGE="${UBLOCK_ORIGIN_PAGE%%\"*}"

curl -sL "$UBLOCK_ORIGIN_PAGE" -o '/tmp/ublock_origin.xpi'
firefox '/tmp/ublock_origin.xpi'
read -r -p "[@] Enter any key when extension will be installed"
rm '/tmp/ublock_origin.xpi'
