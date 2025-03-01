#!/bin/bash
set -e

install_firefox_extension() {
    # Installs Firefox extension.
    #
    # Parameters:
    #   extension_name (str): The name of Firefox extension.
    #
    # Returns:
    #   None

    local extension_name

    extension_name="$1"

    EXTENSION_PAGE="$(curl -sL "https://addons.mozilla.org/en-US/firefox/addon/$extension_name/" | sed -n 's#.*\"https://addons.mozilla.org/firefox/downloads/file/\(.*\)\"#https://addons.mozilla.org/firefox/downloads/file/\1#p')"
    EXTENSION_PAGE="${EXTENSION_PAGE%%\"*}"

    curl -sL "$EXTENSION_PAGE" -o '/tmp/firefox-extension.xpi'
    firefox '/tmp/firefox-extension.xpi'
    read -r -p '[@] Enter any key when extension will be installed'
    rm '/tmp/firefox-extension.xpi'
}

github_browser_download_urls() {
    # Gets list of browser download URLs of GitHub repository.
    #
    # Parameters:
    #   owner_repo_pair (str): The owner and the name of GitHub repository.
    #
    # Returns:
    #   str: List of browser download URLs.

    local owner_repo_pair

    owner_repo_pair="$1"

    curl -sL "https://api.github.com/repos/$owner_repo_pair/releases" | sed -n 's/.*\"browser_download_url\"\s*:\s*\"\(.*\)\"/\1/p'
}

# Oh-my-zsh
sh -c "$(curl -fsSL 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh')"

# zsh-syntax-highlighting
git clone 'https://github.com/zsh-users/zsh-syntax-highlighting.git' "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# zsh-autosuggestions
git clone 'https://github.com/zsh-users/zsh-autosuggestions.git' "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# zsh-fzf-history-search
git clone 'https://github.com/joshskidmore/zsh-fzf-history-search.git' "$ZSH_CUSTOM/plugins/zsh-fzf-history-search"

# zsh-pyenv-lazy
git clone 'https://github.com/davidparsson/zsh-pyenv-lazy.git' "$ZSH_CUSTOM/plugins/pyenv-lazy"

# zsh-nvm-lazy-load
git clone 'https://github.com/undg/zsh-nvm-lazy-load.git' "$ZSH_CUSTOM/plugins/zsh-nvm-lazy-load"

# Headline ZSH Theme
curl -sL 'https://raw.githubusercontent.com/moarram/headline/main/headline.zsh-theme' -o "$ZSH_CUSTOM/themes/headline.zsh-theme"

# Papirus folders script
sh -c "$(curl -fsSL 'https://git.io/papirus-folders-install')"

# Dracula Papirus folders
git clone 'https://github.com/dracula/papirus-folders' '/tmp/papirus-folders'
sudo chown -R root:root '/tmp/papirus-folders'
sudo cp -rf '/tmp/papirus-folders/Icons/'* '/usr/share/icons/Papirus'
sudo rm -rf '/tmp/papirus-folders'

# Zed
curl 'https://zed.dev/install.sh' | sh

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

# Install tlrc (tldr client)
TLRC_URL="$(github_browser_download_urls 'tldr-pages/tlrc' | grep 'unknown-linux-gnu.tar.gz' | head -1)"
TLRC_DIR='/tmp/tlrc'
mkdir -p "$TLRC_DIR"
curl -sL "$TLRC_URL" -o "$TLRC_DIR/tlrc.tar.gz"
tar -C "$TLRC_DIR" -xf "$TLRC_DIR/tlrc.tar.gz"
sudo chmod -R 644 "$TLRC_DIR"
sudo chmod 755 "$TLRC_DIR/tldr" "$TLRC_DIR/completions"
sudo chown -R root: "$TLRC_DIR"
sudo gzip "$TLRC_DIR/tldr.1"
sudo cp -f "$TLRC_DIR/tldr" '/usr/bin/tldr'
sudo cp -f "$TLRC_DIR/tldr.1.gz" '/usr/share/man/man1/tldr.1.gz'
sudo cp -f "$TLRC_DIR/completions/tldr.bash" '/usr/share/bash-completion/completions/tldr.bash'
sudo cp -f "$TLRC_DIR/completions/_tldr" '/usr/share/zsh/site-functions'
sudo rm -rf "$TLRC_DIR"

