#!/usr/bin/env bash
# Usage: dark-notify -c ~/.local/bin/theme-links.sh
# Requires: jq

set -euo pipefail

CONFIG="${HOME}/.config/theme-links.json"
MODE="${1:-}"
[[ -z "$MODE" ]] && { echo "Usage: $0 [light|dark]" >&2; exit 1; }
[[ ! -f "$CONFIG" ]] && { echo "Missing config: $CONFIG" >&2; exit 1; }

jq -c '.mappings[]' "$CONFIG" | while IFS= read -r map; do
  link=$(jq -r '.link' <<<"$map")
  dest=$(jq -r --arg mode "$MODE" '.[$mode]' <<<"$map")

  link="${link/#\~/$HOME}"
  dest="${dest/#\~/$HOME}"

  if [[ -e "$dest" ]]; then
    tmp="${link%/*}/.${link##*/}.tmp.$$"
    ln -sf "$dest" "$tmp"
    mv -f "$tmp" "$link"
    echo "theme-links: $MODE → $link -> $dest"
  else
    echo "theme-links: missing target $dest" >&2
  fi
done
