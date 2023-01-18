# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
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

function _cd_or_z {
    cd $@ NUL || z $@
}

alias cd=_cd_or_z

alias cat='bat -p'

alias rm='trash -F'

alias lg=lazygit

alias ls='exa --icons'
alias tree='ls --tree'

alias dfu='bubu && ~/.dotfiles/install.sh'

export BAT_THEME=ansi
export SCCACHE_CACHE_SIZE="50G"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
