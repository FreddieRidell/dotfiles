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

"device specific config
runtime ./config/env.vim

let g:plug_window = "vertical botright new"

call plug#begin('~/.config/nvim/plugged')

Plug 'JulesWang/css.vim'
Plug 'PProvost/vim-markdown-jekyll', { 'for': 'markdown' }
Plug 'airblade/vim-gitgutter'
Plug 'alepez/vim-gtest', { 'for': [ 'c', 'cpp' ] }
Plug 'arp242/auto_mkdir2.vim'
Plug 'blueyed/vim-diminactive'
Plug 'bogado/file-line'
Plug 'cespare/vim-toml'
Plug 'ciaranm/googletest-syntax', { 'for': [ 'c', 'cpp' ] }
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'hail2u/vim-css3-syntax'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/gv.vim'
Plug 'kovisoft/slimv', { 'for': [ 'lisp' ] }
Plug 'kshenoy/vim-signature'
Plug 'leafgarland/typescript-vim'
Plug 'lluchs/vim-wren', { 'for': 'wren' }
Plug 'mxw/vim-jsx'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neomake/neomake', { 'commit': 'bcf2a4a' }
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier'
Plug 'rust-lang/rust.vim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'shougo/neocomplete.vim'
Plug 'stephenway/postcss.vim'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-vinegar'

call plug#end()
