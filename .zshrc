# # Fig pre block. Keep at the top of this file.
# export PATH="${PATH}:${HOME}/.local/bin"
# eval "$(fig init zsh pre)"

eval "$(/opt/homebrew/bin/brew shellenv)"

# source ~/.fig/shell/pre.sh

COMPLETION_WAITING_DOTS=true
ENABLE_CORRECTION=true
KEYTIMEOUT=1
VI_MODE_SET_CURSOR=true
ZSH_THEME="robbyrussell"

plugins=(
    brew
    colored-man-pages
    command-not-found
    common-aliases
    git
    vi-mode
    z
)

source ~/.oh-my-zsh/oh-my-zsh.sh

homebrew_plugins=(
    autosuggestions
    syntax-highlighting
)

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

alias dfu='bubu && ~/.dotfiles/install.sh'

export BAT_THEME=ansi

# source ~/.fig/fig.sh

# # Fig post block. Keep at the bottom of this file.
# eval "$(fig init zsh post)"

