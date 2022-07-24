DIR="${HOME}/Documents/workspace/dotfiles"

.PHONY: tmux tmuxp neovim git zsh code bin kitty hooks all help

all: neovim zsh tmux tmuxp bin git code hooks

neovim:
	@ln -sf "$(DIR)"/nvim ${HOME}/.config/nvim

zsh:
	@ln -sf "$(DIR)"/zsh ${HOME}/.zsh
	@ln -sf "$(DIR)"/zshrc ${HOME}/.zshrc
	@ln -sf "$(DIR)"/zsh-theme/dnonov.zsh-theme \
		${HOME}/.oh-my-zsh/themes/dnonov.zsh-theme

tmux:
	@ln -sf "$(DIR)"/tmux ${HOME}/.tmux
	@ln -sf "$(DIR)"/tmux.conf ${HOME}/.tmux.conf

tmuxp:
	@ln -sf "$(DIR)"/tmuxp ${HOME}/.tmuxp

bin:
	@ln -sf "$(DIR)"/bin ${HOME}/

git:
	@ln -sf "$(DIR)"/gitconfig ${HOME}/.gitconfig
	@ln -sf "$(DIR)"/gitignore ${HOME}/.gitignore

hooks:
	@rm -rf "$(DIR)"/.git/hooks
	@ln -sf "$(DIR)"/hooks "$(DIR)"/.git/

code:
	@bash ./code/settings.sh; ln -sf "$(DIR)"/code/settings.json \
		${HOME}/.config/Code/User/settings.json
	@ln -sf "$(DIR)"/code/keybindings.json \
		${HOME}/.config/Code/User/keybindings.json
codemac:
	@python3 ./code/settings.py; ln -sf "$(DIR)"/code/settings.json \
		${HOME}/Library/Application\ Support/Code/User/settings.json
	@ln -sf "$(DIR)"/code/keybindings.json \
		${HOME}/Library/Application\ Support/Code/User/keybindings.json

kitty:
	@ln -sf "$(DIR)"/kitty ${HOME}/.config/kitty

help:
	@echo 'Makefile for my dotfiles                                     '
	@echo '                                                             '
	@echo 'Usage:                                                       '
	@echo '   make all                            Setup all dotfiles    '
	@echo '   make zsh                            Setup zsh settings    '
	@echo '   make neovim                         Setup neovim settings '
	@echo '   make tmux                           Setup tmux settings   '
	@echo '   make tmuxp                          Setup tmuxp settings  '
	@echo '   make bin                            Setup bin settings    '
	@echo '   make git                            Setup git settings    '
	@echo '   make code                           Setup vs code settings'
	@echo '                                                             '

