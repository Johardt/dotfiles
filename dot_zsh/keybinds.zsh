# Key bindings for better UX (core zsh functionality)
# FZF bindings (these are still needed for the actual fzf integration)
bindkey '^R' fzf-history-widget      # Ctrl+R for fuzzy history search
bindkey '^T' fzf-file-widget         # Ctrl+T for fuzzy file search
bindkey '^[c' fzf-cd-widget          # Alt+C for fuzzy directory change

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

# Set up menu completion keybinds (vim-style navigation)
# This will be executed when the menuselect keymap becomes available
if [[ -n "${terminfo[kcuu1]}" ]]; then
    # Only set these if we can detect terminal capabilities
    autoload -U compinit && compinit
    zmodload zsh/complist
    
    # Set up the keybinds for menu selection
    bindkey -M menuselect 'h' vi-backward-char 2>/dev/null
    bindkey -M menuselect 'k' vi-up-line-or-history 2>/dev/null
    bindkey -M menuselect 'l' vi-forward-char 2>/dev/null
    bindkey -M menuselect 'j' vi-down-line-or-history 2>/dev/null
fi