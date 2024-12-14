eval "$(/opt/homebrew/bin/brew shellenv)"

export CLICOLOR=1
PROMPT='%F{240}%n%F{reset}:%F{141}%~%(?.%F{reset}.%F{red}) $ %F{reset}'

homebrew_plugins=(autosuggestions syntax-highlighting)

for plugin in ${homebrew_plugins}
    source ${HOMEBREW_PREFIX}/share/zsh-${plugin}/zsh-${plugin}.zsh

alias rm='trash'

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
