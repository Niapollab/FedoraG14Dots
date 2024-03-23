#!/bin/sh
set -e

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
rm -f "~/.gdbinit"
mv -f `find ~ -name ".gef*" | head -1` "$HOME/.gef.py"

# pwndbg
PWNDBG_URL=`curl -sL https://api.github.com/repos/pwndbg/pwndbg/releases | sed -n 's/.*\"browser_download_url\"\s*:\s*\"\(.*\)\"/\1/p' | grep '.x86_64.rpm' | head -1`
curl -sL "$PWNDBG_URL" -o "/tmp/pwndbg.rpm"
sudo dnf install -y "/tmp/pwndbg.rpm"
rm -f "/tmp/pwndbg.rpm"
