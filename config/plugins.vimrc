call plug#begin('~/.local/share/nvim/plugged')

" Telescope and dependencies {{{

Plug 'ThePrimeagen/harpoon'

" }}}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'sainnhe/gruvbox-material'

" Random Vim features -----{{{
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-eunuch'
Plug 'haya14busa/vim-asterisk'
Plug 'tpope/vim-unimpaired'

" navigate in indentation liek [-
Plug 'jeetsukumaran/vim-indentwise'

" indentation text objects, <vii> and so on (this thing breaks macros)
"Plug 'michaeljsmith/vim-indent-object'
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
Plug 'justinmk/vim-dirvish'
Plug 'ryanoasis/vim-devicons'
" }}}

Plug 'wincent/ferret'

Plug 'lyokha/vim-xkbswitch'

" Git Plugins ------------------------------------------------------{{{
" }}}


Plug 'embear/vim-localvimrc'

" Display marks(a-z, A-Z) near numbers
Plug 'kshenoy/vim-signature'

"Plug 'akinsho/nvim-bufferline.lua'

Plug 'hoob3rt/lualine.nvim'

"Plug 'bling/vim-airline'


Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-web-devicons' " lua

Plug 'kevinhwang91/rnvimr'

Plug 'ThePrimeagen/vim-be-good'

Plug 'takac/vim-hardtime'

call plug#end()
