" Enable syntax
if !exists("g:syntax_on")
    syntax enable
endif

"Default indentation
filetype plugin indent on
set smarttab
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2

" Settings
colorscheme dnonov-dark
let mapleader = "\<space>"
set updatetime=100
set number
set relativenumber
set cursorline
set t_Co=256
set nofixendofline
set lazyredraw
set incsearch
set wrap

" Different cursor on INSERT and NORMAL mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"Store temporary files in a central spot
let vimtmp = $HOME . '/.tmp/' . getpid()
silent! call mkdir(vimtmp, "p", 0700)
let &backupdir=vimtmp
let &directory=vimtmp
