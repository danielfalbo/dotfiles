#! /usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"

LINK_GITCONFIG=false
INSTALL_BREW_AND_PACKAGES=false
for arg in "$@"; do
    case $arg in
        --with-gitconfig)
            LINK_GITCONFIG=true
            ;;
        --with-brew)
            INSTALL_BREW_AND_PACKAGES=true
            ;;
    esac
done

if [[ $INSTALL_BREW_AND_PACKAGES == true ]]; then
    which brew || bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    /opt/homebrew/bin/brew bundle
fi

defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

mkdir -p ~/Developer
touch ~/.hushlogin

if [[ $LINK_GITCONFIG == true ]]; then
    /bin/rm -f ~/.gitconfig
    ln -sf "${BASEDIR}/.gitconfig" ~/.gitconfig
fi

mkdir -p ~/.config/karabiner
/bin/rm -f ~/.config/karabiner/karabiner.json
ln -sf "${BASEDIR}/karabiner.json" ~/.config/karabiner/karabiner.json

/bin/rm -f ~/.vimrc
ln -sf "${BASEDIR}/.vimrc" ~/.vimrc

/bin/rm -f ~/.zshrc
ln -sf "${BASEDIR}/.zshrc" ~/.zshrc

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
mkdir -p ~/Library/Application\ Support/Code/User
/bin/rm -f ~/Library/Application\ Support/Code/User/settings.json
/bin/rm -f ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf "${BASEDIR}/settings.json" ~/Library/Application\ Support/Code/User/settings.json
ln -sf "${BASEDIR}/keybindings.json" ~/Library/Application\ Support/Code/User/keybindings.json

mkdir -p ~/.vim/pack/plugins/start/
git clone https://github.com/junegunn/goyo.vim.git ~/.vim/pack/plugins/start/goyo || (cd ~/.vim/pack/plugins/start/goyo && git pull)
