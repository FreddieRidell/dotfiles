set shell=/bin/bash

" convenient leader key
let mapleader = ","

"reload on file change:
set autoread

" Execute local .vimrc files for projects:
set exrc

" Enable better CMDLine completion
set wildmenu

" Show partial commands in the last time of the screen
set showcmd

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

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" yank uses the system clipboard
set clipboard+=unnamedplus

" folding:
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

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

:highlight NeomakeErrorMsg ctermfg=9 ctermbg=0
let g:neomake_error_sign={'text': 'X', 'texthl': 'NeomakeErrorMsg'}
"end neomake

" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite :call DeleteTrailingWS()

