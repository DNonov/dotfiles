" Execute a command, leaving the cursor on the current line
function! lib#InPlace(command)
  let saved_view = winsaveview()
  exe a:command
  call winrestview(saved_view)
endfunction

" Execute a command, leaving the cursor on the current line and avoiding
" clobbering the search register.
function! lib#WithSavedState(command)
  let current_histnr = histnr('/')

  call lib#InPlace(a:command)

  if current_histnr != histnr('/')
    call histdel('/', -1)
    let @/ = histget('/', -1)
  endif
endfunction
