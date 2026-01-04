if exists("b:current_syntax")
    finish
endif

syn keyword ditherKeyword func embed
syn keyword ditherKeyword def const static pub

syn keyword ditherType bool char rchar byte void string ptrdiff untyped typed
syn keyword ditherType i8 i16 i32 i64 u8 u16 u32 u64 isize usize size
syn keyword ditherType int uint long ulong
syn keyword ditherType float f32 f64
syn keyword ditherType str list vec dict tup arr geom guts io math exch
syn keyword ditherType drw frag time rand snd rdr req win vin img font

syn keyword ditherSelf self this
syn keyword ditherLabel default ref as
syn keyword ditherOperator and or is mod
syn keyword ditherConstant true false null
syn keyword ditherSComment assert println print
syn match   ditherNew      '\v<(new|[m]?alloc|create)>'
syn match   ditherFree     '\v<(free)>'

syn keyword ditherRepeat while loop for in to
syn keyword ditherStatement break continue return defer
syn keyword ditherConditional if else elif switch case
syn keyword ditherInclude export include extern when foreign opaque

syn keyword ditherException throw try catch cast unsafe raw
syn keyword ditherPanic panic enforce

syn match ditherTitle      '[@!?]'
syn match ditherSymbol     '[,;:\.]'
syn match ditherOperator   '[\+\-\%=\/\^\&\*><\$|~]'
syn match ditherConstant   '[{}\[\]()]'
syn match ditherType       '\v\(@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\)' " (type*)
syn match ditherType       '\v\[@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\]' " [type*]
syn match ditherType       '\v<\w+_[tscemui]>'
syn match ditherMacro      '\v<[_]*\u[A-Z0-9_]*>'
syn match ditherType       '\v<[_]*\u[A-Z0-9_]*[a-z]+\w*>'
syn match ditherType       '\v\.?\zs<([iu][0-9]{1,3})?>'
syn match ditherRepeat     '\v([^\.](\.|\.{3}|::|-\>))@<=\w\w*'
syn match ditherType       '\v<\w+>\ze(::|\<(\w+\s*(\<.*\>|\[.*\])?\s*[,]?\s*)*\>)' "foo<T>()
syn match ditherFunc       '\v[_]*\l\w*\ze((\[.*\])|((::)?\<.*\>))*\s*\('

syn match ditherException  '\v(\W@<=[~&!*]+\ze[\(\[\{\<]*[-]?\w)|(\w@<=[*!?]+\ze\W)'
syn match ditherStruct     '\v((typedef|struct|enum|union|namespace)(\[.*\])?\s*)@<=[_]*\w+\ze(\[.*\])?\s*(\(|\{)'

syn match ditherInclude    '\v^\s*include .*'
syn match ditherMacro      '\v^\s*\[.{-}\]'
syn match ditherAdded      '\v^\s*<(test)\ze\s*\{'
syn match ditherLabel      '\v<\@(\w+)>'

" -- shader
"syn match ditherKeyword    '\v<(uniform|instance|varying|var|vertex|fragment|in|out)>\s'
"syn match ditherType       '\v<(texture|texture2D)>\s'
syn match ditherType       '\v<bool[234]?>'
syn match ditherType       '\v<int[234]?>'
syn match ditherType       '\v<uint[234]?>'
syn match ditherType       '\v<half[234]?>'
syn match ditherType       '\v<float([234](x[234])?)?>'
syn match ditherType       '\v<[dbui]?vec[234]>'
syn match ditherType       '\v<vec[234][dbfhui]?>'
syn match ditherType       '\v<mat[234](x[234]f)?>'
"syn match ditherType       '\v<(vec|mat|list|dict|tup)\ze\['


