set shell=/bin/bash

let mapleader = ","

"reload on file change:
set autoread

" Enable syntax hilighting
syntax enable
set background=dark

set mouse=v

set scrolloff=7

" Folding:
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Syntax Colors:
set t_Co=256
let g:rehash256 = 1
colorscheme molokai
let g:molokai_original = 1

" statusline:
set statusline=
set statusline+=%f "Filepath
set statusline+=\ \|\ "Seperator
set statusline+=%c   " Total lines
set statusline+=\ \|\ "Seperator
set statusline+=%l    " Current line
set statusline+=/    " Separator
set statusline+=%L   " Total lines

set statusline+=%=        " Switch to the right side

set statusline+=%t "Filename
set statusline+=\ \|\ "Seperator
set statusline+=%y "Filetype

" Execute local .vimrc files for projects:
set exrc

" Enable better CMDLine completion
set wildmenu

" Show partial commands in the last time of the screen
set showcmd

" Don't wrap long lines:
set nowrap

" hilight searches
set hlsearch

" Setup funking line numbering:
set relativenumber
set number
set cursorline

" Clear search hilighting once we leave insert mode
autocmd BufWrite * :noh

" Reload .vimrc when it's edited:
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Display line numbers on the left
set number

" Don't index files from the .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Set tabs to sane things
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" Re-read file if edited outside
set autoread

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

let g:jsx_ext_required = 0

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tt :tabn

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"set statusline+=%#warningmsg#
"set statusline+=%*

" neomake
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

autocmd BufWritePost * Neomake
autocmd BufWinEnter * Neomake

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']

:highlight NeomakeErrorMsg ctermfg=9 ctermbg=0
let g:neomake_error_sign={'text': 'X', 'texthl': 'NeomakeErrorMsg'}

"end neomake

nmap <Leader>rp :RainbowParentheses<CR>      " turn on rainbow brackets
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'] ]

" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite :call DeleteTrailingWS()

autocmd BufRead,BufNewFile *.md setlocal spell wrap linebreak
autocmd BufRead,BufNewFile *.txt setlocal spell wrap linebreak
autocmd BufRead,BufNewFile *.markdown setlocal spell wrap linebreak
autocmd BufRead,BufNewFile *.mdown setlocal spell wrap linebreak

"custom macros
"
"reset a bit
nmap <silent> <C-l> :noh<CR>:set nopaste<CR>:redraw!<CR>
" reset ctrl-p
nmap <Leader>pp :CtrlPClearAllCaches <CR> :CtrlP <CR>
" JSON PrettyPrint
nmap <Leader>j :'<,'>!python -m json.tool <CR>

" mergetool
nmap <Leader>re :diffg RE <CR>
nmap <Leader>ba :diffg BA <CR>
nmap <Leader>lo :diffg LO <CR>

let g:plug_window = "vertical botright new"

call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'alepez/vim-gtest', { 'for': [ 'c', 'cpp' ] }
Plug 'blueyed/vim-diminactive'
Plug 'ciaranm/googletest-syntax', { 'for': [ 'c', 'cpp' ] }
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'jparise/vim-graphql'
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'text'] }
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'kien/ctrlp.vim'
Plug 'lluchs/vim-wren', { 'for': 'wren' }
Plug 'mxw/vim-jsx'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'PProvost/vim-markdown-jekyll', { 'for': 'markdown' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'shougo/neocomplete.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'vim-scripts/vim-coffee-script'
Plug 'xuyuanp/nerdtree-git-plugin'

call plug#end()
