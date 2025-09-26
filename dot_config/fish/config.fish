source ~/.config/fish/abbr.fish
source ~/.config/fish/env.fish
source ~/.config/fish/functions/aliases.fish
source ~/.config/fish/local.fish

fish_vi_key_bindings

# Zoxide, fzf
zoxide init fish | source
fzf --fish | source

# Starship prompt
eval (starship init fish)