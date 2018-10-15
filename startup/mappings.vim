" Faster scrolling
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Faster yanking a line
nmap <leader>k yyp
nmap <leader>K yyP

" Sort
vmap <leader>sr :sort<CR>

" Vs code like behavior Shift+Alt+Arrow
no <down> ddp
no <up> ddkP

" Moving through splits
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" PWD
cnoremap %% <C-R>=expand("%:h")."/"<cr>

" Toggle spell check
map <leader>s :set spell! spelllang=en_us<CR>

" remove highlighting from current search
:nnoremap <silent> <Space> :nohlsearch<Bar>echo<CR>

" shows last search in quickfix
nmap g/ :vimgrep /<C-R>//j %<CR>\|:cw<CR>

" Edit Vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source Vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>