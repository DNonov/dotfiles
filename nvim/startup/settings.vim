" Enable syntax
if !exists("g:syntax_on")
    syntax enable
endif

" Colorscheme
if trim(system("echo $theme_color")) == 'light'
  colorscheme dnl
else
  colorscheme dnd
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

" Split separator
set fillchars+=vert:\|

" Preserves indentation while pasting text from the clipboard
nnoremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

" Yank text to the clipboard
nnoremap <leader>y "*Y
vnoremap <leader>y "*Y

" Paste text to the clipboard
nnoremap <leader>p "*p

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Clean all useless whitespace
autocmd BufWritePre *
  \ if !exists('g:skip_clean_whitespace') && !exists('b:skip_clean_whitespace')|
  \   call lib#WithSavedState('%s/\s\+$//e')|
  \ endif

" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=1000
  augroup END
endif

"Store temporary files in a central spot
let vimtmp = $HOME . '/.tmp/' . getpid()
silent! call mkdir(vimtmp, "p", 0700)
let &backupdir=vimtmp
let &directory=vimtmp
