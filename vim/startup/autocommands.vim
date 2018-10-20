" vim-jsx seems does not work correct, so ...
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx

" Different indentation
autocmd FileType python setlocal tabstop=4 shiftwidth=4  expandtab

" Set spell automatically, once commit buffer is open
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Highlights function calls in python
autocmd Syntax python syntax match pythonFunction /\v([^[:cntrl:][:space:][:punct:][:digit:]]|_)([^[:cntrl:][:punct:][:space:]]|_)*\ze(\s?\()/
