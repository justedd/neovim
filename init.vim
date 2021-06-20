set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set autoread
set number
set relativenumber
set diffopt+=vertical

let mapleader=" "
let maplocalleader="  "

let &colorcolumn=join(range(81,999),",") " highlight wide lines

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

set foldmethod=indent
set foldlevelstart=99
set foldlevel=99

set fdo-=search
set fillchars=fold:\ 

set ignorecase
set smartcase
set hlsearch

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

source $HOME/.config/nvim/config/plugins.vimrc
source $HOME/.config/nvim/config/commands.vimrc

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=0
  autocmd FileType vim setlocal foldlevel=0
augroup END

" bronson/vim-trailing-whitespace {{{
let g:extra_whitespace_ignored_filetypes = ['sql', 'dbout']
" }}}
" w0rp/ale ---- {{{
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
" }}}
" airblade/vim-gitgutter ---{{{
set signcolumn=yes
set updatetime=100
" }}}
" maxbrunsfeld/vim-yankstack {{{
let g:yankstack_map_keys = 0
call yankstack#setup() " vim-suround conflict with visual surround
" }}}
" bling/vim-airline' {{{
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
" }}}
" autozimu/LanguageClient-neovim {{{
let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio']
    \ }
" }}}
" vim-scropts/vim-autosave {{{
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1
"}}}
" embear/vim-localvimrc {{{
let g:localvimrc_ask = 0
"}}}
" rickhowe/diffchar.vim {{{
let g:DiffColors = 100
"}}}
" airblade/vim-gitgutter {{{
let g:gitgutter_sign_added = emoji#for('arrow_forward')
let g:gitgutter_sign_modified = emoji#for('arrow_right_hook')
let g:gitgutter_sign_removed = emoji#for('arrow_backward')
let g:gitgutter_sign_modified_removed = emoji#for('leftwards_arrow_with_hook')
"}}}
"plasticboy/vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
"}}}
" justinmk/vim-dirvish {{{
let g:dirvish_mode = ':sort ,^.*[\/],'
" }}}
" maxbrunsfeld/vim-yankstack {{{
let g:highlightedyank_highlight_duration = 150
"}}}
" lyokha/vim-xkbswitch {{{
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/local/lib/libg3kbswitch.so'
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines
let g:XkbSwitchDynamicKeymap = 1
" }}}
" sainnhe/gruvbox-material {{{
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_disable_italic_comment = 0
" }}}
" wincent/ferret {{{
let g:FerretAutojump=2
"}}}
" jpalardy/vim-slime {{{
let g:slime_target = "tmux"
let g:arduino_use_slime = 1
"}}}
" wincent/scalpel {{{
let g:ScalpelMap=0
" }}}
" lukas-reineke/indent-blankline.nvim {{{
let g:indent_blankline_char = '▏'
" }}}
" hrsh7th/nvim-compe {{{
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
" }}}

set termguicolors
highlight Comment cterm=italic
set background=dark
colorscheme gruvbox-material

" never used them
nmap Q q

" shell mappings in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" tmux guard mappings {{{
nnoremap <A-y> :silent exec "!tmux copy-mode -t guard.1 && tmux send-keys -X -N30 -t guard.1 scroll-up"<cr>
nnoremap <A-n> :silent exec "!tmux copy-mode -t guard.1 && tmux send-keys -X -N30 -t guard.1 scroll-down"<cr>
nnoremap <A-]> :silent exec "!tmux copy-mode -q -t guard.1"<cr>
nnoremap <A-=> :silent exec "!tmux send-keys -t guard.1 C-c"<cr>
"}}}

" windows/tabs navigation {{{
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l

nnoremap <A-7> gT
nnoremap <A-8> gt
" }}}

nnoremap <A-m> :cnext <cr>
nnoremap <A-,> :cprev <cr>

nnoremap <C-H> :call mappings#cycle_highlight() <CR>

nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-j> <Plug>(ale_next_wrap)

nnoremap <leader>gs :G<cr>
nnoremap <leader>gb :Git blame<cr>

xnoremap <Leader>y "+y
nnoremap <Leader>e :set nohlsearch<cr><Plug>(Scalpel)

nnoremap <leader>k <Plug>yankstack_substitute_older_paste
nnoremap <leader>j <Plug>yankstack_substitute_newer_paste

nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <Leader>gc :lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <leader>f :FindFile <C-r><C-w><CR> :copen<CR><CR>
nnoremap <leader>w :write<CR>

xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

lua require('justed')

nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> gd <Cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gR :Lspsaga rename<CR>
