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

