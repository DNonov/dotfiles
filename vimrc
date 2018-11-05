filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" =============================================================================
" General
" =============================================================================
Plugin '907th/vim-auto-save'
Plugin 'vimwiki/vimwiki'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'digitaltoad/vim-pug'
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
" =============================================================================
" Linting
" =============================================================================
Plugin 'w0rp/ale'
" =============================================================================
" Snippets auto compl.
" =============================================================================
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
" =============================================================================
" JavaScript
" =============================================================================
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx', {'for': ['jsx', 'javascript.jsx']}
Plugin 'mattn/emmet-vim', {'for': ['javascript.jsx', 'html', 'css']}
Plugin 'pangloss/vim-javascript'
" =============================================================================
" Python
" =============================================================================
Plugin 'python-mode/python-mode', {'for': 'python'}
Plugin 'lepture/vim-jinja', {'for': 'python'}
" =============================================================================
" Clojure
" =============================================================================
Plugin 'guns/vim-clojure-static', {'for': 'clojure'}
Plugin 'tpope/vim-fireplace', {'for': 'clojure'}
" =============================================================================
" Colors
" =============================================================================
Plugin 'cocopon/iceberg.vim'
Plugin 'dnonov/vim-code-dark'
Plugin 'nanotech/jellybeans.vim'
Plugin 'romainl/Apprentice'
call vundle#end()

runtime startup/autocommands.vim
runtime startup/settings.vim
runtime startup/mappings.vim
runtime startup/commands.vim
runtime startup/plugins.vim
