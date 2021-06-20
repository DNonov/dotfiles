" Nerdtree config
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeDirArrowExpandable  = '+'

" Magit
nnoremap <leader>m :Magit<CR>

" Git fugitive
nnoremap <leader>g :Gstatus<CR>

" Splitting and joining code blocks
nmap <silent> sk <Plug>SplitjoinSplit
nmap <silent> sj <Plug>SplitjoinJoin
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
map <C-_> <Plug>Commentary

" vim-gitguter config
let g:gitgutter_map_keys  = 0
let g:gitgutter_max_signs = 500

" vim-auto-save
let g:auto_save        = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_silent = 1

" Coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
let g:python_highlight_all           = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors  = 0

" Markdown Preview
let g:mkdp_preview_options = {'content_editable': v:true}
let g:vim_markdown_math    = 1
nnoremap <leader>o :MarkdownPreview<CR>

" Vim Wiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_conceallevel = 0
let g:vimwiki_global_ext   = 0

" Coc-spell-checker
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Tagalong
let g:tagalong_additional_filetypes = ['javascript']
