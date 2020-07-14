"  _   _                 _
" | \ | | ___  _____   _(_)_ __ ___
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
" | |\  |  __/ (_) \ V /| | | | | | |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|

"=================================="
"       Begin Plugins Section      "
"=================================="

" Auto download
if ! filereadable(system('echo -n "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p $XDG_CONFIG_HOME/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $XDG_CONFIG_HOME/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin()
" ----------------------------------------------------------------------- "
" PRODUCTIVITY
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
Plug 'sirver/UltiSnips'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" ICEBOX
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'
" ----------------------------------------------------------------------- "
call plug#end()

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
"           Colorscheme               "
"====================================="
set background=dark
let g:gruvbox_contrast_dark='hard' " Must be set before colorscheme to work properly
colorscheme gruvbox
set colorcolumn=80

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

" Compile C/C++ code
map <leader>ccpp :w<CR>:!g++ "%" -o "%:p:r" && "%:p:r"<CR>
map <leader>cc :w<CR>:!gcc "%" -o "%:p:r" && "%:p:r"<CR>

"====================================="
"         Split/Tab Managment         "
"====================================="
" Split open at the bottom and right, this is best in life
set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
map <c-h> :wincmd h<CR>
map <c-j> :wincmd j<CR>
map <c-k> :wincmd k<CR>
map <c-l> :wincmd l<CR>

" Open new splits in a semantic way (tip from *nixcasts)
nnoremap <leader>sh :lefta vsp new<CR>
nnoremap <leader>sj :bel sp new<CR>
nnoremap <leader>sk :abo sp new<CR>
nnoremap <leader>sl :rightb vsp new<CR>

" Closing splits in a sane way
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :only<CR>

" Tabs
map <leader>to :tabnew<cr>
map <leader>tQ :tabonly<cr>
map <leader>tq :tabclose<cr>
map <leader>tn :tabnext 

"====================================="
"       Project/File Managment        "
"====================================="

" Project View
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>ps :Rg<SPACE>

" Fzf
nnoremap <c-p> :GFiles<CR>

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
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']

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

" Limelight & Integration with goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Ale

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


" Ultisnips
"" Trigger configuration.
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ultisnippets"]
