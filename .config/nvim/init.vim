" general settings that affect lots of stuff
runtime ./config/global.vim

"things that affect how vim looks
runtime ./config/themeing.vim

"key bindings and similar
runtime ./config/bindings.vim

runtime ./config/statusline.vim

"filetype specific settings
runtime ./config/filetype.vim

"haven't researched what these are doing yet
runtime ./config/unknown.vim

let g:plug_window = "vertical botright new"

call plug#begin('~/.config/nvim/plugged')

Plug 'adimit/prolog.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alepez/vim-gtest', { 'for': [ 'c', 'cpp' ] }
Plug 'blueyed/vim-diminactive'
Plug 'ciaranm/googletest-syntax', { 'for': [ 'c', 'cpp' ] }
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'text'] }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'lluchs/vim-wren', { 'for': 'wren' }
Plug 'mxw/vim-jsx'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'PProvost/vim-markdown-jekyll', { 'for': 'markdown' }
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'shougo/neocomplete.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'tomasr/molokai'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'vim-scripts/vim-coffee-script'

call plug#end()
Plug 'leafgarland/typescript-vim'
