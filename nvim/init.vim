filetype off
set rtp+=~/.fzf

call plug#begin()
" General
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
Plug '907th/vim-auto-save'
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install()}}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'aghareza/vim-gitgrep'
" Languages
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Colors
Plug 'cocopon/iceberg.vim'
Plug 'dnonov/vim-code-dark'
Plug 'dnonov/dnd'
Plug 'dnonov/dnl'
Plug 'dnonov/light-delight'
Plug 'nanotech/jellybeans.vim'
Plug 'romainl/Apprentice'
call plug#end()

runtime startup/settings.vim
runtime startup/autocommands.vim
runtime startup/mappings.vim
runtime startup/commands.vim
runtime startup/plugins.vim
runtime startup/statusline.vim
runtime startup/cyrillic.vim
