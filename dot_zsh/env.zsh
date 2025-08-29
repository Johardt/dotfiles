# Editor and pager
export EDITOR=nvim
export PAGER="bat"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export XDG_CONFIG_HOME="$HOME/.config"

# Homebrew prefix detection
if [[ "$(uname -m)" == "arm64" ]]; then
  export BREW_PREFIX="/opt/homebrew"
else
  export BREW_PREFIX="/usr/local"
fi

# Homebrew configuration
export HOMEBREW_NO_ENV_HINTS=1

# UI & color
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LS_COLORS='di=1;34:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'