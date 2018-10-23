#! /bin/bash

# DOTS
cp gitconfig  /home/dim/.gitconfig;
cp gitignore  /home/dim/.gitignore;
cp gitmessage /home/dim/.gitmessage;
cp tmux.conf  /home/dim/.tmux.conf;
cp zshrc      /home/dim/.zshrc;
cp mongorc.js /home/dim/.mongorc.js;

# BIN
cp -R bin /home/dim;

# VIM
cp    vimrc         /home/dim/.vim/vimrc;
cp -R ./vim/startup /home/dim/.vim/;
cp -R ./vim/colors  /home/dim/.vim/;
