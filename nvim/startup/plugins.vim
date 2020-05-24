" Nerdtree config
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '⯈ '
let g:NERDTreeDirArrowCollapsible = '⯆ '

" Git gutter
let g:gitgutter_sign_added = '▊ '
let g:gitgutter_sign_modified = '▊ '
let g:gitgutter_sign_removed = '▊ '
let g:gitgutter_sign_removed_first_line = '▊ '
let g:gitgutter_sign_modified_removed = '▊ '

" Magit
nnoremap <leader>m :Magit<CR>

" Git fugitive
nnoremap <leader>g :Gstatus<CR>

" Splitting and joining code blocks
nmap <silent> sj <Plug>SplitjoinSplit
nmap <silent> sk <Plug>SplitjoinJoin
" Execute normal vim join if in visual mode
xnoremap sk J

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
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme           = 'papercolor'

" Theme
let g:javascript_plugin_flow  = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use ; to show documentation in preview window.
nnoremap <silent> <leader>; :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-tslint-plugin',
  \ 'coc-sh',
  \ 'coc-python',
  \ 'coc-vimlsp',
  \ 'coc-emmet',
  \ 'coc-spell-checker',
  \ ]

" Fzf
nmap <c-p> :FZF <CR>

let g:fzf_layout = {'down': '100%'}
autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 noshowmode noruler
\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Polyglot
let g:python_highlight_all = 1

" Markdown Preview
let g:mkdp_preview_options = {'content_editable': v:true}
let g:vim_markdown_math = 1
nnoremap <leader>o :MarkdownPreview<CR>

" Vim Wiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_conceallevel=0

" Coc-spell-checker
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
