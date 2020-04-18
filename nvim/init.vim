set nocompatible              " be iMproved, required
" filetype plugin on            " required
syntax on

set noerrorbells
set nu rnu
set wildmenu
set laststatus=2
"""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""
set list
set encoding=utf-8
set termguicolors
set showcmd
set hlsearch
set incsearch
set lazyredraw
set showmatch
set smartcase
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile

"""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'plasticboy/vim-markdown'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ap/vim-css-color'
Plug 'edkolev/tmuxline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
call plug#end()

"""""""""""""""""""""""""""""""""""""""
" Colorscheme
"""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set background=dark
let g:gruvbox_contrast_dark='hard'

"""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set nowrap

"""""""""""""""""""""""""""""""""""""""
" Key Mapping
"""""""""""""""""""""""""""""""""""""""
" Setting the leader key
let mapleader=" "

" Leader key maps
nmap <leader>w :w<cr>
nmap <leader>wq :wq<cr>
nmap <leader>q :q<cr>

"""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

"" Markdown Preview Settings
"Setting default browser for markdown preview to brave
let g:instant_markdown_browser = "firefox --new-window"
let g:instant_markdown_python = 1

"" Plasticboy/ vim-markdown
let g:vim_markdown_folding_disabled = 1

"" Tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#H',
      \'c'    : '#(whoami)',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%R',
      \'z'    : '#H'}

