source ~/.config/fish/abbr.fish
source ~/.config/fish/env.fish
source ~/.config/fish/functions/aliases.fish
source ~/.config/fish/local.fish

fish_vi_key_bindings

# Homebrew configuration for fish
eval ($BREW_PREFIX/bin/brew shellenv)

# Zoxide, fzf
zoxide init fish | source
fzf --fish | source

# Added by LM Studio CLI (lms)
set -gx PATH $PATH $HOME/.lmstudio/bin

# Starship prompt
eval (starship init fish)