#! /usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"

which brew || bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/opt/homebrew/bin/brew bundle

defaults write com.vscodium ApplePressAndHoldEnabled -bool false

defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15

mkdir -p ~/Developer

if [[ "$1" != "--no-gitconfig" ]]; then
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