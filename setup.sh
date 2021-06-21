#!/bin/sh

# Install CLI tools
xcode-select --install

# Install Rosetta
softwareupdate --install-rosetta

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Tap into additional brew repositories
brew tap homebrew/cask-fonts

# Install my favourite applications
brew install --cask font-hack-nerd-font
brew install --cask microsoft-edge
brew install --cask google-chrome
brew install --cask firefox
brew install --cask webstorm
brew install --cask pycharm
brew install --cask hyper
brew install --cask docker
brew install --cask nordpass

# Install my favourite tools
brew install zsh
brew install git
brew install nodenv
brew install rbenv
brew install pyenv
brew install oven-sh/bun/bun

brew cleanup

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-"$HOME"/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-"$HOME"/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions

# Copy over config files
mkdir -p "$HOME"/.config/colorls && cp config/colorls.yaml "$HOME"/.config/colorls/dark_colors.yaml
cp config/.zshrc "$HOME"/.zshrc
cp config/.p10k.zsh "$HOME"/.p10k.zsh
cp config/.hyper.js "$HOME"/.hyper.js
cp config/.gitconfig "$HOME"/.gitconfig

# Reinvoke the current shell
. "$HOME"/.zshrc

# Install Hyper extensions
hyper install hyper-dracula
hyper install hyper-tab-icons
hyper install hyper-search
hyper install hyperterm-paste
hyper install hypercwd

# Set global Node version
nodenv install 23.11.0
nodenv global 23.11.0

# Set global Ruby version
rbenv install 3.4.2
rbenv global 3.4.2

# Set global Python version
pyenv install 3.13.2
pyenv global 3.13.2

# Install global GEM packages
gem install colorls

# Install global PIP packages
pip install pygments
pip install pylint
pip install black

# Start up Hyper
hyper
