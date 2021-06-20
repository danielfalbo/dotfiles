export ZSH="/Users/danielfalbo/.oh-my-zsh"

ZSH_THEME="robbyrussell"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source "$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"