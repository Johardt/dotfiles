source ~/.config/fish/abbr.fish
source ~/.config/fish/env.fish
source ~/.config/fish/functions/aliases.fish
source ~/.config/fish/local.fish

fish_vi_key_bindings

# Zoxide, fzf
if command -v zoxide >/dev/null 2>&1
    zoxide init fish | source
end
if command -v fzf >/dev/null 2>&1
    fzf --fish | source
end

# Carapace (completion generator)
if command -v carapace >/dev/null 2>&1
    carapace _carapace | source
end

# Atuin
if command -v atuin >/dev/null 2>&1
    atuin init fish | source
end

# Starship prompt
eval (starship init fish)