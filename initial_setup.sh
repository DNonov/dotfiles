#! /bin/bash

# GIT
cp gitconfig  ~/.gitconfig;
cp gitignore  ~/.gitignore;
cp gitmessage ~/.gitmessage;

# TMUX
cp tmux.conf ~/.tmux.conf;

# MONGO
cp mongorc.js ~/.mongorc.js;

# BIN
cp -r bin ~/;

# VIM
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp    vimrc         ~/.vim/vimrc;
cp -r ./vim/startup ~/.vim/;
cp -r ./vim/colors  ~/.vim/;

# ZSH
cp    zshrc ~/.zshrc;
cp -r ./zsh ~/.zsh

# TERN
cp ./tern-config ~/.tern-config
