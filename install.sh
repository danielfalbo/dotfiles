#! /usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"

LINK_GITCONFIG=true
INSTALL_BREW_AND_PACKAGES=true

for arg in "$@"; do
    case $arg in
        --no-gitconfig)
            LINK_GITCONFIG=false
            ;;
        --no-brew)
            INSTALL_BREW_AND_PACKAGES=false
            ;;
    esac
done

if [[ $INSTALL_BREW_AND_PACKAGES == true ]]; then
    which brew || bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    /opt/homebrew/bin/brew bundle
fi

defaults write com.vscodium ApplePressAndHoldEnabled -bool false

defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15

mkdir -p ~/Developer

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

mkdir -p ~/Library/Application\ Support/VSCodium/User
/bin/rm -f ~/Library/Application\ Support/VSCodium/User/settings.json
/bin/rm -f ~/Library/Application\ Support/VSCodium/User/keybindings.json
ln -sf "${BASEDIR}/settings.json" ~/Library/Application\ Support/VSCodium/User/settings.json
ln -sf "${BASEDIR}/keybindings.json" ~/Library/Application\ Support/VSCodium/User/keybindings.json