" stuff for nerdtree features
function! autocmds#attempt_select_last_file()
  let l:previous=expand('#:t')
  if l:previous != ''
    call search('\v<' . l:previous . '>')
  endif
endfunction

function FCSHandler(name)
  if v:fcs_reason == "deleted"
    call setbufvar(expand(a:name), '&modifiable', '0')
    call setbufvar(expand(a:name), '&ro', '1')
  endif
endfunction

augroup gitReload
  autocmd!
  " try to reload buffers onc heckout
  " trigger `autoread` when files changes on disk
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  autocmd FileChangedShell * call FCSHandler(expand("<afile>:p"))
augroup END

augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

