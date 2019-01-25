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

" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Add path completition on javascript.jsx filetype
let g:ycm_filepath_blacklist = {}

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key     = '<C-e>'
let g:user_emmet_settings       = { 'javascript.jsx' : { 'extends' : 'jsx', },}
autocmd FileType html,css,javascript.jsx,jinja.html EmmetInstall

" Fzf config
nmap <C-p> :FZF<CR>

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

" Javascript highlight extra
let g:javascript_plugin_flow  = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Python-mode
let g:pymode_python              = "python3"
let g:pymode_lint_cwindow        = 0
let g:pymode_lint_ignore         = ["W0401"]
let g:pymode_options_colorcolumn = 0
let g:pymode_trim_whitespaces    = 0
let g:pymode_doc                 = 0

" vim-better-whitespace
nmap <leader>st :StripWhitespace<CR>
highlight ExtraWhitespace ctermbg=gray

" splitjoin mappings
let g:splitjoin_split_mapping = '<C-s>'
let g:splitjoin_join_mapping  = '<C-j>'
