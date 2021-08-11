call plug#begin('~/.local/share/nvim/plugged')

" Telescope and dependencies {{{
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fhill2/telescope-ultisnips.nvim'
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
Plug 'maxbrunsfeld/vim-yankstack'
"Plug 'bronson/vim-trailing-whitespace'
Plug 'haya14busa/vim-asterisk'
Plug 'tpope/vim-unimpaired'

" navigate in indentation liek [-
Plug 'jeetsukumaran/vim-indentwise'

" indentation text objects, <vii> and so on
Plug 'michaeljsmith/vim-indent-object'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/vim-emoji'

" highlight matches in some commands
Plug 'markonm/traces.vim'

" Terminal improvements
Plug 'wincent/terminus'
" }}}

Plug 'wincent/scalpel'

" TODO replace
Plug 'andrewradev/splitjoin.vim'
"Plug 'cohama/lexima.vim'
Plug 'scrooloose/nerdcommenter'


" DB Plugins {{{
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'kristijanhusak/vim-dadbod-ui'
" }}}


" language && framework Plugins ------------------------------------{{{
Plug 'noprompt/vim-yardoc'
Plug 'rust-lang/rust.vim'
Plug 'stevearc/vim-arduino'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-jade'
Plug 'slim-template/vim-slim'
Plug 'kchmck/vim-coffee-script'
Plug 'aklt/plantuml-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-bundler'
Plug 'jparise/vim-graphql'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tpope/vim-rails'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'ekalinin/Dockerfile.vim'
" }}}

" Competition & syntax & snippetsa ------------------------------- {{{
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
"}}}

" REPL
Plug 'jpalardy/vim-slime'

" File browsing ------------------------------------------------------ {{{
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'ryanoasis/vim-devicons'
" }}}

Plug 'wincent/ferret'

Plug 'lyokha/vim-xkbswitch'

" Git Plugins ------------------------------------------------------{{{
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
"Plug 'airblade/vim-gitgutter'

" allows to used :Gbrowse for GitHub
Plug 'tpope/vim-rhubarb'
Plug 'wincent/vcs-jump'
" }}}


Plug 'embear/vim-localvimrc'

" Display marks(a-z, A-Z) near numbers
Plug 'kshenoy/vim-signature'

Plug 'akinsho/nvim-bufferline.lua'

Plug 'hoob3rt/lualine.nvim'

"Plug 'bling/vim-airline'


Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'

Plug 'hrsh7th/nvim-compe'

Plug 'windwp/nvim-autopairs'

Plug 'ray-x/lsp_signature.nvim'

Plug 'Pocco81/TrueZen.nvim'

Plug 'kyazdani42/nvim-web-devicons' " lua


Plug 'kevinhwang91/rnvimr'



call plug#end()
