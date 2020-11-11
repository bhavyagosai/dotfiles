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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'tjdevries/lsp_extensions.nvim'

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
" Plug 'ycm-core/YouCompleteMe'
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

" neovim-lsp
" Set completeopt to have a better completion experience
" :help completeopt
" set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
" set shortmess+=c
" 
" " Configure LSP
" " https://github.com/neovim/nvim-lspconfig#rust_analyzer
" lua <<EOF
" 
" -- nvim_lsp object
" local nvim_lsp = require'nvim_lsp'
" 
" -- function to attach completion and diagnostics
" -- when setting up lsp
" local on_attach = function(client)
"     require'completion'.on_attach(client)
"     require'diagnostic'.on_attach(client)
" end
" 
" -- Enable rust_analyzer
" nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
" 
" EOF
" 
" " Trigger completion with <Tab>
" inoremap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ completion#trigger_completion()
" 
" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" Visualize diagnostics
" let g:diagnostic_enable_virtual_text = 1
" let g:diagnostic_trimmed_virtual_text = '40'
" " Don't show diagnostics while in insert mode
" let g:diagnostic_insert_delay = 1
" 
" " Set updatetime for CursorHold
" " 300ms of no cursor movement to trigger CursorHold
" set updatetime=300
" " Show diagnostic popup on cursor hold
" autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" See :help lua-highlight
" au TextYankPost * silent! lua vim.highlight.on_yank()

