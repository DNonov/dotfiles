#! /bin/bash

# Add colors util
. ./utils/colors.sh

echo -e "${Black}Create symbolic links!"
ln -s "$(pwd)"/gitconfig  ~/.gitconfig;
ln -s "$(pwd)"/gitignore  ~/.gitignore;
ln -s "$(pwd)"/gitmessage ~/.gitmessage;
ln -s "$(pwd)"/tmux.conf ~/.tmux.conf;
ln -s "$(pwd)"/mongorc.js ~/.mongorc.js;
ln -s "$(pwd)"/tern-config ~/.tern-config;
ln -s "$(pwd)"/eslintrc.json ~/.eslintrc.json;
ln -s "$(pwd)"/zshrc ~/.zshrc;
ln -sfT "$(pwd)"/vim ~/.vim;
ln -s "$(pwd)"/bin ~/;
ln -sfT "$(pwd)"/zsh ~/.zsh;
ln -s "$(pwd)"/code/settings.json ~/.config/Code/User/settings.json
ln -s "$(pwd)"/code/keybindings.json ~/.config/Code/User/keybindings.json
ln -s "$(pwd)"/zsh-theme/dnonov.zsh-theme ~/.oh-my-zsh/themes/dnonov.zsh-theme