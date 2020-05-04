filetype off
set rtp+=~/.fzf

call plug#begin()
" Style
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" General
Plug 'vimwiki/vimwiki'
Plug '907th/vim-auto-save'
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'jreybert/vimagit'
" Languages
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Colors
Plug 'kamykn/spelunker.vim'
Plug 'cocopon/iceberg.vim'
Plug 'dnonov/vim-code-dark'
Plug 'dnonov/dnd'
Plug 'dnonov/light-delight'
Plug 'nanotech/jellybeans.vim'
Plug 'romainl/Apprentice'
call plug#end()

runtime startup/autocomands.vim
runtime startup/settings.vim
runtime startup/mappings.vim
runtime startup/commands.vim
runtime startup/plugins.vim
runtime startup/statusline.vim
