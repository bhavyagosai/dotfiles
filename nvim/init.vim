"  _   _                 _
" | \ | | ___  _____   _(_)_ __ ___
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
" | |\  |  __/ (_) \ V /| | | | | | |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|


" Auto download
if ! filereadable(system('echo -n "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p $XDG_CONFIG_HOME/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $XDG_CONFIG_HOME/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

"=================================="
"       Begin Plugins Section      "
"=================================="

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

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/mappings.vim

"====================================="
"          Plugin Settings            "
"====================================="
" YouCompleteMe
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
let g:ycm_language_server =
\ [
\   {
\     'name': 'rust',
\     'cmdline': ['rust-analyzer'],
\     'filetypes': ['rust'],
\     'project_root_files': ['Cargo.toml']
\   }
\ ]

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

" Ultisnips
"" Trigger configuration.
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ultisnippets"]

