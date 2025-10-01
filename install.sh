#! /usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"

which brew || bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/opt/homebrew/bin/brew bundle

defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
defaults write -g com.apple.trackpad.scaling -float 4.0

mkdir -p ~/Developer
touch ~/.hushlogin

mkdir -p ~/.config/karabiner
/bin/rm -f ~/.config/karabiner/karabiner.json
ln -sf "${BASEDIR}/karabiner.json" ~/.config/karabiner/karabiner.json

mkdir -p ~/.config/fish
/bin/rm -f ~/.config/fish/config.fish
ln -sf "${BASEDIR}/config.fish" ~/.config/fish/config.fish

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
mkdir -p ~/Library/Application\ Support/Code/User
/bin/rm -f ~/Library/Application\ Support/Code/User/settings.json
/bin/rm -f ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf "${BASEDIR}/settings.json" ~/Library/Application\ Support/Code/User/settings.json
ln -sf "${BASEDIR}/keybindings.json" ~/Library/Application\ Support/Code/User/keybindings.json
