set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim', {'for': ['javascript.jsx', 'html', 'css']}
Plugin 'mileszs/ack.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin '907th/vim-auto-save'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'nanotech/jellybeans.vim'
Plugin 'cocopon/iceberg.vim'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx', {'for': ['jsx', 'javascript.jsx']}
Plugin 'dnonov/vim-code-dark'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ap/vim-css-color'
call vundle#end()
filetype plugin indent on

"nerdtree config
map <C-n> :NERDTreeToggle<CR>

" Emmet
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_install_global = 0
let g:user_emmet_settings = { 'javascript.jsx' : { 'extends' : 'jsx', },}
autocmd FileType html,css,javascript.jsx EmmetInstall

" CtrlP config
let g:ctrlp_custom_ignore = 'node_modules'

" vim-gitguter config
let g:gitgutter_max_signs = 100
let g:gitgutter_map_keys = 0

" fugitive config
map <C-g>d :Gvdiff<CR>
map <C-g>s :Gstatus<CR>
map <C-g>c :Gcommit<CR>

" vim-auto-save
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave"]

" highlight all search matches
:set hlsearch

" remove highlighting from current search
:nnoremap <silent> <Space> :nohlsearch<Bar>echo<CR>

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" Settings
let mapleader = ","
set updatetime=100
set number
set relativenumber
set t_Co=256
set smartindent
set tabstop=2
set shiftwidth=2
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


" Memorize the last position of the cursor into the buffer
augroup vimrcEx
	autocmd!
	autocmd FileType text setlocal textwidth=78
	" Jump to last currsor position when open buffer again
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\		exe "normal g`\"" |
		\	endif
augroup END

" Rename current file
function! RenameFile()
	let old_name = expand("%")
	let new_name = input("New file name: ", expand("%"))
	if new_name != "" && new_name != old_name
		exec ":saveas " . new_name
		exec ":silent !rm " old_name
		redraw!
	endif
endfunction
map <leader>n :call RenameFile() <cr>

" PWD
cnoremap %% <C-R>=expand("%:h")."/"<cr>


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

" Fast .vimrc edit. 'e' and 'v' stands for
" Edit Vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Fast sourcing .vimrc. 's' and 'v' stands for
" Source Vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Different cursorInsert/Normal
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Faster scrolling
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Vs code like behavior Shift+Alt+Arrow
no <down> ddp
no <up> ddkP

" some good mappings
:nmap H 0
:nmap L $

" Moving through splits
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l
