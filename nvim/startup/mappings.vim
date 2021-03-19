" Faster scrolling
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Faster yanking a line
nmap <leader>k yyp
nmap <leader>K yyP

" Easily mark a single line in character-wise visual mode
nnoremap vv _vg_

" Find a string or pattern within a repo
nnoremap <C-f> :Ggrep '

" Find a word under the cursor within a repo
nnoremap <leader>f :execute "Ggrep " . expand('<cword>') <CR>

"Sort
vmap <leader>sr :sort<CR>

" Moving through splits
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" PWD
cnoremap %% <C-R>=expand("%:h")."/"<CR>

" Toggle spell check
map <leader>s :set spell! spelllang=en_us<CR>


" shows last search in quickfix
nmap g/ :vimgrep /<C-R>//j %<CR>\|:cw<CR>

" Edit Vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Source Vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
