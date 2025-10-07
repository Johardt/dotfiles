source ~/.config/fish/abbr.fish
source ~/.config/fish/env.fish
source ~/.config/fish/functions/aliases.fish
source ~/.config/fish/local.fish

fish_vi_key_bindings

# Atuin (shell history)
if command -v atuin >/dev/null 2>&1
    atuin init fish | source
end

# Zoxide, fzf
zoxide init fish | source
fzf --fish | source

# Carapace (completion generator)
if command -v carapace >/dev/null 2>&1
    carapace _carapace | source
end

# Starship prompt
eval (starship init fish)