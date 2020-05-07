syn match rubyEnd /\v^\s*end\s*$/
syn match rubyDo /\v\sdo(\s+|$)/
syn match rubyContext /\v(\s+|^)context\s/
syn match rubyIt /\v(\s+|^)it\s/
syn match rubyDescribe /\v(\s+|^)describe\s/
syn match rubyBefore /\v(\s+|^)before\s/
syn match rubyAfter /\v(\s+|^)after\s/
syn match rubyFunctionCall /\v([^[:cntrl:][:space:][:punct:][:digit:]]|_)([^[:cntrl:][:punct:][:space:]]|_)*\ze(\s?\()/

hi def link rubyEnd rubyDefine
hi def link rubyDo rubyDefine
hi def link rubyContext rubyDefine
hi def link rubyIt rubyDefine
hi def link rubyDescribe rubyDefine
hi def link rubyBefore rubyDefine
hi def link rubyAfter rubyDefine
hi def link rubyFunctionCall rubyMethodName


