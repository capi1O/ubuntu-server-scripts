#!/bin/bash

# install FR locale fr_FR.UTF-8

sudo locale-gen fr_FR.UTF-8
sudo dpkg-reconfigure locales

# zsh

sudo apt install -y zsh git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
sudo shutdown -r 0
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' .zshrc
sudo apt install -y fonts-powerline

# direnv

sudo apt install -y direnv

# sshrc

mkdir ~/.sshrc.d

# zfs

sudo apt install -y zfsutils-linux zfs-initramfs

# ssh-key

## ssh key

# from client copy your ssh-key with ssh-copy-id
