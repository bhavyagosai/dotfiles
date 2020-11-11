"  _   _                 _
" | \ | | ___  _____   _(_)_ __ ___
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
" | |\  |  __/ (_) \ V /| | | | | | |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|


" Auto download
if ! filereadable(system('echo -n "$XDG_DATA_HOME/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p $XDG_DATA_HOME/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $XDG_DATA_HOME/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

"=================================="
"       Begin Plugins Section      "
"=================================="

call plug#begin('$XDG_DATA_HOME/nvim/plugged')
" ----------------------------------------------------------------------- "
" PRODUCTIVITY
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" SYNTAX
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" AESTHETICS
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/limelight.vim'

" UTILS
Plug 'sirver/UltiSnips'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" ICEBOX
" Plug 'ycm-core/YouCompleteMe'
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'
" ----------------------------------------------------------------------- "
call plug#end()

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/plugin_config.vim
