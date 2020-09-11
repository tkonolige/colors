" vi:syntax=vim

" base16-vim (https://github.com/chriskempson/base16-vim)
" by Chris Kempson (http://chriskempson.com)
" io scheme by etidev

" Copyright (C) 2012 [Chris Kempson](http://chriskempson.com)
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

" GUI color definitions
let s:guifg        = "ffffff"
let g:base16_guifg = "ffffff"
let s:guibg        = "051519"
let g:base16_guibg = "051519"
let s:guiblack        = "051519"
let g:base16_guiblack = "051519"
let s:guired        = "f8818e"
let g:base16_guired = "f8818e"
let s:guigreen        = "84969a"
let g:base16_guigreen = "84969a"
let s:guiyellow        = "97a6aa"
let g:base16_guiyellow = "97a6aa"
let s:guiblue        = "5e6f73"
let g:base16_guiblue = "5e6f73"
let s:guimagenta        = "677a7e"
let g:base16_guimagenta = "677a7e"
let s:guicyan        = "7b8e93"
let g:base16_guicyan = "7b8e93"
let s:guiwhite        = "b3bec1"
let g:base16_guiwhite = "b3bec1"
let s:guiblackb        = "323b3e"
let g:base16_guiblackb = "323b3e"
let s:guiredb        = "fb3d66"
let g:base16_guiredb = "fb3d66"
let s:guigreenb        = "22292a"
let g:base16_guigreenb = "22292a"
let s:guiyellowb        = "3e494c"
let g:base16_guiyellowb = "3e494c"
let s:guiblueb        = "a2b0b3"
let g:base16_guiblueb = "a2b0b3"
let s:guimagentab        = "e0e5e6"
let g:base16_guimagentab = "e0e5e6"
let s:guicyanb        = "556468"
let g:base16_guicyanb = "556468"
let s:guiwhiteb        = "f7f8f8"
let g:base16_guiwhiteb = "f7f8f8"

" Theme setup
hi clear
syntax reset
let g:colors_name = "base16-io"

" Highlighting function
" Optional variables are attributes and guisp
function! g:Base16hi(group, guifg, guibg, ctermfg, ctermbg, ...)
  let l:attr = get(a:, 1, "")
  let l:guisp = get(a:, 2, "")

  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if l:attr != ""
    exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
  if l:guisp != ""
    exec "hi " . a:group . " guisp=#" . l:guisp
  endif
endfunction


fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  call g:Base16hi(a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:attr, a:guisp)
endfun

" Vim editor colors
call <sid>hi("Normal",        s:guifg, "", "", "", "", "")
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("Debug",         s:guiyellow, "", "", "", "", "")
call <sid>hi("Directory",     s:guimagentab, "", "", "", "", "")
call <sid>hi("Error",         s:guiredb, s:guiblackb, "", "", "", "")
call <sid>hi("ErrorMsg",      s:guiredb, s:guiblack, "", "", "", "")
call <sid>hi("Exception",     s:guiyellowb, "", "", "", "", "")
call <sid>hi("FoldColumn",    s:guiblueb, s:guired, "", "", "", "")
call <sid>hi("Folded",        s:guiyellow, s:guired, "", "", "", "")
call <sid>hi("IncSearch",     s:guired, s:guiredb, "", "", "none", "")
call <sid>hi("Italic",        "", "", "", "", "none", "")
call <sid>hi("Macro",         s:guired, "", "", "", "", "")
call <sid>hi("MatchParen",    "", s:guiyellow, "", "",  "", "")
call <sid>hi("ModeMsg",       s:guiyellowb, "", "", "", "", "")
call <sid>hi("MoreMsg",       s:guiyellowb, "", "", "", "", "")
call <sid>hi("Question",      s:guimagentab, "", "", "", "", "")
call <sid>hi("Search",        s:guired, "", "", "",  "", "")
call <sid>hi("Substitute",    s:guired, "", "", "", "none", "")
call <sid>hi("SpecialKey",    s:guiyellow, "", "", "", "", "")
call <sid>hi("TooLong",       s:guiblackb, "", "", "", "", "")
call <sid>hi("Underlined",    s:guiblackb, "", "", "", "", "")
call <sid>hi("Visual",        "", s:guiblack, "", "", "", "")
call <sid>hi("VisualNOS",     s:guiblackb, "", "", "", "", "")
call <sid>hi("WarningMsg",    s:guiblackb, "", "", "", "", "")
call <sid>hi("WildMenu",      s:guiblackb, s:guiblackb, "", "", "", "")
call <sid>hi("Title",         s:guimagentab, "", "", "", "none", "")
call <sid>hi("Conceal",       s:guimagentab, s:guiblack, "", "", "", "")
call <sid>hi("Cursor",        s:guiblack, s:guiwhite, "", "", "", "")
call <sid>hi("NonText",       s:guiyellow, "", "", "", "", "")
call <sid>hi("LineNr",        s:guiyellow, "", "", "", "", "")
call <sid>hi("SignColumn",    s:guiyellow, "", "", "", "", "")
call <sid>hi("StatusLine",    s:guifg, s:guiblackb, "", "", "none", "")
call <sid>hi("StatusLineNC",  s:guiyellow, s:guiblackb, "", "", "none", "")
call <sid>hi("VertSplit",     s:guigreen, s:guiblackb, "", "", "none", "")
call <sid>hi("ColorColumn",   "", s:guiblack, "", "", "none", "")
call <sid>hi("CursorColumn",  "", s:guiblack, "", "", "none", "")
call <sid>hi("CursorLine",    "", s:guiblack, "", "", "none", "")
call <sid>hi("CursorLineNr",  s:guiblue, s:guired, "", "", "", "")
call <sid>hi("QuickFixLine",  "", s:guired, "", "", "none", "")
call <sid>hi("PMenu",         s:guimagenta, s:guired, "", "", "none", "")
call <sid>hi("PMenuSel",      s:guired, s:guimagenta, "", "", "", "")
call <sid>hi("TabLine",       s:guiyellow, s:guired, "", "", "none", "")
call <sid>hi("TabLineFill",   s:guiyellow, s:guired, "", "", "none", "")
call <sid>hi("TabLineSel",    s:guiyellowb, s:guired, "", "", "none", "")

