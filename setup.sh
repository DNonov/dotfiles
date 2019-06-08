#! /bin/bash

# Add colors util
. ./utils/colors.sh

echo -e "${Green}Copying of files has been started!"

# GIT
rm ~/.gitconfig;
rm ~/.gitignore;
rm ~/.gitmessage;
cp --preserve=all gitconfig  ~/.gitconfig;
echo -e "${Black}--> Copy" "${Blue}.gitconfig" "${Black}successfully!"
cp --preserve=all gitignore  ~/.gitignore;
echo -e "${Black}--> Copy" "${Blue}.gitignore" "${Black}successfully!"
cp --preserve=all gitmessage ~/.gitmessage;
echo -e "${Black}--> Copy" "${Blue}.gitmessage" "${Black}successfully!"

# TMUX
rm ~/.tmux.conf;
cp --preserve=all tmux.conf ~/.tmux.conf;
echo -e "${Black}--> Copy" "${Blue}.tmux.conf" "${Black}successfully!"

# MONGO
rm ~/.mongorc.js;
cp --preserve=all mongorc.js ~/.mongorc.js;
echo -e "${Black}--> Copy" "${Blue}.mongorc.js" "${Black}successfully!"

# TERN
rm ~/.tern-config;
cp --preserve=all ./tern-config ~/.tern-config;
echo -e "${Black}--> Copy" "${Blue}.tern-config" "${Black}successfully!"

# ESLint
rm ~/.eslintrc.json
cp --preserve=all ./eslintrc.json ~/.eslintrc.json;
echo -e "${Black}--> Copy" "${Blue}.eslintrc.json" "${Black}successfully!"

# ZSH
rm ~/.zshrc;
cp --preserve=all zshrc ~/.zshrc;
echo -e "${Black}--> Copy" "${Blue}.zshrc" "${Black}successfully!"

# VIM
rm ~/.vim/vimrc
cp --preserve=all vimrc ~/.vim/vimrc;
echo -e "${Black}--> Copy" "${Blue}vimrc" "${Black}successfully!"

echo -e "${Green}Copying of files has been finished!"

#===============================================================================

echo -e "${Green}Copying of folders has been started!"

# BIN
rm -rf ~/bin;
cp --preserve=all -r bin ~/bin;
echo -e "${Black}--> Copy" "${Blue}bin" "${Black}successfully!"


# VIM
rm -rf ~/.vim/startup
rm -rf ~/.vim/after
rm -rf ~/.vim/colors
cp --preserve=all -r ./vim/startup ~/.vim/startup;
echo -e "${Black}--> Copy" "${Blue}.vim/startup" "${Black}successfully!"
cp --preserve=all -r ./vim/after   ~/.vim/after;
echo -e "${Black}--> Copy" "${Blue}.vim/after" "${Black}successfully!"
cp --preserve=all -r ./vim/colors  ~/.vim/colors;
echo -e "${Black}--> Copy" "${Blue}.vim/colors" "${Black}successfully!"

# ZSH
rm -rf ~/.zsh;
cp --preserve=all -r ./zsh ~/.zsh;
echo -e "${Black}--> Copy" "${Blue}.zsh" "${Black}successfully!"
echo -e "${Green}Copying of folders has been finished!"

#===============================================================================

# VS Code

# Import the linker
. ./code/settings.sh

# Call the linker first
link_code_settings

# Move settings.json file
rm ~/.config/Code/User/settings.json
cp  --preserve=all ./code/settings.json ~/.config/Code/User/settings.json
cp --preserve=all ./code/keybindings.json ~/.config/Code/User/keybindings.json
echo -e "${Green}Copying of vs code files has been finished!${Reset}"