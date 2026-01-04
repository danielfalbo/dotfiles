#! /usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"

which brew || bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/opt/homebrew/bin/brew bundle

defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
defaults write -g com.apple.trackpad.scaling -float 4.0

# install vim plugins using built-in packages manager
vim_plugins_dir="$HOME/.vim/pack/plugins/start"
mkdir -p "$vim_plugins_dir"
if [ ! -d "$vim_plugins_dir/goyo" ]; then
    git clone https://github.com/junegunn/goyo.vim.git "$vim_plugins_dir/goyo"
else
    git -C "$vim_plugins_dir/goyo" pull
fi

touch ~/.hushlogin # suppress "last login" string in macos terminal.app
mkdir -p ~/.vim/undodir # prepare vim persistent undo dir

mkdir -p ~/.config/karabiner
/bin/rm -f ~/.config/karabiner/karabiner.json
ln -sf "${BASEDIR}/karabiner.json" ~/.config/karabiner/karabiner.json

/bin/rm -f ~/.vimrc
ln -sf "${BASEDIR}/.vimrc" ~/.vimrc

/bin/rm -f ~/.zshrc
ln -sf "${BASEDIR}/.zshrc" ~/.zshrc

/bin/rm -f ~/.tmux.conf
ln -sf "${BASEDIR}/.tmux.conf" ~/.tmux.conf

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
mkdir -p ~/Library/Application\ Support/Code/User
/bin/rm -f ~/Library/Application\ Support/Code/User/settings.json
/bin/rm -f ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf "${BASEDIR}/settings.json" ~/Library/Application\ Support/Code/User/settings.json
ln -sf "${BASEDIR}/keybindings.json" ~/Library/Application\ Support/Code/User/keybindings.json
