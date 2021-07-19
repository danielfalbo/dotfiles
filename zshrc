if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
source $(brew --prefix)/opt/powerlevel10k/config/p10k-lean-8colors.zsh

for plugin in ${homebrew_plugins}; do
    source $(brew --prefix)/share/zsh-${plugin}/zsh-${plugin}.zsh
done

function _cd_or_z {
    cd $@ NUL || z $@
}

alias cd=_cd_or_z

alias cat='bat -p'

alias rm='trash -F'

alias ls='exa --icons'
alias tree='ls --tree'

export BAT_THEME=ansi
