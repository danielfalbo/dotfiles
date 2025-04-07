#! /usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"

which brew || bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/opt/homebrew/bin/brew bundle

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

mkdir -p ~/Developer

mkdir -p ~/.config
mkdir -p ~/.config/karabiner
mkdir -p ~/Library/Application\ Support/Cursor/User

/bin/rm -f ~/.config/karabiner/karabiner.json
/bin/rm -f ~/.gitconfig
/bin/rm -f ~/.vimrc
/bin/rm -f ~/.zshrc
/bin/rm -f ~/Library/Application\ Support/Cursor/User/settings.json

# create symlinks
ln -sf "${BASEDIR}/karabiner.json" ~/.config/karabiner/karabiner.json
ln -sf "${BASEDIR}/.gitconfig" ~/.gitconfig
ln -sf "${BASEDIR}/.vimrc" ~/.vimrc
ln -sf "${BASEDIR}/.zshrc" ~/.zshrc
ln -sf "${BASEDIR}/settings.json" ~/Library/Application\ Support/Cursor/User/settings.json
