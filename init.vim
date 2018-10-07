" ========================================
" Base
" ========================================
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set number

let mapleader=" "

" highlight wide strings
let &colorcolumn=join(range(81,999),",")

" ========================================
" Plug
" ========================================
call plug#begin('~/.local/share/nvim/plugged')

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'

" code features
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'mattn/emmet-vim'
Plug 'maxbrunsfeld/vim-yankstack'

" lint
Plug 'w0rp/ale'

" Syntax Hightligth
Plug 'plasticboy/vim-markdown'

" UI
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'kshenoy/vim-signature'

" external utils
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'

" git utils
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" ========================================
" Plugin specific sttings
" ========================================


" chriskempson/base16-vim
if filereadable(expand("~/.vimrc_background"))
  set termguicolors
  source ~/.vimrc_background
endif


" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1


" scrooloose/nerdtree
let g:NERDSpaceDelims = 1
let NERDTreeCascadeSingleChildDir = 0
nmap <Leader>n :NERDTreeToggle<CR>
map <leader>s :NERDTreeFind<cr>


" junegunn/fzf.vim
nmap <Leader>p :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }


" w0rp/ale
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop'],
      \   'cpp': [],
      \}
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop', 'reek'],
      \   'cpp': [],
      \}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '✗'
let g:ale_set_highlights = 0
highlight link ALEWarningSign todo
highlight link ALEErrorSign todo
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" airblade/vim-gitgutter
set signcolumn=yes


" Yggdroot/indentLine
let g:indentLine_color_term = 239
let g:indentLine_faster = 0


" maxbrunsfeld/vim-yankstack
let g:yankstack_map_keys = 0
nmap <leader>k <Plug>yankstack_substitute_older_paste
nmap <leader>j <Plug>yankstack_substitute_newer_paste
