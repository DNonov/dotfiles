" vim-jsx seems does not work correct, so ...
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx

" Set all templates to use jinja.html
autocmd FileType htmldjango set filetype=jinja.html

" Set spell automatically, once commit buffer is open
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Detect Docker files with custom names
autocmd BufNewFile,BufRead Dockerfile.* set filetype=dockerfile

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
