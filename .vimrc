set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'romainl/Apprentice'
Plugin 'airblade/vim-gitgutter'
Plugin '907th/vim-auto-save'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'dnonov/vim-code-dark'
call vundle#end()            
filetype plugin indent on

"nerdtree config
map <C-n> :NERDTreeToggle<CR>

" CtrlP config
let g:ctrlp_custom_ignore = 'node_modules'

" vim-gitguter config
let g:gitgutter_max_signs = 100
let g:gitgutter_map_keys = 0
map <C-g> :Gvdiff<CR>

" vim-auto-save
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI"]

" Airline settings
let g:airline_powerline_fonts = 1

" Settings
set updatetime=100
set number
set relativenumber
set t_Co=256
set smartindent
set tabstop=2
set shiftwidth=4
set expandtab
set nofixendofline

" Enable syntax
if !exists("g:syntax_on")
    syntax enable
endif

"Store temporary files in a central spot
let vimtmp = $HOME . '/.tmp/' . getpid()
silent! call mkdir(vimtmp, "p", 0700)
let &backupdir=vimtmp
let &directory=vimtmp

" Theme
colorscheme codedark
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc= 1
let g:javascript_plugin_flow= 1

" Mappings
:inoremap ( ()<Esc>i
:inoremap { {}<Esc>i
:inoremap [ []<Esc>i
:inoremap ' ''<Esc>i
:inoremap " ""<Esc>i
