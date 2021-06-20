COMPLETION_WAITING_DOTS=true
ENABLE_CORRECTION=true
KEYTIMEOUT=1
VI_MODE_SET_CURSOR=true
ZSH_THEME=robbyrussell

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

for plugin in ${homebrew_plugins}; do
    source $(brew --prefix)/share/zsh-${plugin}/zsh-${plugin}.zsh
done

source ~/.oh-my-zsh/oh-my-zsh.sh

c() {
    cd $@ NUL || z $@
}

alias cd=c

tl() {
    tldr $@ || (tldr --update && tldr $@)
}

alias rm='trash -F'

alias ls='exa --icons'
alias tree='ls --tree'