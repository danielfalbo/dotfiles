PROMPT_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "${PROMPT_CACHE}" ]] && source "${PROMPT_CACHE}"

COMPLETION_WAITING_DOTS=true
ENABLE_CORRECTION=true
KEYTIMEOUT=1
VI_MODE_SET_CURSOR=true

plugins=(
    colored-man-pages
    command-not-found
    common-aliases
    git
    vi-mode
    z
)

homebrew_plugins=(
    autosuggestions
    syntax-highlighting
)

source ~/.oh-my-zsh/oh-my-zsh.sh
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh

for plugin in ${homebrew_plugins}
    source $(brew --prefix)/share/zsh-${plugin}/zsh-${plugin}.zsh

function _cd_or_z {
    cd $@ NUL || z $@
}

alias cd=_cd_or_z

alias cat='bat -p'

alias rm='trash -F'

alias ls='exa --icons'
alias tree='ls --tree'

export BAT_THEME=ansi
