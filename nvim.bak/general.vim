"====================================="
"              General                "
"====================================="

set nocompatible              " be iMproved, required
filetype plugin on            " required
filetype plugin indent on
syntax on

set number relativenumber
set laststatus=2
set encoding=utf-8
set list
set showcmd
set lazyredraw
set hidden
if (has("termguicolors"))
  set termguicolors
endif

" Makes search act like search in modern browsers
set incsearch
set wrapscan

" Show matching brackets when text indicator is over them
set showmatch

" Highlight search results
set hlsearch

" When searching try to be smart about cases
set smartcase

" TODO: Give it good description
set so=7

" Show the current cursor position in bottom right
set ruler

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set noswapfile
set nowb
set undodir=~/.local/share/nvim/undodir
set undofile

" No annoying sound on errors
set noerrorbells
set novisualbell

" Ignore case when searching
set ignorecase
set mouse=a

" Makes search act like search in modern browsers
set magic

" Add a bit extra margin to the left
" set foldcolumn=1

" Configure backspace so it acts as it should act
set backspace=indent,eol,start

" Split open at the bottom and right, this is best in life
set splitbelow splitright

"====================================="
"    Text, tab and indent related     "
"====================================="

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set lbr
set tw=500
set nowrap

"====================================="
"           Colorscheme               "
"====================================="

set background=dark
let g:gruvbox_contrast_dark='hard' " Must be set before colorscheme to work properly
colorscheme gruvbox
set colorcolumn=80
