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

# Headline ZSH Theme
curl -sL 'https://raw.githubusercontent.com/moarram/headline/main/headline.zsh-theme' -o "$ZSH_CUSTOM/themes/headline.zsh-theme"

# Zed
curl https://zed.dev/install.sh | sh

# Pyenv
git clone 'https://github.com/pyenv/pyenv.git' "$HOME/.pyenv"

sudo tee /etc/profile.d/pyenv-in-path.sh > /dev/null << EOF
export PYENV_ROOT="\$HOME/.pyenv"
PYENV_PATH="\$PYENV_ROOT/bin"

case "\$PATH" in
    *"\$PYENV_PATH"* ) true ;;
    * ) PATH="\$PATH:\$PYENV_PATH" ;;
esac
EOF

# GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
rm -f "$HOME/.gdbinit"
mv -f "$(find ~ -name '.gef*' | head -1)" "$HOME/.gef.py"

# PINCE (Cheat Engine alternative)
PINCE_URL="$(curl -sL 'https://api.github.com/repos/korcankaraokcu/PINCE/releases' | sed -n 's/.*\"browser_download_url\"\s*:\s*\"\(.*\)\"/\1/p' | grep '.AppImage' | head -1)"
curl -sL "$PINCE_URL" -o '/tmp/Pince.AppImage'
mkdir -p "$HOME/.local/pince.app" "$HOME/.local/bin"
mv '/tmp/Pince.AppImage' "$HOME/.local/pince.app/Pince.AppImage"
tee "$HOME/.local/bin/pince" > /dev/null << EOF
#!/bin/sh
sudo -E -b "/home/$(whoami)/.local/pince.app/Pince.AppImage" 1>/dev/null 2>&1
EOF
chmod +x "$HOME/.local/pince.app/Pince.AppImage" "$HOME/.local/bin/pince"

# pwndbg
PWNDBG_URL="$(curl -sL 'https://api.github.com/repos/pwndbg/pwndbg/releases' | sed -n 's/.*\"browser_download_url\"\s*:\s*\"\(.*\)\"/\1/p' | grep '.x86_64.rpm' | head -1)"
curl -sL "$PWNDBG_URL" -o '/tmp/pwndbg.rpm'
sudo dnf install -y '/tmp/pwndbg.rpm'
rm -f '/tmp/pwndbg.rpm'

# Shadowsocks client
SHADOWSOCKS_URL="$(curl -sL 'https://api.github.com/repos/shadowsocks/shadowsocks-rust/releases' | sed -n 's/.*\"browser_download_url\"\s*:\s*\"\(.*\)\"/\1/p' | grep '.x86_64-unknown-linux-gnu.tar.xz' | head -1)"
SHADOWSOCKS_DIR='/tmp/shadowsocks'
mkdir -p "$SHADOWSOCKS_DIR"
curl -sL "$SHADOWSOCKS_URL" -o "$SHADOWSOCKS_DIR/shadowsocks.tar.xz"
tar -C "$SHADOWSOCKS_DIR" -xf "$SHADOWSOCKS_DIR/shadowsocks.tar.xz"
install --mode=0755 --owner=root --group=root --preserve-timestamps -D --target-directory=/usr/bin "$SHADOWSOCKS_DIR/sslocal"
rm -rf "$SHADOWSOCKS_DIR"

# Tun2socks
TUN2SOCKS_URL="$(curl -sL 'https://api.github.com/repos/xjasonlyu/tun2socks/releases' | sed -n 's/.*\"browser_download_url\"\s*:\s*\"\(.*\)\"/\1/p' | grep '.linux-amd64.zip' | head -1)"
curl -sL "$TUN2SOCKS_URL" -o "/tmp/tun2socks.zip"
unzip '/tmp/tun2socks.zip' -d '/tmp'
rm -rf '/tmp/tun2socks.zip'
sudo mv '/tmp/tun2socks'* '/usr/bin/tun2socks'
sudo chown root: '/usr/bin/tun2socks'
sudo chmod 755 '/usr/bin/tun2socks'

# Install Dracula to Firefox
DRACULA_PAGE="$(curl -sL 'https://addons.mozilla.org/en-US/firefox/addon/dracula-dark-colorscheme/' | sed -n 's#.*\"https://addons.mozilla.org/firefox/downloads/file/\(.*\)\"#https://addons.mozilla.org/firefox/downloads/file/\1#p')"
DRACULA_PAGE="${DRACULA_PAGE%%\"*}"

curl -sL "$DRACULA_PAGE" -o '/tmp/dracula.xpi'
firefox '/tmp/dracula.xpi'
read -r -p '[@] Enter any key when extension will be installed'
rm '/tmp/dracula.xpi'

# Install ublock-origin to Firefox
UBLOCK_ORIGIN_PAGE="$(curl -sL 'https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/' | sed -n 's#.*\"https://addons.mozilla.org/firefox/downloads/file/\(.*\)\"#https://addons.mozilla.org/firefox/downloads/file/\1#p')"
UBLOCK_ORIGIN_PAGE="${UBLOCK_ORIGIN_PAGE%%\"*}"

curl -sL "$UBLOCK_ORIGIN_PAGE" -o '/tmp/ublock_origin.xpi'
firefox '/tmp/ublock_origin.xpi'
read -r -p '[@] Enter any key when extension will be installed'
rm '/tmp/ublock_origin.xpi'

# Install MetaMask to Firefox
METAMASK_PAGE="$(curl -sL 'https://addons.mozilla.org/en-US/firefox/addon/ether-metamask/' | sed -n 's#.*\"https://addons.mozilla.org/firefox/downloads/file/\(.*\)\"#https://addons.mozilla.org/firefox/downloads/file/\1#p')"
METAMASK_PAGE="${METAMASK_PAGE%%\"*}"

curl -sL "$METAMASK_PAGE" -o '/tmp/meta_mask.xpi'
firefox '/tmp/meta_mask.xpi'
read -r -p '[@] Enter any key when extension will be installed'
rm '/tmp/meta_mask.xpi'

# Install Android SDK Manager
ANDROID_SDK_HOME="$HOME/.local/share/android-sdk"
CMD_TOOLS_HOME="$ANDROID_SDK_HOME/cmdline-tools/latest"
CMD_TOOLS_BIN="$CMD_TOOLS_HOME/bin"
LOCAL_BIN="$HOME/.local/bin"

# Create Android SDK home
mkdir -p "$ANDROID_SDK_HOME"

# Download last Android SDK Command line tools
LAST_CMD_TOOLS_FILENAME="$(curl -sL 'https://developer.android.com/studio' | grep -Eo 'commandlinetools-linux-.*_latest\.zip' | head -1)"
curl -Ls "https://dl.google.com/android/repository/$LAST_CMD_TOOLS_FILENAME" -o '/tmp/commandlinetools-linux.zip'

# Unpack Command line tools
mkdir -p "$CMD_TOOLS_HOME"
unzip -q '/tmp/commandlinetools-linux.zip' -d '/tmp'
mv '/tmp/cmdline-tools/'* "$CMD_TOOLS_HOME"
rm -rf '/tmp/cmdline-tools/' '/tmp/commandlinetools-linux.zip'

# Add symbolic links to ~/.local/bin
find "$CMD_TOOLS_BIN" -print0 | xargs -0 -I '{}' ln -s '{}' "$LOCAL_BIN"
