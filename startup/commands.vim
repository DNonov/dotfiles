" Rename current file
function! RenameFile()
	let old_name = expand("%")
	let new_name = input("New file name: ", expand("%"))
	if new_name != "" && new_name != old_name
		exec ":saveas " . new_name
		exec ":silent !rm " old_name
		redraw!
	endif
endfunction
map <leader>n :call RenameFile() <cr>

" Documentation
" source: https://stackoverflow.com/questions/7942738/vim-plugin-to-generate-javascript-documentation-comments
function! GenerateDOCComment()
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
map <leader>d :call GenerateDOCComment()<cr>
