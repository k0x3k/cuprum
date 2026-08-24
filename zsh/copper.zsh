# GENERATED from universe.nix by mech portable build --work-safe.
# Source this file from ~/.zshrc. It contains no gl1tch identity, network,
# secrets, history sync or agent configuration.

if command -v brew >/dev/null 2>&1; then
  fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi
autoload -Uz compinit && compinit

command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi
if command -v brew >/dev/null 2>&1; then
  source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  ZSH_HIGHLIGHT_STYLES[arg0]='fg=green,bold'
  ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
  ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow,bold'
  ZSH_HIGHLIGHT_STYLES[global-alias]='fg=cyan,bold'
  source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

alias ls='eza --icons --group-directories-first'
alias ll='eza -l --icons --group-directories-first --git'
alias la='eza -la --icons --group-directories-first --git'
alias tree='eza --tree --icons'
alias cat='bat -pp'
alias grep='rg'
alias find='fd'
alias top='btop'
alias lg='lazygit'

y() {
  local tmp cwd
  tmp="$(mktemp -t yazi-cwd.XXXXXX)"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
