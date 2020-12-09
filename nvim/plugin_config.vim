"====================================="
"          Plugin Settings            "
"====================================="
" " YouCompleteMe
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_key_list_stop_completion = ['<C-y>']
" let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
" let g:ycm_language_server =
" \ [
" \   {
" \     'name': 'rust',
" \     'cmdline': ['rust-analyzer'],
" \     'filetypes': ['rust'],
" \     'project_root_files': ['Cargo.toml']
" \   }
" \ ]

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
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
lua require('lsp_config')

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'

" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" See :help lua-highlight
au TextYankPost * silent! lua vim.highlight.on_yank()

" Toggles between hybrid and absolute line numbers automatically
" https://github.com/jeffkreeftmeijer/vim-numbertoggle
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" rust.vim
let g:rustfmt_autosave = 1
