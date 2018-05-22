# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/dim/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

BULLETTRAIN_PROMPT_CHAR="λ:"
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

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#===================================================================================================================================
#   PERSONAL SETTINGS
#===================================================================================================================================

# export bin
export PATH=$HOME/bin:$PATH;

# default editor
export EDITOR="vim"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Linux/UNIX tools
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Conection check
alias con='ping 8.8.8.8'

# Shortcuts 
alias t='tmux'
alias g='| grep'
alias md='mkdir'
alias mf='touch'

# Function that creates dir and 'CD' into.
function mdc(){
  mkdir "$1";
  cd "$1";
}

# Function that creates file and then open it in VS Code.
function mfc(){
  touch "$1";
  code "$1"; 
}

# Function displays first 'n' lines of a file.
function cathead(){
  cat "$1" | head -n "$2";
}

#Function displays last 'n' lines of a file.
function cattail(){
  cat "$1" | tail -n "$2";
}

# Function that run curl on localhost at any given port.
# $1 = -I -- HEAD request
# $1 = -G -- GET request
function crl() {
  curl ${1:--I} localhost:${2:-3000};
}

# Function that displays ports that listen.
function ports(){
  watch -n 1 'sudo lsof -i -n -P | grep -v dnsmasq |  grep -v cupsd | grep -i listen';
}

# Function that displays git status of a project.
function gstat(){
	watch -n 1 "git status";
}

# Function that displays documents at any given database and collection on localhost.
# $1 = database
# $2 = collection
function mwatch(){
  watch -n 1 "mongo "$1" --eval 'db."$2".find().pretty().shellPrint();' | grep -ie _id -e name -e author";
}

# Function that remove documment at any given databadse and colection on localhost.
# $1 = database
# $2 = collection
# $3 = key
# $4 = value
function mremove(){
  mongo "$1" --eval "db."$2".remove({'"$3"': '"$4"'});";
}

# Function that remove all documment at any given databadse and colection on localhost.
# $1 = database
# $2 = collection
function __dropAllDocs(){
  mongo "$1" --eval "db."$2".remove({});";
}

# Function that remove any given databadse on localhost.
# $1 = database
function __dropDB(){
  mongo "$1" --eval "db.dropDatabase();";
}

# Function that opens chrome at localhost at any given port.
# $1 = port
function load(){
  google-chrome 127.0.0.2:"$1";
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Terminal navigation
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Function that goes to .vimrc
function vimrc(){
  cd /home/dim/Documents/workspace/dotfiles;
  vim .vimrc;
}

# Function that goes to workspace.
function workspace(){
  cd Documents/workspace;
}

# Function that goes to my personal settings.
function settings(){
  cd Documents/workspace/dotfiles;
  vim .vimrc;
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Git related
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Shortcuts for some git commands.
alias gi='git init'
alias gsa='git add -A'
alias gsf='git add -f'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gp='git push -u'
alias gpm='git push -u origin master'
function gc(){
  git commit -m "$1"
}


# Function that create .gitignore file with 'node_modules/' text.
function gitignore(){
  touch .gitignore;
  echo 'node_modules/' > .gitignore;
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Web Deveopment tools
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#Shortcut for cloning small project template
alias gittemplate='git clone https://github.com/DNonov/small-projects-template.git'

# Shortcuts for some gulp commands.
alias gw='gulp watch'
alias gb='gulp build'

# nodemon
alias nm='nodemon'

# NPM
alias ninstall='npm install'
alias ninit='npm init -y'
alias npmis='npm install --save'
alias npmisd='npm install --save-dev'
alias iexpress='npm install express --save'

# Function that starts mongod proces.
function mongoon(){
  service mongod start;
}

# Function that stops mongod proces.
function mongooff(){
  service mongod stop;
}
