if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

compiler dither

" Formatting
setl formatoptions+=croql/ formatoptions-=t

" Miscellaneous settings
setl comments=://
setl commentstring=//\ %s
setl iskeyword+=@-@
setl suffixesadd=.dh

let b:undo_ftplugin = 'setl cms< com< fo< isk< sua<'

" Follow the dither style guide by default.
if get(g:, 'dither_recommended_style', 1)
  setl expandtab
  setl shiftwidth=2
  setl softtabstop=2
  setl tabstop=2
  setl textwidth=80
  let b:undo_ftplugin .= ' et< sts< sw< ts< tw<'

  let s:root = expand('<sfile>:p:h:h')
  exe 'setl tags+=' .. s:root .. '/tags/dither.tags'
  "exe 'setl dict+=' .. s:root .. '/tags/dither.dict'
  exe 'setl dict+=' .. s:root .. '/tags/dither.base.dict'
endif

fu! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+\r\?$//ge
    nohl
    exe "normal `z"
endf

" Auto delete trailing white_space if save.
if get(g:, 'dither_save_cls', 1)
  au BufWrite *.n call DeleteTrailingWS()
endif

augroup dither.vim
  autocmd!
  " Highlight incorrect spacing by default.
  if get(g:, 'dither_space_error', 1)
    au InsertEnter * hi link ditherSpaceError NONE
    au InsertLeave * hi link ditherSpaceError Error
  endif
augroup END

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: et sw=2 sts=2 ts=8
