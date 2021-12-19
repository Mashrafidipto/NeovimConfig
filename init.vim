set nocompatible

call plug#begin('~/Appdata/Local/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-highlightedyank'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'liuchengxu/vista.vim'
Plug 'sbdchd/neoformat'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'luochen1990/rainbow'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'aliou/bats.vim'
Plug 'jamespwilliams/bat.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'folke/which-key.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

call plug#end()

syntax on
filetype plugin indent on

set guifont=JetBrainsMono:h15
set background=dark
set hidden
set runtimepath^=~/AppData/Local/nvim/plugged/coc.nvim
set number
set title
set autowrite
set timeoutlen=1000
set shell=cmd
set clipboard^=unnamed,unnamedplus
set encoding=utf-8
set hidden
set nobackup
set noshowmode
set nowritebackup
set cmdheight=1
set updatetime=100
set shortmess+=c
set fileencoding=utf-8
set ttyfast
set backspace=indent,eol,start
set tabstop=4
set relativenumber
set softtabstop=0
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set ignorecase
set smartcase
set ruler
set scrolloff=999
set termguicolors
set wildmenu
set mouse=a


"""Color
colorscheme palenight
"Penlight
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:palenight_terminal_italics=1

"Defults
let mapleader=","
let g:raibow_active = 1

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'gray'

"Sneak
let g:sneak#label=1

" Startify
let g:startify_fortune_use_unicode = 1

" Startify + NERDTree on start when no file is specified
autocmd VimEnter *
    \   if !argc()
    \ |   Startify
    \ | endif


"Nvim Tree
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

"""LightLine
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }
"
"""Vista vim 
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista#renderer#enable_icon = 1

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

"""Brackets
let g:rainbow_active = 1

"""Neoformate

let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

"""
lua << EOF
    require("which-key").setup {
    
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
    require("bufferline").setup{}
    require'nvim-tree'.setup {}
    
EOF


" Mappings keys
nnoremap <leader>nt :NvimTreeToggle<CR>
nnoremap <leader>nr :NvimTreeRefresh<CR>
nnoremap <leader>nf :NvimTreeFocus
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>l :Limelight!!<CR>
imap jj <ESC>
tnoremap jj <C-\><C-n>
nnoremap <leader>vf :Vista<CR>
nnoremap <leader>vt :Vista!!<Cr>
