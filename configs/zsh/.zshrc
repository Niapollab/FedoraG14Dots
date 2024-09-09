# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Options
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"
DISABLE_MAGIC_FUNCTIONS="false"
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
DISABLE_UNTRACKED_FILES_DIRTY="false"
HIST_STAMPS="dd.mm.yyyy"

# Updates
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-fzf-history-search)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='micro'
else
  export EDITOR='code'
fi

# Set pywal theme for Gnome Terminal
[ ! -z ${GNOME_TERMINAL_SERVICE} ] && (cat ~/.cache/wal/sequences &)

# Load pyenv if installed
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Set $GOPATH if Go installed
if command -v go 1>/dev/null 2>&1; then
  export GOPATH="$HOME/.go"
fi

# fzf key bindings
source /usr/share/fzf/shell/key-bindings.zsh

# Aliases
source ~/.zsh_aliases

# Functions
source ~/.zsh_functions
