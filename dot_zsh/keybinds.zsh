# Key bindings for better UX (core zsh functionality)

# Accept autosuggestion with Ctrl+Space
bindkey '^ ' autosuggest-accept

# Additional useful keybinds
bindkey '^A' beginning-of-line        # Ctrl+A for beginning of line
bindkey '^E' end-of-line             # Ctrl+E for end of line
bindkey '^K' kill-line               # Ctrl+K to delete from cursor to end
bindkey '^U' kill-whole-line         # Ctrl+U to delete entire line
bindkey '^W' backward-kill-word      # Ctrl+W to delete word backwards
bindkey '^Y' yank                    # Ctrl+Y to paste

# History navigation
bindkey '^P' up-line-or-history      # Ctrl+P for previous command
bindkey '^N' down-line-or-history    # Ctrl+N for next command

# Word navigation (Alt+b/f for backward/forward word)
bindkey '^[b' backward-word          # Alt+B for backward word
bindkey '^[f' forward-word           # Alt+F for forward word

# Clear screen
bindkey '^L' clear-screen            # Ctrl+L to clear screen
