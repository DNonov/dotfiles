" vim-jsx seems does not work correct, so ...
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx

" Disable ALE for all python files
autocmd FileType python :ALEDisable

" Set spell automatically, once commit buffer is open
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Highlights function calls in python
autocmd Syntax python syntax match pythonFunction /\v([^[:cntrl:][:space:][:punct:][:digit:]]|_)([^[:cntrl:][:punct:][:space:]]|_)*\ze(\s?\()/

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
