function! SpellOutput()
  if &l:spell == 1
    return "spell "
  else
    return ""
  endif
endfunction

function! FileSize() abort
    let l:bytes = getfsize(expand('%p'))
    if (l:bytes >= 1024)
        let l:kbytes = l:bytes / 1025
    endif
    if (exists('kbytes') && l:kbytes >= 1000)
        let l:mbytes = l:kbytes / 1000
    endif

    if l:bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return l:mbytes . 'MB '
    elseif (exists('kbytes'))
        return l:kbytes . 'KB '
    else
        return l:bytes . 'B '
    endif
endfunction

function! ReadOnly() abort
  if &readonly || !&modifiable
    return ''
  else
    return ''
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
set statusline+=\ -\ %{FileSize()}
set statusline+=\ %{ReadOnly()}
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
