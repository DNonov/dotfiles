" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Add nice syntax highlight to jsonc comments
autocmd FileType json syntax match Comment +\/\/.\+$+

" Clean all useless whitespace
autocmd BufWritePre *
  \ if !exists('g:skip_clean_whitespace') && !exists('b:skip_clean_whitespace')|
  \   call lib#WithSavedState('%s/\s\+$//e')|
  \ endif

