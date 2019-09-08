" Hex colour conversion functions borrowed from the theme "Desert256""

" Default GUI Colours
let s:foreground = "e2e2c8"
let s:background = "262626"
let s:menu_background = "3f3f3f"
let s:line = "1e1e1e"
let s:selection = "3f3f3f"
let s:comment = "888888"
let s:red = "cf6a4c"
let s:orange = "ffaf5f"
let s:yellow = "fad07a"
let s:green = "99ad6a"
let s:aqua = "6796e6"
let s:blue = "8197bf"
let s:purple = "b267e6"
let s:window = "151515"

set background=dark
hi clear
syntax reset

let g:colors_name = "dnonov-dark"

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

	" Vim Highlighting
	call <SID>X("Normal", s:foreground, s:background, "")
	call <SID>X("NonText", s:selection, "", "")
	call <SID>X("SpecialKey", s:selection, "", "")
	call <SID>X("Search", s:foreground, s:selection, "")
	call <SID>X("TabLine", s:foreground, s:background, "reverse")
	call <SID>X("StatusLine", s:window, s:yellow, "reverse")
	call <SID>X("StatusLineNC", s:window, s:foreground, "reverse")
	call <SID>X("VertSplit", s:window, s:window, "none")
	call <SID>X("Visual", "", s:selection, "")
	call <SID>X("Directory", s:blue, "", "")
	call <SID>X("ModeMsg", s:green, "", "")
	call <SID>X("MoreMsg", s:green, "", "")
	call <SID>X("Question", s:green, "", "")
	call <SID>X("WarningMsg", s:red, "", "")
	call <SID>X("MatchParen", "", s:comment, "")
	call <SID>X("Folded", s:comment, s:background, "")
	call <SID>X("FoldColumn", "", s:background, "")
	call <SID>X("LineNr", s:comment, s:background, "")
	call <SID>X("LineNr", s:comment, s:background, "")
	call <SID>X("CursorLineNr", s:orange, s:background, "")
	if version >= 700
		call <SID>X("CursorLine", "", s:line, "none")
		call <SID>X("CursorColumn", "", s:line, "none")
		call <SID>X("PMenu", s:foreground, s:menu_background, "none")
		call <SID>X("PMenuSel", s:foreground, s:menu_background, "reverse")
		call <SID>X("PMenuSbar", s:foreground, s:menu_background, "reverse")
		call <SID>X("PMenuThumb", s:foreground, s:menu_background, "reverse")
	end
	if version >= 703
		call <SID>X("ColorColumn", "", s:line, "none")
	end

	" Standard Highlighting
	call <SID>X("Comment", s:comment, "", "")
	call <SID>X("Todo", s:comment, s:background, "")
	call <SID>X("Title", s:comment, "", "")
	call <SID>X("Identifier", s:foreground, "", "none")
	call <SID>X("Statement", s:foreground, "", "")
	call <SID>X("Conditional", s:foreground, "", "")
	call <SID>X("Repeat", s:foreground, "", "")
	call <SID>X("Structure", s:purple, "", "")
	call <SID>X("Function", s:yellow, "", "")
	call <SID>X("Constant", s:aqua, "", "")
	call <SID>X("Number", s:red, "", "")
	call <SID>X("String", s:green, "", "")
	call <SID>X("Special", s:foreground, "", "")
	call <SID>X("PreProc", s:blue, "", "")
	call <SID>X("Operator", s:blue, "", "none")
	call <SID>X("Type", s:yellow, "", "none")
	call <SID>X("Define", s:purple, "", "none")
	call <SID>X("Include", s:blue, "", "")
	call <SID>X("SpellBad", "", s:background, "underline")
	call <SID>X("SpellCap", "", s:background, "underline")
	call <SID>X("SpellRare", "", s:background, "underline")
	call <SID>X("SpellLocal", "", s:background, "underline")
	call <SID>X("Keyword", s:blue, "", "none")

	"NERDTree
	call <SID>X("NERDTreeDirSlash",s:blue, "", "")
	call <SID>X("NERDTreeExecFile",s:yellow, "", "")

	" Fix jsx bug (different color on closing tag)
	hi link xmlEndTag xmlTag

	" Vim Highlighting
	call <SID>X("vimCommand", s:blue, "", "none")

	" Python Highlighting
	call <SID>X("pythonInclude", s:blue, "", "")
	call <SID>X("pythonStatement", s:blue, "", "")
	call <SID>X("pythonConditional", s:blue, "", "")
	call <SID>X("pythonSelf", s:blue, "", "")
	call <SID>X("pythonException", s:blue, "", "")
	call <SID>X("pythonFunction", s:yellow, "", "")
	call <SID>X("pythonFunctionCall", s:yellow, "", "")
	call <SID>X("pythonStrFormat", s:green, "", "")
	call <SID>X("pythonClass", s:orange, "", "")
	call <SID>X("pythonBuiltinType", s:orange, "", "")
	call <SID>X("pythonBuiltinObj", s:blue, "", "")
	call <SID>X("pythonRepeat", s:blue, "", "")

	" JavaScript Highlighting
	call <SID>X("jsFunction", s:blue, "", "")
	call <SID>X("jsConditional", s:blue, "", "")
	call <SID>X("jsStatement", s:blue, "", "")
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
	call <SID>X("jsArrowFunction", s:blue, "", "")
	call <SID>X("jsClassDefinition", s:orange, "", "")
	call <SID>X("jsGlobalObjects", s:orange, "", "")
	call <SID>X("jsGlobalNodeObjects", s:orange, "", "")
	call <SID>X("jsExportDefault", s:blue, "", "")
	call <SID>X("jsTemplateBraces", s:green, "", "")

	" HTML Highlighting
	call <SID>X("htmlTag", s:comment, "", "")
	call <SID>X("htmlEndTag", s:comment, "", "")
	call <SID>X("htmlTagName", s:orange, "", "")
	call <SID>X("htmlArg", s:blue, "", "")
	call <SID>X("htmlScriptTag", s:red, "", "")

	" XML Highlighting
	call <SID>X("xmlTag", s:comment, "", "")
	call <SID>X("xmlTagName", s:orange, "", "")
	call <SID>X("xmlAttrib", s:blue, "", "")
	call <SID>X("xmlEndTag", s:comment, "", "")

  " Vim Highlighting
  call <SID>X("vimFunction", s:yellow, "", "")
  call <SID>X("vimUserFunc", s:yellow, "", "")
  call <SID>X("vimNotation", s:yellow, "", "")
  call <SID>X("vimFuncSID", s:yellow, "", "")

  " Diff Highlighting
	call <SID>X("diffAdded", s:green, "", "")
	call <SID>X("diffRemoved", s:red, "", "")

  " GitGutter
	call <SID>X("GitGutterAdd", s:green, "", "")
	call <SID>X("GitGutterChange", s:aqua, "", "")
	call <SID>X("GitGutterDelete", s:red, "", "")

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
