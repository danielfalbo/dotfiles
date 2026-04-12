# Append to PATH and export environment variables needed for Homebrew packages.
BREW_BIN="$(command -v brew 2>/dev/null)"
if [[ -z "$BREW_BIN" ]]; then
  for candidate in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    if [[ -x "$candidate" ]]; then
      BREW_BIN="$candidate"
      break
    fi
  done
fi
if [[ -n "$BREW_BIN" ]]; then
  eval "$("$BREW_BIN" shellenv)"
fi

# Enable colorized output.
export CLICOLOR=1

# Cool simple prompt.
export PS1='%F{71}%c%(?.%F{reset}.%F{131}) » %F{reset}'

# Use brew plugins 'zsh-autosuggestions' and 'zsh-syntax-highlighting'.
for plugin_path in \
  "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"; do
  [[ -f "$plugin_path" ]] && source "$plugin_path"
done

# Git aliases.
alias gcp='git pull && git add . && git commit -m "$(gsp)" && git push'
alias gd='git diff'
alias gl='git log --oneline'
alias gp='git push'
alias gsp='echo $(git status -s --porcelain)'
alias lg='lazygit'

# Use up and down arrows to navigate history.
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Enable advanced autocompletion.
autoload -Uz compinit && compinit

# Case-insensitive matching.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Fzf integration: start fzf on **<tab>.
if [[ -n "$BREW_BIN" ]]; then
  FZF_COMPLETION="$("$BREW_BIN" --prefix fzf 2>/dev/null)/shell/completion.zsh"
  [[ -f "$FZF_COMPLETION" ]] && source "$FZF_COMPLETION"
fi

# More aliases.
alias ..='cd ..'
alias l='ls -a1'
alias ll='ls -alh'
alias t='tree -a -I .git'
alias today="date -u +%Y-%m-%d"

export PATH="$HOME/.npm-global/bin:$PATH"
