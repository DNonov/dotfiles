#! /bin/bash

cp -p .bashrc /home/dim;
cp -p .gitconfig /home/dim;
cp -p .gitmessage /home/dim;
cp -p .tmux.conf /home/dim;
cp -p .zshrc /home/dim;
cp -p .mongorc.js /home/dim;
cp -Rp bin /home/dim;

# VIM
cp -p vimrc /home/dim/.vim/vimrc;
cp -Rp ./vim/startup /home/dim/.vim/;
cp -Rp ./vim/colors /home/dim/.vim/;
