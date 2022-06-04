call plug#begin('~/.local/share/nvim/plugged')


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'sainnhe/gruvbox-material'



" indentation text objects, <vii> and so on (this thing breaks macros)
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/vim-emoji'

" highlight matches in some commands
Plug 'markonm/traces.vim'

" Terminal improvements
Plug 'wincent/terminus'
" }}}

Plug 'wincent/scalpel'

Plug 'jceb/vim-editqf'

" TODO replace
Plug 'andrewradev/splitjoin.vim'
Plug 'scrooloose/nerdcommenter'



" Competition & syntax & snippetsa ------------------------------- {{{
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
"}}}

" REPL
Plug 'jpalardy/vim-slime'

" File browsing ------------------------------------------------------ {{{
" }}}

Plug 'wincent/ferret'

Plug 'lyokha/vim-xkbswitch'

Plug 'embear/vim-localvimrc'

" Display marks(a-z, A-Z) near numbers
Plug 'kshenoy/vim-signature'

Plug 'hoob3rt/lualine.nvim'


Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'


Plug 'ThePrimeagen/vim-be-good'

Plug 'takac/vim-hardtime'

call plug#end()
