# Chezmoi and editor aliases
alias cm=chezmoi
alias vi=nvim

# Modern replacements for common commands
alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias lt='eza -T --color=always --group-directories-first --icons'
alias l.='eza -a | grep -E "^\."'

# Better cat with syntax highlighting
alias cat='bat --paging=never'
alias less='bat'

# zoxide aliases (cd replacement)
alias cd='z'
alias cdi='zi'  # Interactive cd with fzf
alias cdb='z -'  # Go back to previous directory

# Improved grep
alias grep='rg'
alias fgrep='rg -F'
alias egrep='rg -E'

# Better find
alias find='fd'

# Git aliases (common ones)
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gst='git status'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# File operations with confirmation
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Show hidden files by default
alias lh='eza -la --color=always --group-directories-first --icons -a'

# Quick directory listing
alias lsd='eza -lD --color=always --group-directories-first --icons'  # List only directories
alias lsf='eza -lF --color=always --group-directories-first --icons | grep -v "^d"'  # List only files

# System monitoring
alias top='top -o cpu'
alias df='df -h'
alias du='du -h'
alias free='vm_stat'

# Network
alias ping='ping -c 5'
alias myip='curl -s ifconfig.me'
alias localip='ipconfig getifaddr en0'

# Development
alias python='python3'
alias pip='pip3'

# Reload shell
alias reload='source ~/.zshrc'
