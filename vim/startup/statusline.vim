hi User1 ctermbg=252 ctermfg=232 guibg=blue guifg=white

function! SpellOutput() abort
  if &l:spell == 1
    hi User3 ctermbg=0 ctermfg=255 guibg=blue guifg=white
    redrawstatus
    return " SPELL "
  else
    hi User3 ctermbg=252 ctermfg=232 guibg=blue guifg=white
    redrawstatus
    return ""
  endif
endfunction

function! GitBranchName() abort
  let l:branch = gitbranch#name()
  if (branch == "")
    hi User2 ctermbg=252 ctermfg=232 guibg=blue guifg=white
    redrawstatus
    return ""
  else
    hi User2 ctermbg=0 ctermfg=255 guibg=blue guifg=white
    redrawstatus
    return toupper(branch)
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
" Trilling white space is there on purpose
set statusline=%1*
set statusline+=\ \ 
set statusline+=%2*\ 
set statusline+=%2*%{GitBranchName()}
set statusline+=%2*\ 
"set statusline+=%1*\ \ 
set statusline+=%3*%{SpellOutput()}
set statusline+=%1*\ %t
set statusline+=\ -\ %{FileSize()}
set statusline+=\ %{ReadOnly()}
set statusline+=%m
set statusline+=%=
set statusline+=\ %l:%c
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
