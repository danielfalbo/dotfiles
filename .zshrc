eval "$(/opt/homebrew/bin/brew shellenv)"

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
    tmux
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

function cd_or_z {
    cd $@ NUL || z $@
}

alias cd=cd_or_z

alias cat='bat -p'

alias rm='trash -F'

alias lg=lazygit

alias ls='exa --icons'
alias tree='ls --tree'

alias dfu='bubu && brew cleanup -s && ~/.dotfiles/install.sh'

export BAT_THEME=ansi
export SCCACHE_CACHE_SIZE="50G"

# TODO: aliases and functions to avoid copypasting
function _autovenv() {
    if [[ -n $(find $(g rev-parse --show-toplevel NE) -maxdepth 2 -name 'pyvenv.cfg' -print -quit NE) ]]; then
        source "$(find $(g rev-parse --show-toplevel) -maxdepth 2 -name 'pyvenv.cfg' -print -quit | xargs dirname)/bin/activate"
    else
        deactivate NE
    fi
}
_autovenv
chpwd() { _autovenv }
