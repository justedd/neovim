" ========================================
" Base
" ========================================
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" automatic reload files
set autoread

set splitbelow
set splitright

set number
set relativenumber

set diffopt+=vertical

let mapleader=" "
let maplocalleader="  "

" highlight wide lines
let &colorcolumn=join(range(81,999),",")

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

nnoremap <silent> <leader>r :call mappings#cycle_numbering() <CR>

nnoremap <leader>vc :set conceallevel=0<cr>

set foldmethod=indent
set foldlevelstart=99
set foldlevel=99

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

map <leader>S :syntax sync fromstart<CR>:set background=dark<CR>

" Plugins delcarations ---- {{{

call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'


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
Plug 'Yggdroot/indentLine'
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
Plug 'samoshkin/vim-find-files'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-scripts/loremipsum'
Plug 'yssl/QFEnter' " more sensable opening files from quick find list
Plug 'junegunn/vim-emoji' " emoji support
Plug 'markonm/traces.vim' " highlight matches in some commands
Plug 'wincent/terminus' " Terminal worsk fine
Plug 'chrisbra/NrrwRgn' " focus text
" }}}


" DB Plugins -------------------------------------------------------{{{
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'kristijanhusak/vim-dadbod-ui'
" }}}

" Vim learning {{{
Plug 'takac/vim-hardtime'
" Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
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
Plug 'pbogut/fzf-mru.vim'
Plug 'justinmk/vim-dirvish'
Plug 'ryanoasis/vim-devicons'
Plug 'francoiscabrol/ranger.vim'
" }}}

Plug 'wincent/ferret'

" Git Plugins ------------------------------------------------------{{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb' " allows to used :Gbrowse for GitHub
Plug 'rhysd/git-messenger.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'wincent/vcs-jump'
" }}}


" File browsing Plugins --------------------------------------------{{{
" }}}

" Verification needed
"Plug 'rbgrouleff/bclose.vim'
"Plug 'tyru/open-browser.vim'
" Plug 'hardcoreplayers/dashboard-nvim'

Plug 'pbrisbin/vim-mkdir'
Plug 'embear/vim-localvimrc'


" UI
Plug 'chriskempson/base16-vim'
Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline'
Plug 'simeji/winresizer'

" Plug 'ap/vim-buftabline'


call plug#end()
" }}}

" ========================================
" Plugin specific sttings
" ========================================

" chriskempson/base16-vim
" if filereadable(expand("~/.vimrc_background"))
  " set termguicolors
  " source ~/.vimrc_background
" endif

" trailing whitespace
let g:extra_whitespace_ignored_filetypes = ['sql', 'dbout']

" scrooloose/nerdtree
let g:NERDSpaceDelims = 1
let NERDTreeCascadeSingleChildDir = 0
let NERDTreeQuitOnOpen = 1
nmap <Leader>nn :NERDTree<CR>
map <leader>nf :NERDTreeFind<cr>

let g:NERDTreeCreatePrefix='silent keepalt keepjumps'


" junegunn/fzf.vim
" nmap <Leader>p :FZF<CR>
nmap <Leader>p :FzfPreviewProjectFiles<cr>
nmap <Leader>i :Buffers<CR>
nmap <Leader>o :Ag<CR>
" nmap <Leader>m :FZFMru<CR>

let g:loaded_matchparen=1
" nnoremap <silent> <Leader>m :execute (exists('g:loaded_matchparen') ? 'No' : 'Do') . 'MatchParen'<CR>

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


" Statusline settings {{{
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
" }}}


" autozimu/LanguageClient-neovim
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio']
    \ }


" vim-scropts/vim-autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1

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

"junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" vim-emoji
let g:gitgutter_sign_added = emoji#for('arrow_forward')
let g:gitgutter_sign_modified = emoji#for('arrow_right_hook')
let g:gitgutter_sign_removed = emoji#for('arrow_backward')
let g:gitgutter_sign_modified_removed = emoji#for('leftwards_arrow_with_hook')


"plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1


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

" dirvish.vim
let g:dirvish_mode = ':sort ,^.*[\/],'
" nnoremap <leader>f :Dirvish

let g:ranger_map_keys = 0

" Find?
nnoremap <leader>f :Find <C-r><C-w><CR> :copen<CR><CR>


" drop all buffers
command! BufOnly execute '%bdelete|edit #|normal `"'


" highli yank
let g:highlightedyank_highlight_duration = 150


"you-are-here
" nnoremap <silent> <leader>here :call you_are_here#Toggle()<CR>


" ========================================
" Post Initialize
" ========================================

" hide tilde characters at the line numbers
" hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

nmap <C-H> :call mappings#cycle_highlight() <CR>

let g:find_files_findprg = 'fd --hidden $* $d'

let g:peekaboo_window = "vert rightb 50new"

" let g:rainbow_active = 1


echo "(ノ°ο°)ノ"

nnoremap <leader>ve :tabe $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

onoremap n /return<cr>

" g:indentLine_bufNameExclude = ['_.md']
let g:indentLine_fileTypeExclude = ['markdown']


" coc-fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:coc_fzf_preview = 'right:50%'

let g:fzf_preview_window = 'right:50%'

let g:fzf_preview_default_fzf_options = { '--bind': '?:toggle-preview' }

let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_dev_icon_prefix_string_length = 3
let g:fzf_preview_dev_icons_limit = 10000


let g:slime_target = "tmux"
let g:arduino_use_slime = 1

onoremap in@ :<c-u>execute "normal! /\\w*@\\w*\\.\\w*\r:nohlsearch\rviW"<cr>


" Git workflow -------------------------------------------------------{{{

" fugitive
nnoremap <leader>gs :G<cr>
nnoremap <leader>gr :diffget //3<cr>
nnoremap <leader>gl :diffget //2<cr>
nnoremap <leader>gc :GCheckout<cr>

nnoremap <leader>vm :VcsJump merge<cr>
nnoremap <leader>vd :VcsJump diff<cr>

" Handler for file change outsite of Vim
function FCSHandler(name)
  if v:fcs_reason == "deleted"
    call setbufvar(expand(a:name), '&modifiable', '0')
    call setbufvar(expand(a:name), '&ro', '1')
  endif
endfunction

augroup gitReload
  autocmd!
  " try to reload buffers onc heckout
  " trigger `autoread` when files changes on disk
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  autocmd FileChangedShell * call FCSHandler(expand("<afile>:p"))
augroup END
" }}}


" Filetypes -------------------------------------------------------{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=0
  autocmd FileType vim setlocal foldlevel=0
augroup END
" }}}

" set t_ZH=[3m
" set t_ZR=[23m

" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set background=dark
let g:gruvbox_italic=1

" autocmd vimenter * colorscheme gruvbox
highlight Comment cterm=italic
colorscheme gruvbox

autocmd vimenter * colorscheme gruvbox

" autocmd BufEnter * execute "normal! :set background=dark\r"
" autocmd vimenter * call ToggleTheme()

" " right
" autocmd VimEnter * hi! link airline_tablabel_right airline_tabtype
" " left
" autocmd VimEnter * hi! link airline_tablabel airline_tabtype
