if command -v fish >/dev/null 2>&1; then
  echo "🔔 Reminder: fish is not your login shell yet. Run 'chsh -s $(which fish)' when you have sudo rights."
  exec fish
fi
