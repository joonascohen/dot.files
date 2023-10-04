#!/bin/bash
sudo apt install git
git clone github.com/joonascohen/dot.files
sudo apt upgrade && sudo apt update
sudo apt install openssh-server
xargs -a ubuntupkglist.txt sudo apt install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cd
rm -rf .zshrc
cd dot.files
stow zsh nvim
source ~/.zshrc