"hi def ditherSymbol ctermfg=DarkGray guifg=DarkGray
hi def link ditherSMacro   SpecialComment
hi def link ditherNew      Added
hi def link ditherFree     Exception
hi def link ditherTitle    Title
hi def link ditherAdded    Added
hi def link ditherStruct   Changed
hi def link ditherConstant Constant
hi def link ditherSymbol   Changed
hi def link ditherMacro    Macro
hi def link ditherSComment SpecialComment
hi def link ditherFunc     Function
hi def link ditherTypedef  Changed
"hi def ditherType ctermfg=DarkCyan guifg=DarkCyan
hi def link ditherType     MoreMsg
"hi def link ditherType SpecialComment
"hi def ditherSelf ctermfg=DarkMagenta guifg=DarkMagenta
hi def link ditherSelf     Label
hi def link ditherModeMsg  ModeMsg

syn match  ditherSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  ditherSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn match  ditherCharacter        "'[^']*'" contains=ditherSpecialChar,ditherSpecialCharError
syn match  ditherCharacter        "'\\''" contains=ditherSpecialChar
syn match  ditherCharacter        "'[^\\]'"

"syn region    ditherString      matchgroup=ditherString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=ditherEscape,@Spell
syn region    ditherString      matchgroup=ditherString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
"syn region    ditherString      matchgroup=ditherString start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=@Spell

syn match ditherNumber "\v<0[xX][0-9a-fA-F_]+([iuIU]?[lL]?[0-9]{-,3})?>"
syn match ditherNumber "\v<0[bB][01_]+([iuIU]?[lL]?[0-9]{-,3})?>"

syn match ditherFloat  '\v<\.\d+([eE][+-]?\d+)?[fFdD]?>' display
syn match ditherFloat  '\v<([0][1-9]*)([eE][+-]?\d+)?[fFdD]?>' display
syn match ditherFloat  '\v<0x\x+(\.\x+)?[pP][+-]?\d+[fFdD]?>' display

" Integer literals
syn match ditherInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match ditherInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match ditherInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match ditherInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iuIU]?[lL]?[0-9]{-,3})?>' display

syn match ditherFloat   display "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
syn match ditherFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match ditherFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match ditherFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" Escape sequences
syn match ditherEscape '\\[\\'"0abfnrtv]' contained display
syn match ditherEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match ditherFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=ditherEscape display
syn match ditherFormat '{{\|}}' contained display


hi def link ditherPreProc               PreProc
hi def link ditherSuper                 Title
hi def link ditherFloat                 Constant
hi def link ditherInteger               Number
hi def link ditherEscape                SpecialComment
hi def link ditherFormat                SpecialChar

hi def link ditherKeyword               Keyword
hi def link ditherInclude               Include
hi def link ditherLabel                 Label
hi def link ditherConditional           Conditional
hi def link ditherRepeat                Repeat
hi def link ditherStatement             Statement
"hi def link ditherType                  Type
hi def link ditherNumber                Number
hi def link ditherComment               Comment
hi def link ditherOperator              Operator
hi def link ditherCharacter             Character
hi def link ditherString                String
hi def link ditherTodo                  Todo
hi def link ditherSpecial               Special
hi def link ditherSpecialError          Error
hi def link ditherSpecialCharError      Error
hi def link ditherString                String
hi def link ditherCharacter             Character
hi def link ditherSpecialChar           SpecialChar
hi def link ditherException             Exception
hi def link ditherPanic                 Exception

syn match   ditherTypedef  contains=ditherTypedef "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match   ditherFunc     "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn keyword ditherKeyword union enum typedef namespace nextgroup=ditherTypedef skipwhite skipempty
syn keyword ditherKeyword union nextgroup=ditherType skipwhite skipempty contained
syn keyword ditherMacro platform macro nextgroup=ditherTypedef skipwhite skipempty
" adapted from neovim runtime/syntax
syn keyword ditherTodo contained TODO FIXME XXX NOTE
syn region  ditherComment  start="/\*" end="\*/" contains=ditherTodo,@Spell
syn match   ditherComment  "//.*$" contains=ditherTodo,@Spell
syn match   ditherPreProc  '\#.*$'

let b:current_syntax = "dither"
