call plug#begin('~/.local/share/nvim/plugged')

"NEOVIM
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
"END OF NEOVIM


Plug 'sainnhe/gruvbox-material'

" Random Vim features -----{{{
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'mattn/emmet-vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mbbill/undotree'
Plug 'andrewradev/splitjoin.vim'
Plug 'cohama/lexima.vim'
" Plug 'Yggdroot/indentLine'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/linediff.vim'
Plug 'rickhowe/diffchar.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'michaeljsmith/vim-indent-object'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-eunuch'
Plug 'vim-scripts/loremipsum'
" Plug 'yssl/QFEnter' " more sensable opening files from quick find list
" Plug 'romainl/vim-qf' " quick fix improvements
Plug 'junegunn/vim-emoji' " emoji support
Plug 'markonm/traces.vim' " highlight matches in some commands
Plug 'wincent/terminus' " Terminal worsk fine
Plug 'chrisbra/NrrwRgn' " focus text
" }}}

Plug 'wincent/scalpel'


" DB Plugins -------------------------------------------------------{{{
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'w0rp/ale'
Plug 'metakirby5/codi.vim'
Plug 'SirVer/ultisnips'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" }}}

Plug 'jpalardy/vim-slime' " REPL

" File browsing ------------------------------------------------------ {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
Plug 'pbogut/fzf-mru.vim'
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'ryanoasis/vim-devicons'
" }}}

Plug 'wincent/ferret'


Plug 'lyokha/vim-xkbswitch'

" Git Plugins ------------------------------------------------------{{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb' " allows to used :Gbrowse for GitHub
Plug 'stsewd/fzf-checkout.vim'
Plug 'wincent/vcs-jump'
Plug 'APZelos/blamer.nvim'
" }}}


" File browsing Plugins --------------------------------------------{{{
" }}}

" Verification needed
"Plug 'rbgrouleff/bclose.vim'
"Plug 'tyru/open-browser.vim'
" Plug 'hardcoreplayers/dashboard-nvim'

" Plug 'pbrisbin/vimmkdir'
Plug 'embear/vim-localvimrc'


" UI
Plug 'chriskempson/base16-vim'
Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline'
Plug 'simeji/winresizer'
" Plug 'psliwka/vim-smoothie'

" Plug 'ap/vim-buftabline'


call plug#end()
