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
colorscheme dnd
let mapleader = "\<space>"
set updatetime=100
set signcolumn=yes
set number
set relativenumber
set colorcolumn=80
set t_Co=256
set nofixendofline
set wrap
set nohlsearch

"Store temporary files in a central spot
let vimtmp = $HOME . '/.tmp/' . getpid()
silent! call mkdir(vimtmp, "p", 0700)
let &backupdir=vimtmp
let &directory=vimtmp
