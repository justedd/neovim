" ========================================
" Base
" ========================================
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set number
set relativenumber

let mapleader=" "

" highlight wide strings
let &colorcolumn=join(range(81,999),",")

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" hightlight word
nmap <C-H> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" easy remove hightlight
nnoremap <CR> :noh<CR><CR>

nnoremap <silent> <leader>r :call mappings#cycle_numbering() <CR>

" try to use folding again
set foldmethod=indent
set foldlevelstart=1
set fillchars=fold:\ 

" system clipboard
xmap <Leader>y "+y

set hlsearch
set ignorecase
set smartcase

" like a shell
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" never use them
nmap Q q
nnoremap K <noop>

" ========================================
" Plug
" ========================================
call plug#begin('~/.local/share/nvim/plugged')

" code features
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'sjl/gundo.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'andrewradev/splitjoin.vim'
Plug 'jiangmiao/auto-pairs'

" LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'wincent/terminus'

" languages
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-jade'
Plug 'slim-template/vim-slim'

" frameworks
Plug 'tpope/vim-rails'
Plug 'mxw/vim-jsx'

" lint
Plug 'w0rp/ale'

" Syntax Hightligth
Plug 'plasticboy/vim-markdown'

" external utils
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'

" git utils
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" File browsing
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" UI
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'kshenoy/vim-signature'
Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" scratch-pad
Plug 'metakirby5/codi.vim'

" snippets
Plug 'SirVer/ultisnips'

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

if has('autocmd')
  augroup WincentNERDTree
    autocmd!
    autocmd User NERDTreeInit call autocmds#attempt_select_last_file()
  augroup END
endif
" Like vim-vinegar.
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'


" junegunn/fzf.vim
nmap <Leader>p :FZF<CR>
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
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '✗'
let g:ale_set_highlights = 0
highlight link ALEWarningSign todo
highlight link ALEErrorSign todo
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" airblade/vim-gitgutter
set signcolumn=yes
set updatetime=100


" Yggdroot/indentLine
let g:indentLine_color_gui = '#333333'
let g:indentLine_faster = 0


" maxbrunsfeld/vim-yankstack
let g:yankstack_map_keys = 0
nmap <leader>k <Plug>yankstack_substitute_older_paste
nmap <leader>j <Plug>yankstack_substitute_newer_paste
" vim-suround conflict with visual surround
call yankstack#setup()


" sjl/gundo.vim
map <leader>u :GundoToggle<cr>


" bling/vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0


" vim-airline/vim-airline-themes
let g:airline_theme='base16_default'


" autozimu/LanguageClient-neovim
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio']
    \ }


" ========================================
" Post Initialize
" ========================================

" hide tilde characters at the line numbers
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
