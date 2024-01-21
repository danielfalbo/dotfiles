eval "$(/opt/homebrew/bin/brew shellenv)"

export CLICOLOR=1
PROMPT='%F{240}%n:%F{141}%~%(?.%F{white}.%F{red}) $ %F{reset}'

homebrew_plugins=(autosuggestions syntax-highlighting)

for plugin in ${homebrew_plugins}
    source ${HOMEBREW_PREFIX}/share/zsh-${plugin}/zsh-${plugin}.zsh

alias rm='trash -F'