# NVM (Node Version Manager)
NVM_VERSION="$(curl -sL https://api.github.com/repos/nvm-sh/nvm/releases | sed -n 's/.*\"tag_name\"\s*:\s*\"\(.*\)\".*/\1/p' | head -1)"
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | bash

# GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
rm -f "$HOME/.gdbinit"
mv -f "$(find ~ -name '.gef*' | head -1)" "$HOME/.gef.py"

# PINCE (Cheat Engine alternative)
PINCE_URL="$(github_browser_download_urls 'korcankaraokcu/PINCE' | grep '.AppImage' | head -1)"
curl -sL "$PINCE_URL" -o '/tmp/Pince.AppImage'
mkdir -p "$HOME/.local/pince.app" "$HOME/.local/bin"
mv '/tmp/Pince.AppImage' "$HOME/.local/pince.app/Pince.AppImage"
tee "$HOME/.local/bin/pince" > /dev/null << EOF
#!/bin/sh
sudo -E -b "/home/$(whoami)/.local/pince.app/Pince.AppImage" 1>/dev/null 2>&1
EOF
chmod +x "$HOME/.local/pince.app/Pince.AppImage" "$HOME/.local/bin/pince"

# pwndbg
PWNDBG_URL="$(github_browser_download_urls 'pwndbg/pwndbg' | grep '.x86_64.rpm' | head -1)"
curl -sL "$PWNDBG_URL" -o '/tmp/pwndbg.rpm'
sudo dnf install -y '/tmp/pwndbg.rpm'
rm -f '/tmp/pwndbg.rpm'

# Shadowsocks client
SHADOWSOCKS_URL="$(github_browser_download_urls 'shadowsocks/shadowsocks-rust' | grep '.x86_64-unknown-linux-gnu.tar.xz' | head -1)"
SHADOWSOCKS_DIR='/tmp/shadowsocks'
mkdir -p "$SHADOWSOCKS_DIR"
curl -sL "$SHADOWSOCKS_URL" -o "$SHADOWSOCKS_DIR/shadowsocks.tar.xz"
tar -C "$SHADOWSOCKS_DIR" -xf "$SHADOWSOCKS_DIR/shadowsocks.tar.xz"
install --mode=0755 --owner=root --group=root --preserve-timestamps -D --target-directory=/usr/bin "$SHADOWSOCKS_DIR/sslocal"
rm -rf "$SHADOWSOCKS_DIR"

# Tun2socks
TUN2SOCKS_URL="$(github_browser_download_urls 'xjasonlyu/tun2socks' | grep '.linux-amd64.zip' | head -1)"
curl -sL "$TUN2SOCKS_URL" -o "/tmp/tun2socks.zip"
unzip '/tmp/tun2socks.zip' -d '/tmp'
rm -rf '/tmp/tun2socks.zip'
sudo mv '/tmp/tun2socks'* '/usr/bin/tun2socks'
sudo chown root: '/usr/bin/tun2socks'
sudo chmod 755 '/usr/bin/tun2socks'

# Install Dracula to Firefox
install_firefox_extension 'dracula-dark-colorscheme'

# Install ublock-origin to Firefox
install_firefox_extension 'ublock-origin'

# Install MetaMask to Firefox
install_firefox_extension 'ether-metamask'

# Install SmartProxy to Firefox
install_firefox_extension 'smartproxy'

# Install Violentmonkey to Firefox
install_firefox_extension 'violentmonkey'

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
