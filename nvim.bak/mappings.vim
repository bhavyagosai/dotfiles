"====================================="
"              Keybinds               "
"====================================="
let mapleader=" "

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Goyo
map <leader>f :Goyo<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Compile C/C++ code
map <leader>ccpp :w<CR>:!g++ "%" -o "%:p:r" && "%:p:r"<CR>
map <leader>cc :w<CR>:!gcc "%" -o "%:p:r" && "%:p:r"<CR>

"====================================="
"       Project/File Managment        "
"====================================="

" Project View
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>ps :Rg<SPACE>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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
"         Split/Tab Managment         "
"====================================="

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

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>