" Floating window
call <sid>hi("NormalFloat", s:guifg, s:guibg, "", "", "", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:guiyellowb, "", "", "", "", "")
call <sid>hi("Character",    s:guigreen, "", "", "", "", "")
call <sid>hi("Comment",      s:guiblackb, "", "", "", "", "")
call <sid>hi("Conditional",  s:guicyanb, "", "", "", "", "")
call <sid>hi("Constant",     s:guicyanb, "", "", "", "", "")
call <sid>hi("Define",       s:guimagenta, "", "", "", "none", "")
call <sid>hi("Delimiter",    s:guiwhiteb, "", "", "", "", "")
call <sid>hi("Float",        s:guiyellowb, "", "", "", "", "")
call <sid>hi("Function",     s:guimagenta, "", "", "", "", "")
call <sid>hi("Identifier",   s:guired, "", "", "", "none", "")
call <sid>hi("Include",      s:guiyellow, "", "", "", "", "")
call <sid>hi("Keyword",      s:guiwhiteb, "", "", "", "", "")
call <sid>hi("Label",        s:guigreenb, "", "", "", "", "")
call <sid>hi("Number",       s:guiyellowb, "", "", "", "", "")
call <sid>hi("Operator",     s:guimagenta, "", "", "", "none", "")
call <sid>hi("PreProc",      s:guiyellow, "", "", "", "", "")
call <sid>hi("Repeat",       s:guigreenb, "", "", "", "", "")
call <sid>hi("Special",      s:guimagentab, "", "", "", "", "")
call <sid>hi("SpecialChar",  s:guiwhiteb, "", "", "", "", "")
call <sid>hi("Statement",    s:guimagenta, "", "", "", "", "")
call <sid>hi("StorageClass", s:guiyellow, "", "", "", "", "")
call <sid>hi("String",       s:guigreen, "", "", "", "", "")
call <sid>hi("Structure",    s:guicyanb, "", "", "", "", "")
call <sid>hi("Tag",          s:guigreenb, "", "", "", "", "")
call <sid>hi("Todo",         s:guiyellow, "", "", "", "", "")
call <sid>hi("Type",         s:guigreen, "", "", "", "none", "")
call <sid>hi("Typedef",      s:guigreenb, "", "", "", "", "")

" C highlighting
call <sid>hi("cOperator",   s:guiblueb, "", "", "", "", "")
call <sid>hi("cPreCondit",  s:guicyanb, "", "", "", "", "")

