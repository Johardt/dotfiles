function reload --description "Reload fish config (or restart with -f)"
    if test (count $argv) -gt 0; and test "$argv[1]" = "-f"
        echo "Forcing full restart of fish..."
        exec fish
    else
        echo "Sourcing ~/.config/fish/config.fish..."
        source ~/.config/fish/config.fish
        echo "Reload complete."
    end
end
