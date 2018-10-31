" Ale linters
nmap <leader>l :ALEToggle<CR>

" Ack mapping
nmap <leader>f :Ack<CR>

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

" Add path completition on javascript.jsx filetype
let g:ycm_filepath_blacklist = {}

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key     = '<C-e>'
let g:user_emmet_settings       = { 'javascript.jsx' : { 'extends' : 'jsx', },}
autocmd FileType html,css,javascript.jsx EmmetInstall

" CtrlP config
let g:ctrlp_custom_ignore = 'node_modules'

" Tabularize config
nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t: :Tabularize /:\zs<CR>
vmap <leader>t: :Tabularize /:\zs<CR>
nmap <leader>tf :Tabularize /from<CR>
vmap <leader>tf :Tabularize /from<CR>

" vim-gitguter config
let g:gitgutter_map_keys  = 0
let g:gitgutter_max_signs = 100

" fugitive config
map <C-g>d :Gvdiff<CR>
map <C-g>s :Gstatus<CR>
map <C-g>c :Gcommit<CR>

" vim-auto-save
let g:auto_save        = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Airline settings
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts        = 1
let g:airline_theme                  = 'tomorrow'

" Theme
let g:javascript_plugin_flow  = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Python-mode
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_cwindow        = 0

" vim-better-whitespace
nmap <leader>st :StripWhitespace<CR>
highlight ExtraWhitespace ctermbg=gray
