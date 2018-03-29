set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'romainl/Apprentice'
Plugin 'airblade/vim-gitgutter'
Plugin '907th/vim-auto-save'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'dnonov/vim-code-dark'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ap/vim-css-color'
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

" highlight all search matches
:set hlsearch

" remove highlighting from current search
:nnoremap <silent> <Space> :nohlsearch<Bar>echo<CR>

" Airline settings
let g:airline_powerline_fonts = 1

" Settings
let mapleader = ","
set updatetime=100
set number
set relativenumber
set t_Co=256
set smartindent
set tabstop=2
set shiftwidth=4
set expandtab
set nofixendofline
set nowrap

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

" Documentation
" source: https://stackoverflow.com/questions/7942738/vim-plugin-to-generate-javascript-documentation-comments

map <leader>d :call GenerateDOCComment()<cr>

function! GenerateDOCComment()
  let l    = line('.')
  let i    = indent(l)
  let pre  = repeat(' ',i)
  let text = getline(l)
  let params   = matchstr(text,'([^)]*)')
  let paramPat = '\([$a-zA-Z_0-9]\+\)[, ]*\(.*\)'
  echomsg params
  let vars = []
  let m    = ' '
  let ml = matchlist(params,paramPat)
  while ml!=[]
    let [_,var;rest]= ml
    let vars += [pre.' * @param '.var]
    let ml = matchlist(rest,paramPat,0)
  endwhile
  let comment = [pre.'/**',pre.' * '] + vars + [pre.' */']
  call append(l-1,comment)
  call cursor(l+1,i+3)
endfunction

" Mappings
" Faster scrolling
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Moving through splits
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" Get out of surroundings
:inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
