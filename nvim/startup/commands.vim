nnoremap <leader>d :call lib#GenerateDOCComment()<CR>
nnoremap <leader>S :call lib#DisplaySyntaxStack()<CR>
vnoremap <leader>rv :call lib#ExtractVariable()<CR>

" Put grep output in quick fix window
autocmd QuickFixCmdPost *grep* cwindow

" Fix vimwiki <tab> keymap clash
autocmd filetype vimwiki silent! iunmap <buffer> <Tab>
