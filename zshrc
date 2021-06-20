export BAT_THEME=ansi
export COMPLETION_WAITING_DOTS=true
export ENABLE_CORRECTION=true
export KEYTIMEOUT=1
export VI_MODE_SET_CURSOR=true
export ZSH_THEME=robbyrussell

export plugins=(
    colored-man-pages
    command-not-found
    common-aliases
    git
    vi-mode
    z
)

export homebrew_plugins=(
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

alias cat='bat -p'

alias rm='trash -F'

alias ls='exa --icons'
alias tree='ls --tree'