"  _   _                 _
" | \ | | ___  _____   _(_)_ __ ___
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
" | |\  |  __/ (_) \ V /| | | | | | |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|

"=================================="
"       Begin Plugins Section      "
"=================================="
if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ~/.config/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
        autocmd VimEnter * PlugInstall
endif

call plug#begin()
" ----------------------------------------------------------------------- "
" PRODUCTIVITY
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" SYNTAX
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" AESTHETICS
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/limelight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'

" UTILS
Plug 'xuhdev/vim-latex-live-preview'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" ICEBOX
" Plug 'sirver/UltiSnips'
" Plug 'vim-syntastic/syntastic'
" Plug 'godlygeek/tabular'
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'
" ----------------------------------------------------------------------- "
call plug#end()

"====================================="
"              General                "
"====================================="
set nocompatible              " be iMproved, required
filetype plugin on            " required
syntax on

set nu rnu
set wildmenu
set laststatus=2
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
set mouse=a

"====================================="
"    Text, tab and indent related     "
"====================================="
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


"====================================="
"              Keybinds               "
"====================================="
let mapleader=" "

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

"====================================="
"          Split Managment            "
"====================================="
" Splits open at the bottom and right, this is best in life
set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Open new splits in a semantic way (tip from *nixcasts)
nnoremap c<C-h> :lefta vsp new<CR>
nnoremap c<C-j> :bel sp new<CR>
nnoremap c<C-k> :abo sp new<CR>
nnoremap c<C-l> :rightb vsp new<CR>

" Closing splits in a sane way
nnoremap <C-q> :q<CR>
nnoremap <S-Q> :only<CR>

"====================================="
"     Moving around commands          "
"====================================="


"====================================="
"           Colorscheme               "
"====================================="
let g:gruvbox_contrast_dark='hard' " Must be set before colorscheme to work properly
colorscheme gruvbox
set background=dark
set colorcolumn=80

"====================================="
"          Plugin Settings            "
"====================================="
" Markdown Preview Settings
let g:instant_markdown_browser = "firefox --new-window"
let g:instant_markdown_python = 1

" Plasticboy/ vim-markdown
let g:vim_markdown_folding_disabled = 1

" Tmuxline
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

" Goyo
map <leader>f :Goyo<CR>

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Limelight
" Integration with goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
