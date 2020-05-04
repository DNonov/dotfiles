" Set spell automatically, once commit buffer is open
autocmd FileType gitcommit setlocal spell spelllang=en_us

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Add nice syntax highlight to jsonc comments
autocmd FileType json syntax match Comment +\/\/.\+$+
