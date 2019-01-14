function! ExtractClass() abort
  " junk_in_raw_word - every char that is not part of the class name
  "
  " Example
  " class="input" - junk chars are 'class=""' - 8 chars all together
  " jsx has a little more junk 'className=""' - 12 chars all together

  let l:raw_word = expand("<cWORD>")

  if &filetype == "JavaScript" || &filetype == "javascript.jsx"
    let l:junk_in_raw_word = 12
  else
    let l:junk_in_raw_word = 8
  endif

  let l:class_name_length = len(l:raw_word) - l:junk_in_raw_word
  return strpart(l:raw_word, l:junk_in_raw_word - 1, l:class_name_length)
endfunction

function! CssJump() abort
  let l:current_word = ExtractClass()
  let class_dict = {}

  let l:get_all_css_info =
    \'grep -rEn "^\." --exclude-dir=node_modules --include="*.css"'
    \.' | grep -v ">"'
    \.' | cut -d ":" -f 1,2,3'
    \.' | cut -d " " -f 1'
    \.' | sed -e "s/{//"'

  let l:class_list = systemlist(l:get_all_css_info)

  for line in l:class_list
    let l:file_name         = split(line, ":")[0]
    let l:line_number       = split(line, ":")[1]
    let l:class             = split(line, ":.")[2]
    let class_dict[l:class] = {"file": l:file_name, "line": l:line_number}
  endfor

  execute "edit +"
    \. class_dict[l:current_word]["line"]
    \. " "
    \. class_dict[l:current_word]["file"]
endfunction

command! CssJump call CssJump()
