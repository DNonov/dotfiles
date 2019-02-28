" Disable YCM
let g:ycm_filetype_blacklist = {"cs": 1}

"Super tab settings
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

let g:ale_linters = {"cs": ["OmniSharp"]}

let g:OmniSharp_selector_ui = "fzf"

autocmd BufNewFile,BufRead *.cs  call OmniSharpHighlightTypes()
