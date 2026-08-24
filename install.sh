#!/bin/sh
# copper — install the gl1tch Copper theme assets on this machine.
#
# Safe to rerun. Never overwrites a config you already have: existing
# ghostty/starship configs are kept and the script tells you the one line
# to add instead. Pass --tools to also install the Brewfile (macOS, brew).
set -eu

repo="$(cd "$(dirname "$0")" && pwd)"
say() { printf '%s\n' "$*"; }

# ---- ghostty: themes always, main config only onto a clean slate ----------
mkdir -p "$HOME/.config/ghostty/themes"
cp "$repo/ghostty/themes/copper-dark" "$repo/ghostty/themes/copper-light" \
  "$HOME/.config/ghostty/themes/"
if [ ! -e "$HOME/.config/ghostty/config" ]; then
  cp "$repo/ghostty/config" "$HOME/.config/ghostty/config"
  say "ghostty  installed config + themes"
else
  say "ghostty  themes installed; kept your config — add: theme = copper-dark"
fi

# ---- starship --------------------------------------------------------------
if [ ! -e "$HOME/.config/starship.toml" ]; then
  mkdir -p "$HOME/.config"
  cp "$repo/starship.toml" "$HOME/.config/starship.toml"
  say "starship installed"
else
  say "starship kept your config (bundle copy: starship.toml)"
fi

# ---- zsh colours -----------------------------------------------------------
mkdir -p "$HOME/.config/gl1tch"
cp "$repo/zsh/copper.zsh" "$HOME/.config/gl1tch/copper.zsh"
if [ -f "$HOME/.zshrc" ] && ! grep -q 'gl1tch/copper.zsh' "$HOME/.zshrc"; then
  printf '\nsource "$HOME/.config/gl1tch/copper.zsh"\n' >>"$HOME/.zshrc"
  say "zsh      copper.zsh installed and sourced from ~/.zshrc"
else
  say "zsh      copper.zsh installed (already sourced, or no ~/.zshrc)"
fi

# ---- vs code: marketplace first, bundled vsix as fallback ------------------
if command -v code >/dev/null 2>&1; then
  code --install-extension gl1tch.cuprum --force >/dev/null 2>&1 ||
    code --install-extension "$repo"/vscode/cuprum-*.vsix --force >/dev/null
  say "vscode   Copper installed — pick it under Preferences: Color Theme"
else
  say "vscode   'code' CLI not found — install vscode/cuprum-*.vsix by hand"
fi

# ---- optional CLI tools ----------------------------------------------------
if [ "${1:-}" = "--tools" ]; then
  if command -v brew >/dev/null 2>&1; then
    brew bundle --file "$repo/Brewfile"
  else
    say "tools    skipped: brew not installed"
  fi
fi

say ""
say "done. Fonts are not distributed: Berkeley Mono is licensed — install it"
say "yourself; Sora and Symbols Nerd Font come from your package manager."
