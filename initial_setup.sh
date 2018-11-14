#! /bin/bash

# DOTS
cp gitconfig  /home/dim/.gitconfig;
cp gitignore  /home/dim/.gitignore;
cp gitmessage /home/dim/.gitmessage;

# TMUX
cp tmux.conf  /home/dim/.tmux.conf;

# MONGO
cp mongorc.js /home/dim/.mongorc.js;

# BIN
cp -R bin /home/dim;

# VIM
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp    vimrc         /home/dim/.vim/vimrc;
cp -R ./vim/startup /home/dim/.vim/;
cp -R ./vim/colors  /home/dim/.vim/;

#ZSH
cp ./zsh/aliases   /home/dim/.zsh;
cp ./zsh/config    /home/dim/.zsh;
cp ./zsh/functions /home/dim/.zsh;
cp zshrc           /home/dim/.zshrc;
