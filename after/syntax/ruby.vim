unlet b:current_syntax
syn include @GRAPHQL syntax/graphql.vim
syn region sqlHeredoc start=/\v\<\<[-~]GRAPHQL/ end=/\vGRAPHQL/ keepend contains=@GRAPHQL
let b:current_syntax = "ruby"


unlet b:current_syntax
syn include @SQL syntax/sql.vim
syn region sqlHeredoc start=/\v\<\<[-~]SQL/ end=/\vSQL/ keepend contains=@SQL
let b:current_syntax = "ruby"
