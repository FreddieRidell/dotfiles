" Enable syntax hilighting
syntax enable

set background=dark

" syntax colors:
set t_Co=8
colorscheme custom

" Don't wrap long lines:
set nowrap

" hilight searches
set hlsearch

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Setup funking line numbering:
set relativenumber
set number
set cursorline

" Always display the status line, even if only one window is displayed
set laststatus=2

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Clear search hilighting once we leave insert mode
autocmd BufWrite * :noh
