set nocompatible              " be iMproved, required
filetype plugin on            " required

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" ======================================================
" General
" ======================================================
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
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" ======================================================
" Linting
" ======================================================
Plugin 'w0rp/ale'
" ======================================================
" Snippets auto compl.
" ======================================================
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
" ======================================================
" JavaScript
" ======================================================
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx', {'for': ['jsx', 'javascript.jsx']}
Plugin 'pangloss/vim-javascript'
" ======================================================
" Colors
" ======================================================
Plugin 'cocopon/iceberg.vim'
Plugin 'dnonov/vim-code-dark'
Plugin 'nanotech/jellybeans.vim'
" ======================================================
" HTML CSS
" ======================================================
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'mattn/emmet-vim', {'for': ['javascript.jsx', 'html', 'css']}
" ======================================================
" CSharp
" ======================================================
Plugin 'ap/vim-css-color'
call vundle#end()
filetype plugin indent on

"+------------------+
"|                  |
"|  Plugins config  |
"|                  |
"+------------------+


"nerdtree config
map <C-n> :NERDTreeToggle<CR>

" UltiSnipsTriger
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-Tab>"
let g:UltiSnipsJumpFrowardTrigger  = "<Tab>"

" make YCM compatible with UltiSnips (using supertab)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key     = '<C-e>'
let g:user_emmet_settings       = { 'javascript.jsx' : { 'extends' : 'jsx', },}
autocmd FileType html,css,javascript.jsx EmmetInstall

" CtrlP config
let g:ctrlp_custom_ignore = 'node_modules'

" Tabularize config
if exists(":Tabularize")
	nmap <leader>t= :Tabularize /=<CR>
	vmap <leader>t= :Tabularize /=<CR>
	nmap <leader>t: :Tabularize /:\zs<CR>
	vmap <leader>t: :Tabularize /:\zs<CR>
endif

" vim-gitguter config
let g:gitgutter_map_keys  = 0
let g:gitgutter_max_signs = 100

" fugitive config
map <C-g>d :Gvdiff<CR>
map <C-g>s :Gstatus<CR>
map <C-g>c :Gcommit<CR>

" vim-auto-save
let g:auto_save        = 1
let g:auto_save_events = ["InsertLeave"]

" Airline settings
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts        = 1
let g:airline_theme                  = 'tomorrow'

" Theme
let g:javascript_plugin_flow  = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

"+-------------------------+
"|                         |
"|  Settings and mappings  |
"|                         |
"+-------------------------+

" Enable syntax
if !exists("g:syntax_on")
    syntax enable
endif

colorscheme tomorrow
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

" Different indentation
autocmd FileType python setlocal ts=4 sw=4 sts=0 expandtab
autocmd FileType csharp setlocal ts=4 sw=4 sts=0 expandtab

" Remove all trailing white spaces after save
autocmd BufWritePre * :%s/\s\+$//e

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

" Different cursor on INSERT and NORMAL mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" PWD
cnoremap %% <C-R>=expand("%:h")."/"<cr>

" Toggle spell check
map <leader>s :set spell! spelllang=en_us<CR>

" highlight all search matches
:set hlsearch

" remove highlighting from current search
:nnoremap <silent> <Space> :nohlsearch<Bar>echo<CR>

" shows last search in quickfix
nmap g/ :vimgrep /<C-R>//j %<CR>\|:cw<CR>

" Edit Vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source Vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>

"Store temporary files in a central spot
let vimtmp = $HOME . '/.tmp/' . getpid()
silent! call mkdir(vimtmp, "p", 0700)
let &backupdir=vimtmp
let &directory=vimtmp

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
