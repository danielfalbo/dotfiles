# Append to PATH and exports environment variables needed for brew to work.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable colorized output.
export CLICOLOR=1

# Cool simple prompt.
export PS1='%F{71}%c%(?.%F{reset}.%F{131}) » %F{reset}'

# Use brew plugins 'zsh-autosuggestions' and 'zsh-syntax-highlighting'.
source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Make 'rm' just move to trash.
alias rm='trash'

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
source /opt/homebrew/opt/fzf/shell/completion.zsh

# More aliases.
alias ..='cd ..'
alias l='ls -a1'
alias ll='ls -alh'
alias t='tree -Ca -I .git'
alias today="date -u +%Y-%m-%d"
