" Vim syntax file
" Language:     Mozilla Preprocessor
" Maintainer:   Sam Hanes <sam@maltera.com>
" Last Change:  2012 01 27
"
" Remarks:      

" Backward compatibility
"
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn region      mozPreComment   start="#\(\s\|$\)" end="$" keepend contains=@Spell

syn region      mozPreCondit    start="^\s*#\(if\|ifdef\|ifndef\|elif\|elifdef\|elifndef\)\>" end="$"  keepend
syn match	mozPreCondit	display "^\s*#\(else\|endif\)\>"

syn region	mozPreDefine	start="^\s*#\(define\|undef\)\>" end="$" keepend

syn region      mozPreInclude   start="^\s*#\(include\|includesubst\)" end="$" keepend

syn region      mozPreExpand    start="^\s*#expand" end="$" keepend
syn region      mozPreFilter    start="^\s*#\(filter\|unfilter\)" end="$" keepend
syn region      mozPreLiteral   start="^\s*#literal" end="$" keepend
syn region      mozPreError     start="^\s*#error" end="$" keepend

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_mozpp_syn_inits")
  if version < 508
    let did_mozpp_syn_inits = 1
    command -nargs=+ MozPPHiLink hi link <args>
  else
    command! -nargs=+ MozPPHiLink hi def link <args>
  endif
  
  MozPPHiLink mozPreComment     Comment
  MozPPHiLink mozPreCondit      PreCondit
  MozPPHiLink mozPreDefine      Macro
  MozPPHiLink mozPreInclude     Include
  MozPPHiLink mozPreExpand      PreProc
  MozPPHiLink mozPreFilter      PreProc
  MozPPHiLink mozPreLiteral     PreProc
  MozPPHiLink mozPreError       PreProc
  
  delcommand MozPPHiLink
endif

let b:current_syntax = "mozpp"
