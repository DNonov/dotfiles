function! SpellOutput()
  if &l:spell == 1
    return "spell "
  else
    return ""
  endif
endfunction

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
" Tilling white space is there on purpose
set statusline+=\ \ 
set statusline+=\|\|
set statusline+=%{gitbranch#name()}
set statusline+=\|\|
set statusline+=\ \ 
set statusline+=%{SpellOutput()}
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
