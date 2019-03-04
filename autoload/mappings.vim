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
