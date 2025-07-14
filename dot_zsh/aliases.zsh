# Chezmoi and editor aliases
alias cm=chezmoi
alias vi=nvim

# Git aliases
alias gs="git status --short"
alias gd="git diff | delta"
alias ga="git add"
alias gap="git add --patch"
alias gc="git commit"
alias gp="git push"
alias gu="git pull"
alias gb="git branch"
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %an %ar%C(auto) %D%n%s%n'"

# Modern replacements for common commands
alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias lt='eza -T --color=always --group-directories-first --icons'
alias lg='eza -a | rg "^\."'

# Better cat with syntax highlighting (plain mode for compatibility)
alias cat='bat --paging=never'
alias less='bat'

# zoxide aliases (cd replacement)
alias cd='z'
alias cdi='zi'   # Interactive cd with fzf
alias cdb='z -'  # Go back to previous directory

# Better find
alias find='fd'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# Show hidden files by default
alias lh='eza -la --color=always --group-directories-first --icons -a'

# Reload shell
alias reload='source ~/.zshrc'
