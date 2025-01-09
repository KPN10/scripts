#!/bin/bash

sudo apt update
sudo apt install zsh -y
sudo apt install fonts-powerline -y
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
cp .zshrc ~/.zshrc
cp agnoster_custom.zsh-theme ~/.oh-my-zsh/themes/

