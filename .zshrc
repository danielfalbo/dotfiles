eval "$(/opt/homebrew/bin/brew shellenv)"

export CLICOLOR=1

function parse_git_branch() { git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ [\1]/p' }
setopt PROMPT_SUBST
PROMPT='%F{141}%~%(?.%F{reset}.%F{red}) $ %F{reset}'
RPROMPT='%F{green}$(parse_git_branch)%F{reset}'

homebrew_plugins=(autosuggestions syntax-highlighting)

for plugin in ${homebrew_plugins}
    source ${HOMEBREW_PREFIX}/share/zsh-${plugin}/zsh-${plugin}.zsh

alias rm='trash'
alias c='cursor'
alias j='vi $(date -u +%Y-%m-%d).md'

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

autoload -Uz compinit && compinit

