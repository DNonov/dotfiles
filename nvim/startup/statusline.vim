if &background == 'dark'
  hi User1 ctermbg=236 ctermfg=251
  hi User2 ctermbg=238 ctermfg=251
  hi User3 ctermbg=236 ctermfg=251
else
  hi User1 ctermbg=254 ctermfg=233
  hi User2 ctermbg=25 ctermfg=254
  hi User3 ctermbg=254 ctermfg=88
endif

function! SpellOutput() abort
  if &l:spell == 1
    redrawstatus
    return " SPELL "
  else
    redrawstatus
    return ""
  endif
endfunction

function! FileSize() abort
    let l:bytes = getfsize(expand('%p'))
    if (l:bytes >= 1024)
        let kilo_bytes = l:bytes / 1025
    endif
    if (exists('kilo_bytes') && kilo_bytes >= 1000)
        let mega_bytes = kilo_bytes / 1000
    endif

    if l:bytes <= 0
        return '0'
    endif

    if (exists('mega_bytes'))
        return mega_bytes . ' MB '
    elseif (exists('kilo_bytes'))
        return kilo_bytes . ' KB '
    else
        return l:bytes . ' B '
    endif
endfunction

function! Coc() abort
  if (exists('g:coc_status'))
    return g:coc_status
  else
    return ''
  endif
endfunction

function! Fugitive() abort
  if (exists('g:loaded_fugitive'))
    return toupper(fugitive#head())
  else
    return ''
  endif
endfunction

function! ReadOnly() abort
  if &readonly || !&modifiable
    return '    '
  else
    return ''
  endif
endfunction

set statusline=%2*
set statusline+=%2*\ %{Fugitive()}
set statusline+=%2*\ %{SpellOutput()}
set statusline+=%1*\ %f
set statusline+=%1*\ -\ %{FileSize()}
set statusline+=%1*\%{ReadOnly()}
set statusline+=%3*\%m
set statusline+=%=
set statusline+=%1*\%{Coc()}\ |
set statusline+=%2*\ %{wordcount().words}
set statusline+=%2*\ %y
