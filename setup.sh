#! /bin/bash

# Add colors util
. ./utils/colors.sh

echo -e "${Orange}Copying of files has been started!"

# GIT
rm ~/.gitconfig;
rm ~/.gitignore;
rm ~/.gitmessage;
cp --preserve=all gitconfig  ~/.gitconfig;
echo -e "${Green}--> Copy" "${Blue}.gitconfig" "${Green}successfully!"
cp --preserve=all gitignore  ~/.gitignore;
echo -e "${Green}--> Copy" "${Blue}.gitignore" "${Green}successfully!"
cp --preserve=all gitmessage ~/.gitmessage;
echo -e "${Green}--> Copy" "${Blue}.gitmessage" "${Green}successfully!"

# TMUX
rm ~/.tmux.conf;
cp --preserve=all tmux.conf ~/.tmux.conf;
echo -e "${Green}--> Copy" "${Blue}.tmux.conf" "${Green}successfully!"

# MONGO
rm ~/.mongorc.js;
cp --preserve=all mongorc.js ~/.mongorc.js;
echo -e "${Green}--> Copy" "${Blue}.mongorc.js" "${Green}successfully!"

# TERN
rm ~/.tern-config;
cp --preserve=all ./tern-config ~/.tern-config;
echo -e "${Green}--> Copy" "${Blue}.tern-config" "${Green}successfully!"

# ESLint
rm ~/.eslintrc.json
cp --preserve=all ./eslintrc.json ~/.eslintrc.json;
echo -e "${Green}--> Copy" "${Blue}.eslintrc.json" "${Green}successfully!"

# ZSH
rm ~/.zshrc;
cp --preserve=all zshrc ~/.zshrc;
echo -e "${Green}--> Copy" "${Blue}.zshrc" "${Green}successfully!"

# VIM
rm ~/.vim/vimrc
cp --preserve=all vimrc ~/.vim/vimrc;
echo -e "${Green}--> Copy" "${Blue}vimrc" "${Green}successfully!"

echo -e "${Orange}Copying of files has been finished!"

#===============================================================================

echo -e "${Orange}Copying of folders has been started!"

# BIN
rm -rf ~/bin;
cp --preserve=all -r bin ~/bin;
echo -e "${Green}--> Copy" "${Blue}bin" "${Green}successfully!"


# VIM
rm -rf ~/.vim/startup
rm -rf ~/.vim/after
rm -rf ~/.vim/colors
cp --preserve=all -r ./vim/startup ~/.vim/startup;
echo -e "${Green}--> Copy" "${Blue}.vim/startup" "${Green}successfully!"
cp --preserve=all -r ./vim/after   ~/.vim/after;
echo -e "${Green}--> Copy" "${Blue}.vim/after" "${Green}successfully!"
cp --preserve=all -r ./vim/colors  ~/.vim/colors;
echo -e "${Green}--> Copy" "${Blue}.vim/colors" "${Green}successfully!"

# ZSH
rm -rf ~/.zsh;
cp --preserve=all -r ./zsh ~/.zsh;
echo -e "${Green}--> Copy" "${Blue}.zsh" "${Green}successfully!"
echo -e "${Orange}Copying of folders has been finished!"

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
echo -e "${Orange}Copying of vs code files has been finished!"