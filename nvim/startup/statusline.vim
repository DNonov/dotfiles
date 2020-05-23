if &background == 'dark'
  hi User1 ctermbg=236 ctermfg=251 guibg=blue guifg=white
else
  hi User1 ctermbg=250 ctermfg=233 guibg=blue guifg=white
endif

function! SpellOutput() abort
  if &l:spell == 1
    hi User3 ctermbg=236 ctermfg=251 guibg=blue guifg=white
    redrawstatus
    return " SPELL "
  else
    hi User3 ctermbg=252 ctermfg=232 guibg=blue guifg=white
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
    return toupper(fugitive#head())."  "
  else
    return ''
  endif
endfunction

function! ReadOnly() abort
  if &readonly || !&modifiable
    return '  '
  else
    return ''
  endif
endfunction

set statusline=%1*
set statusline+=%1*\ \ \ %{Fugitive()}
set statusline+=%1*\ %{SpellOutput()}
set statusline+=%1*\ %f
set statusline+=\ -\ %{FileSize()}
set statusline+=\ %{ReadOnly()}
set statusline+=%m
set statusline+=%1*\ %{Coc()}
set statusline+=%=
set statusline+=\ %l:%c
set statusline+=\ %{wordcount().words}
set statusline+=\ %y
