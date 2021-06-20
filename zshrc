COMPLETION_WAITING_DOTS=true
ENABLE_CORRECTION=true
KEYTIMEOUT=1
VI_MODE_SET_CURSOR=true
ZSH_THEME=robbyrussell

plugins=(
    colored-man-pages
    command-not-found
    git
    vi-mode
)

homebrew_plugins=(
    autosuggestions
    syntax-highlighting
)

for plugin in ${homebrew_plugins}; do
    source $(brew --prefix)/share/zsh-${plugin}/zsh-${plugin}.zsh
done

source ~/.oh-my-zsh/oh-my-zsh.sh

tl() {
    tldr $@ || (tldr --update && tldr $@)
}