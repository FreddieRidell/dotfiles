" bindings and config for fzf
nmap <C-p> :FZF <CR>

" config for Ctrl-N
let completeopt = 'menu,menuone,preview'

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tt :tabn

" neomake
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

autocmd BufWritePost * Neomake
autocmd BufWinEnter * Neomake
autocmd VimEnter * wincmd p
"
"reset a bit
nmap <silent> <C-l> :noh<CR>:set nopaste<CR>:redraw!<CR>
" JSON PrettyPrint
nmap <Leader>j :'<,'>!python -m json.tool <CR>

" mergetool
nmap <Leader>re :diffg RE <CR>
nmap <Leader>ba :diffg BA <CR>
nmap <Leader>lo :diffg LO <CR>

"rainbow brackets
nmap <Leader>rp :RainbowParentheses<CR>
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'] ]
