# Chezmoi and editor aliases
alias cm=chezmoi
alias vi=nvim

# Modern replacements for common commands
alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias lt='eza -T --color=always --group-directories-first --icons'
alias lg='eza -a | rg "^\."'

# Better cat with syntax highlighting (plain mode for compatibility)
alias cat='bat --paging=never --style=plain'
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
