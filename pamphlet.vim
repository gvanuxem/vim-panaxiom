unlet b:current_syntax

syntax include @TeX syntax/tex.vim
syntax include @Axiom syntax/axiom.vim

syntax region axiomCode matchgroup=axChunk start="\\begin{chunk}" end="\\end{chunk}" containedin=@TeX contains=@Axiom

let b:current_syntax = 'pamphlet'