" C# highlighting
call <sid>hi("csClass",                 s:guigreenb, "", "", "", "", "")
call <sid>hi("csAttribute",             s:guigreenb, "", "", "", "", "")
call <sid>hi("csModifier",              s:guicyanb, "", "", "", "", "")
call <sid>hi("csType",                  s:guiblackb, "", "", "", "", "")
call <sid>hi("csUnspecifiedStatement",  s:guimagentab, "", "", "", "", "")
call <sid>hi("csContextualStatement",   s:guicyanb, "", "", "", "", "")
call <sid>hi("csNewDecleration",        s:guiblackb, "", "", "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:guimagenta, "", "", "", "", "")
call <sid>hi("cssClassName",   s:guicyanb, "", "", "", "", "")
call <sid>hi("cssColor",       s:guiblueb, "", "", "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:guiyellowb, s:guired,  "", "", "", "")
call <sid>hi("DiffChange",   s:guiyellow, s:guired,  "", "", "", "")
call <sid>hi("DiffDelete",   s:guiblackb, s:guired,  "", "", "", "")
call <sid>hi("DiffText",     s:guimagentab, s:guired,  "", "", "", "")
call <sid>hi("DiffAdded",    s:guiyellowb, s:guiblack,  "", "", "", "")
call <sid>hi("DiffFile",     s:guiblackb, s:guiblack,  "", "", "", "")
call <sid>hi("DiffNewFile",  s:guiyellowb, s:guiblack,  "", "", "", "")
call <sid>hi("DiffLine",     s:guimagentab, s:guiblack,  "", "", "", "")
call <sid>hi("DiffRemoved",  s:guiblackb, s:guiblack,  "", "", "", "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:guiblackb, "", "", "", "", "")
call <sid>hi("gitcommitSummary",        s:guiyellowb, "", "", "", "", "")
call <sid>hi("gitcommitComment",        s:guiyellow, "", "", "", "", "")
call <sid>hi("gitcommitUntracked",      s:guiyellow, "", "", "", "", "")
call <sid>hi("gitcommitDiscarded",      s:guiyellow, "", "", "", "", "")
call <sid>hi("gitcommitSelected",       s:guiyellow, "", "", "", "", "")
call <sid>hi("gitcommitHeader",         s:guicyanb, "", "", "", "", "")
call <sid>hi("gitcommitSelectedType",   s:guimagentab, "", "", "", "", "")
call <sid>hi("gitcommitUnmergedType",   s:guimagentab, "", "", "", "", "")
call <sid>hi("gitcommitDiscardedType",  s:guimagentab, "", "", "", "", "")
call <sid>hi("gitcommitBranch",         s:guiredb, "", "", "", "bold", "")
call <sid>hi("gitcommitUntrackedFile",  s:guigreenb, "", "", "", "", "")
call <sid>hi("gitcommitUnmergedFile",   s:guiblackb, "", "", "", "bold", "")
call <sid>hi("gitcommitDiscardedFile",  s:guiblackb, "", "", "", "bold", "")
call <sid>hi("gitcommitSelectedFile",   s:guiyellowb, "", "", "", "bold", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:guiyellowb, s:guired, "", "", "", "")
call <sid>hi("GitGutterChange",  s:guimagentab, s:guired, "", "", "", "")
call <sid>hi("GitGutterDelete",  s:guiblackb, s:guired, "", "", "", "")
call <sid>hi("GitGutterChangeDelete",  s:guicyanb, s:guired, "", "", "", "")

" HTML highlighting
call <sid>hi("htmlBold",    s:guigreenb, "", "", "", "", "")
call <sid>hi("htmlItalic",  s:guicyanb, "", "", "", "", "")
call <sid>hi("htmlEndTag",  s:guimagenta, "", "", "", "", "")
call <sid>hi("htmlTag",     s:guimagenta, "", "", "", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:guimagenta, "", "", "", "", "")
call <sid>hi("javaScriptBraces",  s:guimagenta, "", "", "", "", "")
call <sid>hi("javaScriptNumber",  s:guiredb, "", "", "", "", "")
" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",          s:guimagentab, "", "", "", "", "")
call <sid>hi("jsStatement",         s:guicyanb, "", "", "", "", "")
call <sid>hi("jsReturn",            s:guicyanb, "", "", "", "", "")
call <sid>hi("jsThis",              s:guiblackb, "", "", "", "", "")
call <sid>hi("jsClassDefinition",   s:guigreenb, "", "", "", "", "")
call <sid>hi("jsFunction",          s:guicyanb, "", "", "", "", "")
call <sid>hi("jsFuncName",          s:guimagentab, "", "", "", "", "")
call <sid>hi("jsFuncCall",          s:guimagentab, "", "", "", "", "")
call <sid>hi("jsClassFuncName",     s:guimagentab, "", "", "", "", "")
call <sid>hi("jsClassMethodType",   s:guicyanb, "", "", "", "", "")
call <sid>hi("jsRegexpString",      s:guiblueb, "", "", "", "", "")
call <sid>hi("jsGlobalObjects",     s:guigreenb, "", "", "", "", "")
call <sid>hi("jsGlobalNodeObjects", s:guigreenb, "", "", "", "", "")
call <sid>hi("jsExceptions",        s:guigreenb, "", "", "", "", "")
call <sid>hi("jsBuiltins",          s:guigreenb, "", "", "", "", "")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:guigreenb, "", "", "", "", "")
call <sid>hi("mailQuoted2",  s:guiyellowb, "", "", "", "", "")
call <sid>hi("mailQuoted3",  s:guicyanb, "", "", "", "", "")
call <sid>hi("mailQuoted4",  s:guiblueb, "", "", "", "", "")
call <sid>hi("mailQuoted5",  s:guimagentab, "", "", "", "", "")
call <sid>hi("mailQuoted6",  s:guigreenb, "", "", "", "", "")
call <sid>hi("mailURL",      s:guimagentab, "", "", "", "", "")
call <sid>hi("mailEmail",    s:guimagentab, "", "", "", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:guiyellowb, "", "", "", "", "")
call <sid>hi("markdownError",             s:guimagenta, s:guiblack, "", "", "", "")
call <sid>hi("markdownCodeBlock",         s:guiyellowb, "", "", "", "", "")
call <sid>hi("markdownHeadingDelimiter",  s:guimagentab, "", "", "", "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:guimagentab, "", "", "", "", "")
call <sid>hi("NERDTreeExecFile",  s:guimagenta, "", "", "", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:guimagenta, "", "", "", "", "")
call <sid>hi("phpComparison",      s:guimagenta, "", "", "", "", "")
call <sid>hi("phpParent",          s:guimagenta, "", "", "", "", "")
call <sid>hi("phpMethodsVar",      s:guiblueb, "", "", "", "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:guicyanb, "", "", "", "", "")
call <sid>hi("pythonRepeat",    s:guicyanb, "", "", "", "", "")
call <sid>hi("pythonInclude",   s:guicyanb, "", "", "", "", "")
call <sid>hi("pythonStatement", s:guicyanb, "", "", "", "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:guimagentab, "", "", "", "", "")
call <sid>hi("rubyConstant",                s:guigreenb, "", "", "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:guiwhiteb, "", "", "", "", "")
call <sid>hi("rubyRegexp",                  s:guiblueb, "", "", "", "", "")
call <sid>hi("rubySymbol",                  s:guiyellowb, "", "", "", "", "")
call <sid>hi("rubyStringDelimiter",         s:guiyellowb, "", "", "", "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:guiblackb, "", "", "", "", "")
call <sid>hi("sassClassChar",  s:guiredb, "", "", "", "", "")
call <sid>hi("sassInclude",    s:guicyanb, "", "", "", "", "")
call <sid>hi("sassMixing",     s:guicyanb, "", "", "", "", "")
call <sid>hi("sassMixinName",  s:guimagentab, "", "", "", "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:guiyellowb, s:guired, "", "", "", "")
call <sid>hi("SignifySignChange",  s:guimagentab, s:guired, "", "", "", "")
call <sid>hi("SignifySignDelete",  s:guiblackb, s:guired, "", "", "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", "", "", "", "undercurl", s:guiblackb)
call <sid>hi("SpellLocal",   "", "", "", "", "undercurl", s:guiblueb)
call <sid>hi("SpellCap",     "", "", "", "", "undercurl", s:guimagentab)
call <sid>hi("SpellRare",    "", "", "", "", "undercurl", s:guicyanb)

" Startify highlighting
call <sid>hi("StartifyBracket",  s:guiyellow, "", "", "", "", "")
call <sid>hi("StartifyFile",     s:guiwhite, "", "", "", "", "")
call <sid>hi("StartifyFooter",   s:guiyellow, "", "", "", "", "")
call <sid>hi("StartifyHeader",   s:guiyellowb, "", "", "", "", "")
call <sid>hi("StartifyNumber",   s:guiredb, "", "", "", "", "")
call <sid>hi("StartifyPath",     s:guiyellow, "", "", "", "", "")
call <sid>hi("StartifySection",  s:guicyanb, "", "", "", "", "")
call <sid>hi("StartifySelect",   s:guiblueb, "", "", "", "", "")
call <sid>hi("StartifySlash",    s:guiyellow, "", "", "", "", "")
call <sid>hi("StartifySpecial",  s:guiyellow, "", "", "", "", "")

" Java highlighting
call <sid>hi("javaOperator",     s:guimagentab, "", "", "", "", "")

" Rust
call <sid>hi("rustFunction",  s:guiwhiteb, "", "", "", "", "")
call <sid>hi("rustFuncName",  s:guimagenta, "", "", "", "", "")
call <sid>hi("rustFuncCall",  s:guiwhiteb, "", "", "", "", "")

" LSP
call <sid>hi("LspDiagnosticsError",  s:guimagenta, "", "", "", "", "")
call <sid>hi("LspDiagnosticsWarning",  s:guired, "", "", "", "", "")
call <sid>hi("LspDiagnosticsInformation",  s:guiyellow, "", "", "", "", "")

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:guiblack s:guired s:guigreen s:guiyellow  s:guiblue  s:guimagenta  s:guicyan  s:guiwhite  s:guiblackb  s:guiredb s:guigreenb  s:guiyellowb  s:guiblueb  s:guimagentab  s:guicyanb  s:guiwhiteb

