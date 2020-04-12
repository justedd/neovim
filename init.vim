" ========================================
" Base
" ========================================
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set number
set relativenumber

set diffopt+=vertical

let mapleader=" "

" highlight wide lines
let &colorcolumn=join(range(81,999),",")

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

nnoremap <silent> <leader>r :call mappings#cycle_numbering() <CR>

" try to use folding again
set foldmethod=indent
autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

set fillchars=fold:\ 

" system clipboard
xmap <Leader>y "+y

set ignorecase
set smartcase
set hlsearch

" like a shell
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" never use them
nmap Q q
nnoremap K <noop>

nnoremap <Leader><Leader> <C-^>

" Commnands
command! InsertTime :normal a<C-R>=strftime('%F %H:%M')<CR>
command! Tfold :normal :call mappings#toggle_fold() <CR>

map <leader>S :syntax sync fromstart<CR>

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
Plug 'bronson/vim-trailing-whitespace'
Plug 'mbbill/undotree'
Plug 'andrewradev/splitjoin.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/linediff.vim'
Plug 'rickhowe/diffchar.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/vim-auto-save'
Plug 'ekalinin/Dockerfile.vim'

Plug 'tpope/vim-eunuch'
Plug 'samoshkin/vim-find-files'

Plug 'rhysd/git-messenger.vim'

"additional modes
Plug 'simeji/winresizer'

Plug 'wincent/vcs-jump'

Plug 'wincent/ferret'


Plug 'yssl/QFEnter'

Plug 'junegunn/vim-emoji'

" DB
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'

Plug 'markonm/traces.vim'

" external features
Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'

" LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" autocomplete
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" some great stuff
Plug 'wincent/terminus'

" temporary
Plug 'takac/vim-hardtime'

" languages
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

" frameworks
Plug 'tpope/vim-rails'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'

" lint
Plug 'w0rp/ale'

" external utils
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'


" git utils
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'sodapopcan/vim-twiggy'


" File browsing
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'


" UI
Plug 'chriskempson/base16-vim'
Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" vim stuff
Plug 'embear/vim-localvimrc'


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


" scrooloose/nerdtree
let g:NERDSpaceDelims = 1
let NERDTreeCascadeSingleChildDir = 0
let NERDTreeQuitOnOpen = 1
nmap <Leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<cr>

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
nmap <Leader>P :Ag<CR>
" nmap <Leader>m :FZFMru<CR>

let g:loaded_matchparen=1
" nnoremap <silent> <Leader>m :execute (exists('g:loaded_matchparen') ? 'No' : 'Do') . 'MatchParen'<CR>

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

let g:ale_sign_error = emoji#for('broken_heart')
let g:ale_sign_warning = emoji#for('fire')
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


" vim-scropts/vim-autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1

" lervag/vimtex
nmap <leader>g :GrammarousCheck<CR>

" tpope/vim-eunuch
nmap <leader>w :Wall<CR>


" embear/vim-localvimrc
let g:localvimrc_ask = 0


" hardmode
let g:hardtime_default_on = 0


" rickhowe/diffchar.vim
let g:DiffColors = 100



" rhysd/git-messenger.vim
let g:git_messenger_always_into_popup = v:true


" vim-emoji
let g:gitgutter_sign_added = emoji#for('arrow_forward')
let g:gitgutter_sign_modified = emoji#for('arrow_right_hook')
let g:gitgutter_sign_removed = emoji#for('arrow_backward')
let g:gitgutter_sign_modified_removed = emoji#for('leftwards_arrow_with_hook')


" neoclide/coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" ========================================
" Post Initialize
" ========================================

" hide tilde characters at the line numbers
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

nmap <C-H> :call mappings#cycle_highlight() <CR>

let g:find_files_findprg = 'fd --hidden $* $d'
