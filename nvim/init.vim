"  _   _                 _
" | \ | | ___  _____   _(_)_ __ ___
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
" | |\  |  __/ (_) \ V /| | | | | | |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|

"=================================="
"       Begin Plugins Section      "
"=================================="

" Auto download
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin()
" ----------------------------------------------------------------------- "
" PRODUCTIVITY
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'ycm-core/YouCompleteMe'
" Plug 'dense-analysis/ale'
" Plug 'airblade/vim-gitgutter'

" SYNTAX
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'jiangmiao/auto-pairs'
Plug 'mzlogin/vim-markdown-toc'

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
Plug 'godlygeek/tabular'

" ICEBOX
" Plug 'sirver/UltiSnips'
" Plug 'vim-syntastic/syntastic'
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

set number relativenumber
set laststatus=2
set list
set encoding=utf-8
set termguicolors
set showcmd
set lazyredraw

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
set foldcolumn=1

"====================================="
"    Text, tab and indent related     "
"====================================="
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set nowrap

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

"====================================="
"              Keybinds               "
"====================================="
let mapleader=" "

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Compile C/C++ code
map <leader>ccpp :w <CR> :!g++ "%" -o "%<" && "%<" <CR>
map <leader>cc :w <CR> :!gcc "%" -o "%<" && "%<" <CR>

" remap <C-j> to escape insert mode
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

"====================================="
"         Split/Tab Managment         "
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

" Tabs
map <leader>to :tabnew<cr>
map <leader>tQ :tabonly<cr>
map <leader>tq :tabclose<cr>
map <leader>tn :tabnext 


"====================================="
"          Editing mapping            "
"====================================="
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


"====================================="
"               Misc                  "
"====================================="
map <leader>bs :e ~/scratch/tmp.md<CR>


"====================================="
"          Plugin Settings            "
"====================================="
" YouCompleteMe

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
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

" Limelight & Integration with goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

""Ale

"let g:ale_linters = {
"\   'javascript': ['eslint'],
"\   'python': ['pylint']
"\}

"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'javascript': ['eslint'],
"\   'python': ['black']
"\}

"let g:ale_fix_on_save = 1

"====================================="
"           Colorscheme               "
"====================================="
"Colorscheme must be set in last to avoid coloscheme issues with other plugins
let g:gruvbox_contrast_dark='hard' " Must be set before colorscheme to work properly
colorscheme gruvbox
set background=dark
set colorcolumn=80
