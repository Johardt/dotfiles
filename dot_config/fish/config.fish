source ~/.config/fish/abbr.fish
source ~/.config/fish/env.fish
source ~/.config/fish/functions/aliases.fish

fish_vi_key_bindings

# Homebrew configuration for fish
eval ($BREW_PREFIX/bin/brew shellenv)

# Zoxide, fzf
zoxide init fish | source
fzf --fish | source

# Starship prompt
eval (starship init fish)