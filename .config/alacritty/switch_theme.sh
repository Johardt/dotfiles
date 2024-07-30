#!/usr/bin/env bash

# Define the paths
CONFIG_DIR="$HOME/.config/alacritty"
CURRENT_THEME="$CONFIG_DIR/current_theme.toml"
ALACRITTY_CONFIG="$CONFIG_DIR/alacritty.toml"
THEMES_DIR="$CONFIG_DIR/themes"

# Define themes
DARK_THEME_ID="rose-pine-main"
LIGHT_THEME_ID="rose-pine-dawn"

# If an argument is provided, try to switch to that theme instead
if [ "$#" -eq 1 ]; then
    NEXT_THEME="$1"
# Else, just switch the theme based on the defined themes
else
    if grep -q "$DARK_THEME_ID" "$CURRENT_THEME"; then
        NEXT_THEME="$LIGHT_THEME_ID"
    elif grep -q "$LIGHT_THEME_ID" "$CURRENT_THEME"; then
        NEXT_THEME="$DARK_THEME_ID"
    else
        NEXT_THEME="$DARK_THEME_ID"
    fi
fi

# Switch to the next theme
cat "$THEMES_DIR/$NEXT_THEME.toml" > "$CURRENT_THEME"
touch "$ALACRITTY_CONFIG"

echo "Switched to $NEXT_THEME theme."

