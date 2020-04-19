" Nerdtree config
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

" Tabularize config
nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t: :Tabularize /:\zs<CR>
vmap <leader>t: :Tabularize /:\zs<CR>
nmap <leader>tf :Tabularize /from<CR>
vmap <leader>tf :Tabularize /from<CR>

" vim-commentary
vmap <C-c> :Commentary<CR>
nmap <C-c> :Commentary<CR>

" vim-gitguter config
let g:gitgutter_map_keys  = 0
let g:gitgutter_max_signs = 100

" vim-auto-save
let g:auto_save        = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'tomorrow'

" Theme
let g:javascript_plugin_flow  = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1


" vim-better-whitespace
nmap <leader>w :StripWhitespace<CR>
highlight ExtraWhitespace ctermbg=red

" Coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Fzf
nmap <c-p> :FZF <CR>

let g:fzf_layout = {'down': '100%'}
autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 noshowmode noruler
\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


" Polyglot
let g:python_highlight_all = 1

" Spelunker
let g:spelunker_target_min_char_len = 1
