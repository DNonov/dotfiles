export ZSH=/home/dim/.oh-my-zsh
export PATH=$HOME/bin:$PATH;
export EDITOR="vim"

ZSH_THEME="bullet-train"


# Bullet-train related stuff
BULLETTRAIN_PROMPT_CHAR=" "
BULLETTRAIN_GIT_BG=black
BULLETTRAIN_GIT_FG=white

BULLETTRAIN_PROMPT_ORDER=(
	status
	custom
	dir
	screen
	virtualenv
	aws
	git
	hg
	cmd_exec_time
)

plugins=(
	vi-mode
)

source $ZSH/oh-my-zsh.sh
function workspace(){
  cd Documents/workspace;
}

alias nm='nodemon'
alias npms="npm start"
alias npmt="npm test"
alias py="python3"

function mongoon(){
  service mongod start;
}

function mongooff(){
  service mongod stop;
}
