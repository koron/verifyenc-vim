" vi:set ts=8 sts=2 sw=2 tw=0 et:
"
" experimental and conceptual implementation.

if has('autocmd')
  augroup FixFenc
    au!
    autocmd BufReadPost * call <SID>FixFenc()
  augroup END
endif

function! s:FixFenc
  let curr_fenc = &l:fileencoding
  let expect_fenc = s:CheckFenc()
  if curr_fenc !=? expect_fenc
    call s:ForceFenc(expect_fenc)
  endif
endfunction

function! s:CheckFenc()
  " TODO:
  return ''
endfunction

function! s:ForceFenc(newenc)
  execute 'edit! ++enc='.a:newenc
  doautocmd BufReadPost
endfunction
