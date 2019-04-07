function! mappings#cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction

set hlsearch
let g:search_highlighted = 0

function! mappings#cycle_highlight()
  if g:search_highlighted
    let @/=""
    let g:search_highlighted = 0
  else
    execute "normal \<Plug>(asterisk-z*)"
    let g:search_highlighted = 1
  end
endfunction


let g:default_fold_level = 1
let g:hidden_fold_level = 1000

execute "set foldlevel=".g:default_fold_level
execute "set foldlevelstart=".g:default_fold_level

let g:everything_folded = 0
function! mappings#toggle_fold()
  if g:everything_folded
    execute "set foldlevel=".g:default_fold_level
    execute "set foldlevelstart=".g:default_fold_level
    let g:everything_folded = 0
  else
    execute "set foldlevel=".g:hidden_fold_level
    execute "set foldlevelstart=".g:hidden_fold_level
    let g:everything_folded = 1
  end
endfunction
