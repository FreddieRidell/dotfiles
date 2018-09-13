let mapleader = " " "convenient leader key
set autoindent " When opening a new line and no filetype-specific indenting is enabled, keep the same indent as the line you're currently on. Useful for READMEs, etc.
set autoread "reload on file change:
set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert action
set clipboard+=unnamedplus " yank uses the system clipboard
set complete+=kspell "add autocomplete from the spellfile
set exrc " Execute local .vimrc files for projects:
set foldlevel=2 " folding
set foldmethod=syntax " folding
set foldnestmax=10 " folding
set ignorecase " Use case insensitive search, except when using capital letters
set incsearch " Makes search act like search in modern browsers
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regular expressions turn magic on
set nobackup " Turn backup off, since most stuff is in SVN, git et.c anyway...
set noexpandtab " Set tabs to sane things
set nofoldenable " folding
set noswapfile " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowb " Turn backup off, since most stuff is in SVN, git et.c anyway...
set shell=/usr/bin/zsh
set shiftwidth=4 " Set tabs to sane things
set showcmd " Show partial commands in the last time of the screen
set smartcase " Use case insensitive search, except when using capital letters
set softtabstop=4 " Set tabs to sane things
set tabstop=4 " Set tabs to sane things
set viminfo^=% " Remember info about open buffers on close
set wildignorecase " Enable better CMDLine completion
set wildmenu " Enable better CMDLine completion

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Reload .vimrc when it's edited:
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

:highlight NeomakeErrorMsg ctermfg=9 ctermbg=0
let g:neomake_error_sign={'text': 'X', 'texthl': 'NeomakeErrorMsg'}

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite :call DeleteTrailingWS()
