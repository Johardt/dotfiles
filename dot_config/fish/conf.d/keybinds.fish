# Key bindings for better UX (core fish functionality)
fish_vi_key_bindings
set -g fish_sequence_key_delay_ms 10

function fish_user_key_bindings
    fish_vi_key_bindings

    # Additional useful keybinds
    bind --mode insert \ca beginning-of-line
    bind --mode insert \ce end-of-line
    bind --mode insert \ck kill-line
    bind --mode insert \cu kill-whole-line
    bind --mode insert \cw backward-kill-word
    bind --mode insert \cy yank

    # History navigation
    bind --mode insert \cp up-line
    bind --mode insert \cn down-line

    # Word navigation (Alt+b/f for backward/forward word)
    bind --mode insert \eb backward-word
    bind --mode insert \ef forward-word

    # Clear screen
    bind --mode insert \cl clear-screen

    # Accept autosuggestions with Ctrl+Space
    bind --mode insert ctrl-space accept-autosuggestion
end
