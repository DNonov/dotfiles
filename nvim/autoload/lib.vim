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

" Generate doc comment
function! lib#GenerateDOCComment()
  let l    = line('.')
  let i    = indent(l)
  let pre  = repeat(' ',i)
  let text = getline(l)
  let params   = matchstr(text,'([^)]*)')
  let paramPat = '\([$a-zA-Z_0-9]\+\)[, ]*\(.*\)'
  echomsg params
  let vars = []
  let m    = ' '
  let ml = matchlist(params,paramPat)
  while ml!=[]
    let [_,var;rest]= ml
    let vars += [pre.' * @param '.var]
    let ml = matchlist(rest,paramPat,0)
  endwhile
  let comment = [pre.'/**',pre.' * '] + vars + [pre.' */']
  call append(l-1,comment)
  call cursor(l+1,i+3)
endfunction

" Display syntax group under the cursor
function! lib#DisplaySyntaxStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" Extract variable
function! lib#ExtractVariable()
  let name = input('Variable name: ')
  if name == ''
    return
  endif
  normal! gv
  exec 'normal c' . name
  exec 'normal! O' . 'let ' . name . ' = @'
  normal! $p
  exec ':%s/=\ @/= /'
endfunction
