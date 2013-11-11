"Vim syntax file
"
" Language   : Axiom
" Maintainer : Fabio Stumbo <f.stumbo@unife.it>
" File type  : *.input (see :help filetype)
" Usage      : See the README file
"
" History
"  20131109 fabio   1.0 Added support for pamphlet files and made some
"			cleaning
"  20051116 fabio   0.9 Made some improvements
"  20040107 fabio   0.1 Creation 
"
" Comments, suggestions and remarks are welcome.
"
" The latest version of this file will always be available at
" http://www.vim.org

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
"if version < 600
"  syntax clear
"elseif exists("b:current_syntax")
"  finish
"endif

" builtin categories, domains, packages and operations
" choose which words you want to be highlighted
"source $HOME/.vim/syntax/axiom/categories.vim  
source $HOME/.vim/syntax/axiom/domains.vim
"source $HOME/.vim/syntax/axiom/packages.vim
source $HOME/.vim/syntax/axiom/operations.vim


if version < 600
  set iskeyword=48-57,_,a-z,A-Z,-,&,!,?
else
  setlocal iskeyword=48-57,_,a-z,A-Z,-,&,!,?
endif


" parenthesis/curly/brace sanity checker
syn region axZone	matchgroup=Delimiter start="(" end=")" transparent contains=ALLBUT,axError,axErrorBrace,axErrorCurly
syn region axZone	matchgroup=Delimiter start="{" end="}" transparent contains=ALLBUT,axError,axErrorBrace,axErrorParen
syn region axZone	matchgroup=Delimiter start="\[" end="]" transparent contains=ALLBUT,axError,axErrorCurly,axErrorParen
syn match axErrorBrace	"[)}]"	contained
syn match axErrorCurly	"[)\]]"	contained
syn match axErrorParen	"[\]}]"	contained
syn match axError	"[)\]}]"
syn region axZone	matchgroup=Delimiter start="("  end=")" transparent contains=ALLBUT,axError,axErrorBrace,axErrorCurly
syn region axZone	matchgroup=Delimiter start="{"  end="}" transparent contains=ALLBUT,axError,axErrorBrace,axErrorParen
syn region axZone	matchgroup=Delimiter start="\[" end="]" transparent contains=ALLBUT,axError,axErrorCurly,axErrorParen
syn match axError		"[)\]}]"
syn match axComma		"[,;:]"
syn match axErrorBrace	"[)}]"	contained
syn match axErrorCurly	"[)\]]"	contained
syn match axErrorParen	"[\]}]"	contained
syn match axErrorSemi	"[;]"	contained

" Builtin constants 
syn match axMacro "%e"
syn match axMacro "%i"
syn match axMacro "%infinity"
syn match axMacro "%minusInfinity"
syn match axMacro "%pi"
syn match axMacro "%plusInfinity"
syn match axMacro "SF"

" Statements
syn keyword axCond	for while if 
syn keyword axCondCtrl 	then elif else elseif repeat by in
syn match   axRange 	"\.\."
syn keyword axExit	iterate break return error 
syn match   axExit 	"=>"
syn keyword axOutput	print 
syn keyword axOutput	output 
syn match   axAssign	":"  
syn match   axAssign	":="  
syn match   axDefProc	"->"  
syn match   axDefProc	"+->"  
syn match   axDefProc	"==" 
syn match   axDefProc	"==>" 

" Comments and tools.
syn region axComment	start="++" end="$" 	oneline
syn region axComment	start="--" end="$" 	oneline
syn region axString	start=+"+  end=+"+	oneline

" Definition of colors
" It would be better to use standard highlight groups... 
" so maybe this section will change/disappear in the future...
" Meanwhile, redefine them to your taste
" IMO, these colors are nice with a black bg. If you need to change the
" bg color, just add "ctermbg=x" to every line, where x is the number
" of the color: 
" 0=black, 1=red, 2=green, 3=yellow, 4=blue, 5=magenta, 6=cyan, 7=white
hi lightblack 		ctermfg=0 cterm=bold term=bold guifg=black
hi lightred 		ctermfg=1 cterm=bold term=bold guifg=lightred 
hi lightgreen 		ctermfg=2 cterm=bold term=bold guifg=lightgreen
hi lightyellow 		ctermfg=3 cterm=bold term=bold guifg=lightyellow 
hi lightblue 		ctermfg=4 cterm=bold term=bold guifg=lightblue
hi lightmagenta 	ctermfg=5 cterm=bold term=bold guifg=lightmagenta 
hi lightcyan 		ctermfg=6 cterm=bold term=bold guifg=lightcyan 
hi lightwhite 		ctermfg=7 cterm=bold term=bold guifg=white 
hi black		ctermfg=0 guifg=black
hi red 			ctermfg=1 guifg=red 
hi green 		ctermfg=2 guifg=green
hi yellow 		ctermfg=3 guifg=yellow 
hi blue 		ctermfg=4 guifg=blue
hi magenta		ctermfg=5 guifg=magenta 
hi cyan 		ctermfg=6 guifg=cyan 
hi white 		ctermfg=7 guifg=white 
hi magentainv 		ctermbg=5 ctermfg=0 guibg=magenta guifg=black
hi redinv 		ctermbg=1 ctermfg=7 guibg=red guifg=white
hi yellowinv 		ctermbg=3 ctermfg=7 cterm=bold term=bold guibg=yellow guifg=white

" Define the default highlighting (type :highlight to see available classes).
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet

if version >= 508 || !exists("did_axiom_syntax_inits")
  if version < 508
    let did_axiom_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

" Choose here your favourite colors for the respective fields

	HiLink	axAssign	magenta
	HiLink	axChunk 	magentainv
	HiLink	axComma 	lightred
	HiLink	axComment	cyan
	HiLink	axCond		lightgreen
	HiLink	axCondCtrl	green
	HiLink	axDefProc	magenta
	HiLink	axError		redinv
	HiLink	axErrorBrace	redinv
	HiLink	axErrorCurly	redinv
	HiLink	axErrorParen	redinv
	HiLink	axErrorSemi	redinv
	HiLink	axExit 		yellowinv
	HiLink	axMacro		yellow
	HiLink	axOutput	lightblue
	HiLink	axRange 	green
	HiLink	axString	blue

	HiLink	axCategory	yellow
	HiLink	axDomain	yellow
	HiLink	axOperation	yellow
	HiLink	axPackage	yellow
delcommand HiLink
endif

let b:current_syntax = "axiom"

