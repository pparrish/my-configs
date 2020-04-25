#!/data/data/com.termux/files/usr/bin/bash

#Ask for storage permisions
termux-setup-storage
sleep 5s

#Update termux packages
apt update && apt upgrade -y

#Install
pkg install neovim nodejs yarn python python2 termux-api zsh git -y

#setup git
echo "Your name"
read NAME
echo "Your email"
read EMAIL

git config --global user.name $NAME
git config --global user.email $EMAIL
git config --global core.editor nvim

#setup oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

