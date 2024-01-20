eval "$(/opt/homebrew/bin/brew shellenv)"

KEYTIMEOUT=1
VI_MODE_SET_CURSOR=true
ZSH_THEME="robbyrussell"

plugins=(colored-man-pages vi-mode)

source ~/.oh-my-zsh/oh-my-zsh.sh

homebrew_plugins=(
    autosuggestions
    syntax-highlighting
)

for plugin in ${homebrew_plugins}
    source $(brew --prefix)/share/zsh-${plugin}/zsh-${plugin}.zsh

alias rm='trash -F'