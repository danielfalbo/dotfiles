#! /usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"

LINK_GITCONFIG=false
INSTALL_BREW_AND_PACKAGES=false
RESTART_SERVICES=false
for arg in "$@"; do
    case $arg in
        --with-gitconfig)
            LINK_GITCONFIG=true
            ;;
        --with-brew)
            INSTALL_BREW_AND_PACKAGES=true
            ;;
        --restart-services)
            RESTART_SERVICES=true
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

/bin/rm -f ~/Library/Application\ Support/com.mitchellh.ghostty/config
ln -sf "${BASEDIR}/ghostty.config" ~/Library/Application\ Support/com.mitchellh.ghostty/config

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
mkdir -p ~/Library/Application\ Support/Code/User
/bin/rm -f ~/Library/Application\ Support/Code/User/settings.json
/bin/rm -f ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf "${BASEDIR}/settings.json" ~/Library/Application\ Support/Code/User/settings.json
ln -sf "${BASEDIR}/keybindings.json" ~/Library/Application\ Support/Code/User/keybindings.json

mkdir -p ~/.qutebrowser
/bin/rm -f ~/.qutebrowser/config.py
ln -sf "${BASEDIR}/qutebrowser.py" ~/.qutebrowser/config.py
/bin/rm -f ~/.qutebrowser/quickmarks
ln -sf "${BASEDIR}/quickmarks" ~/.qutebrowser/quickmarks

/bin/rm -f ~/.yabairc
ln -sf "${BASEDIR}/.yabairc" ~/.yabairc

/bin/rm -f ~/.skhdrc
ln -sf "${BASEDIR}/.skhdrc" ~/.skhdrc

mkdir -p ~/.config/spacebar
/bin/rm -f ~/.config/spacebar/spacebarrc
ln -sf "${BASEDIR}/spacebarrc" ~/.config/spacebar/spacebarrc

if [[ $RESTART_SERVICES == true ]]; then
    brew services restart spacebar
    yabai --restart-service
    skhd --restart-service
fi
