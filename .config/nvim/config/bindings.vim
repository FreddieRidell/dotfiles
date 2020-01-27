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
nmap <silent> <C-o> :noh<CR>:set ai<CR>:set nopaste<CR>:redraw!<CR>
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

"sort and uniq selection
map <Leader>so :!sort<CR>
map <Leader>un :!uniq<CR>

"turn on spelling
map <Leader>sp :setlocal spell spelllang=en_us<CR>

" split
nmap <Leader>- :vsplit<CR>
nmap <Leader>\| :split<CR>
nmap <Leader><Leader>h <C-w>h
nmap <Leader><Leader>j <C-w>j
nmap <Leader><Leader>k <C-w>k
nmap <Leader><Leader>l <C-w>l
nmap <Leader>gf :vertical wincmd f<CR>

" Goyo
nmap <Leader>gy :Goyo<CR>

map <Leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" search for visual mode selection
vnoremap // y/<C-R>"<CR>

" nvim inline terminal shortcuts
nmap <Leader>te :tabnew zsh <bar> terminal<CR>
tnoremap <Leader><Esc> <C-\><C-n>

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
