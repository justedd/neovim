" Heredoc syntax highlight for ruby
unlet b:current_syntax
syn include @GRAPHQL syntax/graphql.vim
syn region sqlHeredoc start=/\v\<\<[-~]GRAPHQL/ end=/\vGRAPHQL/ keepend contains=@GRAPHQL
let b:current_syntax = "ruby"


unlet b:current_syntax
syn include @SQL syntax/sql.vim
syn region sqlHeredoc start=/\v\<\<[-~]SQL/ end=/\vSQL/ keepend contains=@SQL
let b:current_syntax = "ruby"



" Extensions of vim-rails for better syntax highlight in rspec

let s:has_app = exists('*RailsDetect') && RailsDetect()
let s:path = tr(expand('%:p'), '\', '/')

hi def link rubyTestMacro                   rubyMacro
hi def link rubyMacro                       Macro

if s:path =~# '/spec/.*_spec\.rb$'
  syn keyword rubyTestMacro fdescribe fit let_it_be before_all
endif
