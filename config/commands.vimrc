fun! FindFiles(filename)
  let error_file = tempname()
  silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfun

command! -nargs=1 FindFile call FindFiles(<q-args>)
command! BufOnly execute '%bdelete|edit #|normal `"'
