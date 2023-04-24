" Default GUI Colours
let s:foreground = "bbc2cf"
let s:background = "252525"
let s:selection  = "353535"
let s:line       = "151515"
let s:comment    = "888888"
let s:red        = "cf6a4c"
let s:orange     = "fad07a"
let s:yellow     = "fabb6e"
let s:green      = "99AD6A"
let s:aqua       = "9CDCFE"
let s:blue       = "8197bf"
let s:purple     = "D884FF"
let s:window     = "151515"

set background=dark
hi clear
syntax reset

let g:colors_name = "night-city"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
	" Returns an approximate grey index for the given grey level
	fun <SID>grey_number(x)
		if &t_Co == 88
			if a:x < 23
				return 0
			elseif a:x < 69
				return 1
			elseif a:x < 103
				return 2
			elseif a:x < 127
				return 3
			elseif a:x < 150
				return 4
			elseif a:x < 173
				return 5
			elseif a:x < 196
				return 6
			elseif a:x < 219
				return 7
			elseif a:x < 243
				return 8
			else
				return 9
			endif
		else
			if a:x < 14
				return 0
			else
				let l:n = (a:x - 8) / 10
				let l:m = (a:x - 8) % 10
				if l:m < 5
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual grey level represented by the grey index
	fun <SID>grey_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 46
			elseif a:n == 2
				return 92
			elseif a:n == 3
				return 115
			elseif a:n == 4
				return 139
			elseif a:n == 5
				return 162
			elseif a:n == 6
				return 185
			elseif a:n == 7
				return 208
			elseif a:n == 8
				return 231
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 8 + (a:n * 10)
			endif
		endif
	endfun

	" Returns the palette index for the given grey index
	fun <SID>grey_colour(n)
		if &t_Co == 88
			if a:n == 0
				return 16
			elseif a:n == 9
				return 79
			else
				return 79 + a:n
			endif
		else
			if a:n == 0
				return 16
			elseif a:n == 25
				return 231
			else
				return 231 + a:n
			endif
		endif
	endfun

	" Returns an approximate colour index for the given colour level
	fun <SID>rgb_number(x)
		if &t_Co == 88
			if a:x < 69
				return 0
			elseif a:x < 172
				return 1
			elseif a:x < 230
				return 2
			else
				return 3
			endif
		else
			if a:x < 75
				return 0
			else
				let l:n = (a:x - 55) / 40
				let l:m = (a:x - 55) % 40
				if l:m < 20
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual colour level for the given colour index
	fun <SID>rgb_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 139
			elseif a:n == 2
				return 205
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 55 + (a:n * 40)
			endif
		endif
	endfun

	" Returns the palette index for the given R/G/B colour indices
	fun <SID>rgb_colour(x, y, z)
		if &t_Co == 88
			return 16 + (a:x * 16) + (a:y * 4) + a:z
		else
			return 16 + (a:x * 36) + (a:y * 6) + a:z
		endif
	endfun

	" Returns the palette index to approximate the given R/G/B colour levels
	fun <SID>colour(r, g, b)
		" Get the closest grey
		let l:gx = <SID>grey_number(a:r)
		let l:gy = <SID>grey_number(a:g)
		let l:gz = <SID>grey_number(a:b)

		" Get the closest colour
		let l:x = <SID>rgb_number(a:r)
		let l:y = <SID>rgb_number(a:g)
		let l:z = <SID>rgb_number(a:b)

		if l:gx == l:gy && l:gy == l:gz
			" There are two possibilities
			let l:dgr = <SID>grey_level(l:gx) - a:r
			let l:dgg = <SID>grey_level(l:gy) - a:g
			let l:dgb = <SID>grey_level(l:gz) - a:b
			let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
			let l:dr = <SID>rgb_level(l:gx) - a:r
			let l:dg = <SID>rgb_level(l:gy) - a:g
			let l:db = <SID>rgb_level(l:gz) - a:b
			let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
			if l:dgrey < l:drgb
				" Use the grey
				return <SID>grey_colour(l:gx)
			else
				" Use the colour
				return <SID>rgb_colour(l:x, l:y, l:z)
			endif
		else
			" Only one possibility
			return <SID>rgb_colour(l:x, l:y, l:z)
		endif
	endfun

	" Returns the palette index to approximate the 'rrggbb' hex string
	fun <SID>rgb(rgb)
		let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
		let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
		let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

		return <SID>colour(l:r, l:g, l:b)
	endfun

	" Sets the highlighting for the given group
	fun <SID>X(group, fg, bg, attr)
		if a:fg != ""
			exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
		endif
		if a:bg != ""
			exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
		endif
		if a:attr != ""
			exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
		endif
	endfun

	" Vim Highlight
	call <SID>X("Normal", s:foreground, s:background, "")
	call <SID>X("NonText", s:selection, "", "")
	call <SID>X("SpecialKey", s:selection, "", "")
	call <SID>X("Search", s:foreground, s:selection, "")
	call <SID>X("TabLine", s:foreground, s:background, "reverse")
	call <SID>X("StatusLine", s:window, s:blue, "reverse")
	call <SID>X("StatusLineNC", s:window, s:foreground, "reverse")
	call <SID>X("VertSplit", s:foreground, s:background, "none")
	call <SID>X("Visual", "", s:selection, "")
	call <SID>X("Directory", s:blue, "", "")
	call <SID>X("ModeMsg", s:green, "", "")
	call <SID>X("MoreMsg", s:green, "", "")
	call <SID>X("Question", s:green, "", "")
	call <SID>X("WarningMsg", s:red, "", "")
	call <SID>X("MatchParen", "", s:selection, "")
	call <SID>X("Folded", s:comment, s:background, "")
	call <SID>X("FoldColumn", "", s:background, "")
  call <SID>X("PMenu", s:foreground, s:selection, "none")
  call <SID>X("CursorLine", "", s:selection, "none")
  call <SID>X("ColorColumn", "", s:selection, "none")
  call <SID>X("LineNr", s:comment, s:background, "none")
  call <SID>X("SignColumn", s:comment, s:background, "none")
  call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")

	call <SID>X("Comment", s:comment, "", "")
	call <SID>X("Todo", s:comment, s:background, "italic")
	call <SID>X("Title", s:comment, "", "")
	call <SID>X("Identifier", s:foreground, "", "none")
	call <SID>X("Statement", s:foreground, "", "")
	call <SID>X("Conditional", s:foreground, "", "")
	call <SID>X("Repeat", s:foreground, "", "")
	call <SID>X("Structure", s:orange, "", "")
	call <SID>X("Function", s:orange, "", "")
	call <SID>X("Constant", s:blue, "", "")
	call <SID>X("Number", s:red, "", "")
	call <SID>X("String", s:green, "", "")
	call <SID>X("Special", s:foreground, "", "")
	call <SID>X("PreProc", s:blue, "", "")
	call <SID>X("Operator", s:foreground, "", "")
	call <SID>X("Type", s:yellow, "", "none")
	call <SID>X("Define", s:foreground, "", "none")
	call <SID>X("Include", s:blue, "", "")
	call <SID>X("SpellBad", "", s:background, "underline")
	call <SID>X("SpellCap", "", s:background, "underline")
	call <SID>X("SpellRare", "", s:background, "underline")
	call <SID>X("SpellLocal", "", s:background, "underline")
	call <SID>X("Keyword", s:blue, "", "")

  " YCM remove annoying error colors from the text
  call <SID>X("YcmErrorSection", s:foreground, "", "")

  " YCM remove annoying error colors from the text
	call <SID>X("ALEError",s:background, s:red, "")

  "NERDTree slashes in nice blue color
	call <SID>X("NERDTreeDirSlash",s:blue, "", "")

	" Fix jsx bug (different color on closing tag)
  "hi link xmlEndTag xmlTag

	" Python Highlight
	call <SID>X("pythonInclude", s:blue, "", "")
	call <SID>X("pythonLambdaExpr", s:blue, "", "")
	call <SID>X("pythonStatement", s:blue, "", "")
	call <SID>X("pythonConditional", s:blue, "", "")
	call <SID>X("pythonSelf", s:blue, "", "")
	call <SID>X("pythonClassVar", s:blue, "", "")
	call <SID>X("pythonFunction", s:orange, "", "")
	call <SID>X("pythonFunctionCall", s:orange, "", "")
	call <SID>X("pythonStrFormat", s:red, "", "")
	call <SID>X("pythonExtraOperator", s:foreground, "", "")
	call <SID>X("pythonOperator", s:blue, "", "")
	call <SID>X("pythonDecorator", s:aqua, "", "")
	call <SID>X("pythonDottedName", s:aqua, "", "")
	call <SID>X("pythonClass", s:yellow, "", "")
	call <SID>X("pythonBuiltinType", s:yellow, "", "")
	call <SID>X("pythonBuiltinObj", s:blue, "", "")
	call <SID>X("pythonRepeat", s:blue, "", "")
	call <SID>X("pythonException", s:blue, "", "")

	" JavaScript Highlight
  call <SID>X("jsFunction", s:blue, "", "")
	call <SID>X("jsConditional", s:blue, "", "")
	call <SID>X("jsUndefined", s:blue, "", "")
	call <SID>X("jsStatement", s:blue, "", "")
	call <SID>X("jsOperatorKeyword", s:blue, "", "")
	call <SID>X("jsLabel", s:blue, "", "")
	call <SID>X("jsSuper", s:blue, "", "")
	call <SID>X("jsReturn", s:blue, "", "")
	call <SID>X("jsThis", s:blue, "", "")
	call <SID>X("jsNull", s:blue, "", "")
	call <SID>X("jsRepeat", s:blue, "", "")
  call <SID>X("jsException", s:blue, "", "")
  call <SID>X("jsExceptions", s:orange, "", "")
	call <SID>X("jsStorageClass", s:blue, "", "")
	call <SID>X("jsBooleanFalse", s:blue, "", "")
	call <SID>X("jsBooleanTrue", s:blue, "", "")
	call <SID>X("jsArrowFunction", s:foreground, "", "")
	call <SID>X("jsClassDefinition", s:yellow, "", "")
	call <SID>X("jsClassMethodType", s:blue, "", "")
	call <SID>X("jsGlobalObjects", s:yellow, "", "")
	call <SID>X("jsGlobalNodeObjects", s:orange, "", "")
	call <SID>X("jsExportDefault", s:blue, "", "")
	call <SID>X("jsTemplateBraces", s:red, "", "")
	call <SID>X("jsFlowobjectKey", s:foreground, "", "")
	call <SID>X("jsxAttrib", s:blue, "", "")
	call <SID>X("jsxTagName", s:orange, "", "")
	call <SID>X("jsxEqual", s:blue, "", "")

  " GraphQl Highlight
	call <SID>X("graphqlTemplateString", s:foreground, "", "")

  " TypeScript Highlight
	call <SID>X("typescriptClassName", s:orange, "", "")
	call <SID>X("typescriptClassStatic", s:blue, "", "")
	call <SID>X("typescriptMember", s:foreground, "", "")
	call <SID>X("typescriptBraces", s:foreground, "", "")
	call <SID>X("typescriptConditional", s:blue, "", "")
	call <SID>X("typescriptCase", s:blue, "", "")
	call <SID>X("typescriptAmbientDeclaration", s:blue, "", "")
	call <SID>X("typescriptStatementKeyword", s:blue, "", "")
	call <SID>X("typescriptExport", s:blue, "", "")
	call <SID>X("typescriptExceptions", s:blue, "", "")
	call <SID>X("typescriptTry", s:blue, "", "")
	call <SID>X("typescriptVariable", s:blue, "", "")
	call <SID>X("typescriptTypeReference", s:orange, "", "")
	call <SID>X("typescriptRepeat", s:blue, "", "")
	call <SID>X("typescriptBranch", s:blue, "", "")
	call <SID>X("typescriptAssign", s:foreground, "", "")
	call <SID>X("typescriptBinaryOp", s:foreground, "", "")
	call <SID>X("typescriptRegexpString", s:red, "", "")
	call <SID>X("typescriptImport", s:blue, "", "")
	call <SID>X("typescriptFrom", s:blue, "", "")
	call <SID>X("typescriptIdentifierName", s:orange, "", "")
	call <SID>X("typescriptIdentifier", s:blue, "", "")
	call <SID>X("typescriptCall", s:foreground, "", "")
	call <SID>X("typescriptOperator", s:blue, "", "")
	call <SID>X("typescriptRegExpMethod", s:orange, "", "")
	call <SID>X("typescriptStringMethod", s:orange, "", "")
	call <SID>X("typescriptMathStaticMethod", s:orange, "", "")
	call <SID>X("typescriptArrayMethod", s:orange, "", "")
	call <SID>X("typescriptArrowFuncArg", s:foreground, "", "")
	call <SID>X("typescriptArrowFunc", s:foreground, "", "")
	call <SID>X("typescriptES6SetMethod", s:orange, "", "")
	call <SID>X("typescriptDOMFormProp", s:orange, "", "")
	call <SID>X("typescriptDOMDocProp", s:orange, "", "")
	call <SID>X("typescriptJSONStaticMethod", s:orange, "", "")
	call <SID>X("typescriptCastKeyword", s:blue, "", "")
	call <SID>X("typescriptPromiseMethod", s:orange, "", "")
	call <SID>X("typescriptPromiseStaticMethod", s:orange, "", "")
	call <SID>X("typescriptFuncTypeArrow", s:foreground, "", "")

  " C Highlight
	call <SID>X("cRepeat", s:blue, "", "")
	call <SID>X("cUserLabel", s:blue, "", "")
	call <SID>X("cType", s:blue, "", "")
	call <SID>X("cStorageClass", s:blue, "", "")
	call <SID>X("cStatement", s:blue, "", "")
	call <SID>X("cStructure", s:blue, "", "")
	call <SID>X("cConditional", s:blue, "", "")
	call <SID>X("cLabel", s:blue, "", "")
	call <SID>X("c_operator", s:foreground, "", "")
	call <SID>X("cOperator", s:foreground, "", "")
	call <SID>X("cMulti", s:foreground, "", "")

  " Ruby Highlight
	call <SID>X("rubyClass", s:blue, "", "")
	call <SID>X("rubyModule", s:blue, "", "")
	call <SID>X("rubyDefine", s:blue, "", "")
	call <SID>X("rubySymbol", s:blue, "", "")
	call <SID>X("rubyKeywordAsMethod", s:yellow, "", "")
	call <SID>X("rubyStringDelimiter", s:red, "", "")
	call <SID>X("rubyRegexpDelimiter", s:red, "", "")
	call <SID>X("rubyConditional", s:blue, "", "")
	call <SID>X("rubyInstanceVariable", s:blue, "", "")

  " PHP Highlight
  call <SID>X("phpType", s:blue, "", "")
  call <SID>X("phpFunction", s:orange, "", "")
  call <SID>X("phpMethod", s:orange, "", "")
  call <SID>X("phpClass", s:orange, "", "")
  call <SID>X("phpStatement", s:orange, "", "")

  " Java Highlight
  call <SID>X("javaScopeDecl", s:blue, "", "")
  call <SID>X("javaClassDecl", s:blue, "", "")

  " SQl Highlight
  call <SID>X("Quote", s:red, "", "")
  call <SID>X("sqlStatement", s:blue, "", "")
  call <SID>X("sqlKeyword", s:blue, "", "")
  call <SID>X("sqlSpecial", s:blue, "", "")

  " Clojure Highlight
	call <SID>X("clojureDefine", s:blue, "", "")
	call <SID>X("clojureSpecial", s:blue, "", "")
	call <SID>X("clojureCond", s:blue, "", "")
	call <SID>X("clojureException", s:blue, "", "")
	call <SID>X("clojureKeyword", s:blue, "", "")


  " Bash Highlight
	call <SID>X("shConditional", s:blue, "", "")
	call <SID>X("shLoop", s:blue, "", "")
	call <SID>X("shDerefSimple", s:blue, "", "")
	call <SID>X("shSet", s:blue, "", "")

  " Vim Script Highlight
  call <SID>X("vimCommand", s:blue, "", "")
  call <SID>X("vimOper", s:foreground, "", "")

	" HTML Highlight
	call <SID>X("htmlTag", s:comment, "", "")
	call <SID>X("htmlEndTag", s:comment, "", "")
	call <SID>X("htmlTagName", s:orange, "", "")
	call <SID>X("htmlArg", s:blue, "", "")
	call <SID>X("htmlScriptTag", s:comment, "", "")
	call <SID>X("htmlTitle", s:foreground, "", "")
	call <SID>X("htmlH1", s:foreground, "", "")

  " CSS Highlight
	call <SID>X("cssTagName", s:blue, "", "")
	call <SID>X("cssColor", s:green, "", "")
	call <SID>X("cssBraces", s:foreground, "", "")
	call <SID>X("cssProp", s:foreground, "", "")

	" XML Highlight
	call <SID>X("xmlTag", s:comment, "", "")
	call <SID>X("xmlTagName", s:orange, "", "")
	call <SID>X("xmlAttrib", s:blue, "", "")
	call <SID>X("xmlEqual", s:aqua, "", "")
	call <SID>X("xmlEndTag", s:orange, "", "")

  " Yaml Highlight
	call <SID>X("yamlKey", s:blue, "", "")

  " Markdown Highlight
	call <SID>X("mkdHeading", s:blue, "", "")
	call <SID>X("mkdCode", s:foreground, "", "")
	call <SID>X("mkdLink", s:aqua, "", "underline")
	call <SID>X("mkdInlineURL", s:aqua, "", "underline")
	call <SID>X("htmlH1", s:blue, "", "")

  " vimwiki Highlight
	call <SID>X("VimwikiHeaderChar", s:blue, "", "")
	call <SID>X("VimwikiHeader1", s:blue, "", "")
	call <SID>X("VimwikiHeader2", s:blue, "", "")
	call <SID>X("VimwikiHeader3", s:blue, "", "")
	call <SID>X("VimwikiHeader4", s:blue, "", "")
	call <SID>X("VimwikiHeader5", s:blue, "", "")
	call <SID>X("VimwikiHeader6", s:blue, "", "")

  " Vim Highlight
  call <SID>X("vimFunction", s:orange, "", "")
  call <SID>X("vimUserFunc", s:orange, "", "")
  call <SID>X("vimNotation", s:orange, "", "")
  call <SID>X("vimFuncSID", s:orange, "", "")

  " Nginx.conf Highlight
  call <SID>X("ngxDirectiveBlock", s:blue, "", "")
  call <SID>X("ngxDirectiveImportant", s:blue, "", "")
  call <SID>X("ngxDirective", s:blue, "", "")

  " Diff Highlight
  call <SID>X("DiffAdd", s:green, s:selection, "")
  call <SID>X("DiffDelete", s:red, s:selection, "")
  call <SID>X("DiffChange", s:yellow, s:selection, "")
  call <SID>X("DiffText", s:foreground, "", "")

  call <SID>X("diffAdded", s:green, "", "")
  call <SID>X("diffRemoved", s:red, "", "")
  call <SID>X("diffChanged", s:yellow, "", "")

  " GitGutter
	call <SID>X("GitGutterAdd", s:green, "", "")
	call <SID>X("GitGutterChange", s:aqua, "", "")
	call <SID>X("GitGutterDelete", s:red, "", "")

  " Magit
	call <SID>X("fileEntry", s:orange, "", "")

  " Coc
  call <SID>X("CocWarningSign", s:orange, "", "")
  call <SID>X("CocInfoSign", s:aqua, "", "")

	" Delete Functions
	delf <SID>X
	delf <SID>rgb
	delf <SID>colour
	delf <SID>rgb_colour
	delf <SID>rgb_level
	delf <SID>rgb_number
	delf <SID>grey_colour
	delf <SID>grey_level
	delf <SID>grey_number
endif
