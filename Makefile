DIR="${HOME}/Documents/workspace/dotfiles"

.PHONY: tmux tmuxp neovim git zsh code bin all

all: neovim zsh tmux tmuxp bin git code

neovim:
	@ln -sfT "$(DIR)"/nvim ~/.config/nvim

zsh:
	@ln -sfT "$(DIR)"/zsh ~/.zsh
	@ln -sf "$(DIR)"/zshrc ~/.zshrc
	@ln -sf "$(DIR)"/zsh-theme/dnonov.zsh-theme \
		~/.oh-my-zsh/themes/dnonov.zsh-theme

tmux:
	@ln -sfT "$(DIR)"/tmux ~/.tmux
	@ln -sf "$(DIR)"/tmux.conf ~/.tmux.conf

tmuxp:
	@ln -sfT "$(DIR)"/tmuxp ~/.tmuxp

bin:
	@ln -sf "$(DIR)"/bin ~/

git:
	@ln -sf "$(DIR)"/gitconfig ~/.gitconfig
	@ln -sf "$(DIR)"/gitignore ~/.gitignore

code:
	@bash ./code/settings.sh; ln -sf "$(DIR)"/code/settings.json \
		~/.config/Code/User/settings.json
	@ln -sf "$(DIR)"/code/keybindings.json \
		~/.config/Code/User/keybindings.json
