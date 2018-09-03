" Author: Freddie Ridell
" based on: https://github.com/tomasr/molokai

"0:      BLACK
"1:      RED
"2:      GREEN
"3:      YELLOW
"4:      BLUE
"5:      PURPLE
"6:      ORANGE
"7:      WHITE
"8:      DARK_BLACK
"9:      DARK_RED
"10:     DARK_GREEN
"11:     DARK_YELLOW
"12:     DARK_BLUE
"13:     DARK_PURPLE
"14:     DARK_ORANGE
"15:     DARK_WHITE

hi  clear
hi  Boolean         ctermfg=2  ctermbg=0  cterm=none
hi  Character       ctermfg=3  ctermbg=0  cterm=none
hi  ColorColumn     ctermfg=15 ctermbg=0  cterm=none
hi  Comment         ctermfg=3  ctermbg=0  cterm=none
hi  Conditional     ctermfg=0  ctermbg=0  cterm=none
hi  Constant        ctermfg=4  ctermbg=0  cterm=none
hi  Cursor                                cterm=inverse
hi  Cursorcolumn    ctermfg=0  ctermbg=0  cterm=none
hi  Cursorline                            cterm=underline
hi  Cursorlinenr    ctermfg=0  ctermbg=0  cterm=none
hi  Debug           ctermfg=0  ctermbg=0  cterm=none
hi  Define          ctermfg=6  ctermbg=0  cterm=none
hi  Delimiter       ctermfg=0  ctermbg=0  cterm=none
hi  Diffadd         ctermfg=2  ctermbg=0  cterm=none
hi  Diffchange      ctermfg=4  ctermbg=0  cterm=none
hi  Diffdelete      ctermfg=1  ctermbg=0  cterm=none
hi  Difftext        ctermfg=7  ctermbg=0  cterm=none
hi  Directory       ctermfg=4  ctermbg=0  cterm=bold
hi  Error                      ctermbg=1  cterm=bold
hi  Errormsg                   ctermbg=1  cterm=bold
hi  Exception       ctermfg=1  ctermbg=0  cterm=none
hi  Float           ctermfg=6  ctermbg=0  cterm=none
hi  Foldcolumn      ctermfg=0  ctermbg=8  cterm=none
hi  Folded          ctermfg=0  ctermbg=0  cterm=none
hi  Function        ctermfg=4  ctermbg=0  cterm=none
hi  Icursor         ctermfg=0  ctermbg=0  cterm=none
hi  Identifier      ctermfg=2  ctermbg=0  cterm=none
hi  Ignore          ctermfg=0  ctermbg=0  cterm=none
hi  Incsearch                             cterm=bold cterm=reverse
hi  Keyword         ctermfg=1  ctermbg=0  cterm=bold
hi  Label           ctermfg=0  ctermbg=0  cterm=none
hi  Linenr          ctermfg=0  ctermbg=0  cterm=none
hi  Macro           ctermfg=0  ctermbg=0  cterm=none
hi  Matchparen      ctermfg=0  ctermbg=0  cterm=none
hi  Modemsg         ctermfg=0  ctermbg=0  cterm=none
hi  Moremsg         ctermfg=0  ctermbg=0  cterm=none
hi  Nontext         ctermfg=0  ctermbg=0  cterm=none
hi  Normal          ctermfg=7  ctermbg=0  cterm=none
hi  Number          ctermfg=7  ctermbg=0  cterm=none
hi  Operator        ctermfg=4  ctermbg=0  cterm=none
hi  Pmenu           ctermfg=0  ctermbg=0  cterm=none
hi  Pmenusbar       ctermfg=0  ctermbg=0  cterm=none
hi  Pmenusel        ctermfg=0  ctermbg=0  cterm=none
hi  Pmenuthumb      ctermfg=0  ctermbg=0  cterm=none
hi  Precondit       ctermfg=0  ctermbg=0  cterm=none
hi  Preproc         ctermfg=0  ctermbg=0  cterm=none
hi  Question        ctermfg=0  ctermbg=0  cterm=none
hi  Repeat          ctermfg=0  ctermbg=0  cterm=none
hi  Search          ctermfg=0  ctermbg=7  cterm=none
hi  Signcolumn      ctermfg=0  ctermbg=0  cterm=none
hi  Special         ctermfg=1  ctermbg=0  cterm=none
hi  Specialchar     ctermfg=0  ctermbg=0  cterm=none
hi  Specialcomment  ctermfg=3  ctermbg=0  cterm=none
hi  Specialkey      ctermfg=0  ctermbg=0  cterm=none
hi  Spellbad        ctermfg=1  ctermbg=0  cterm=none
hi  Spellcap        ctermfg=0  ctermbg=0  cterm=none
hi  Spelllocal      ctermfg=0  ctermbg=0  cterm=none
hi  Spellrare       ctermfg=0  ctermbg=0  cterm=none
hi  Statement       ctermfg=3  ctermbg=0  cterm=none
hi  Statuslinenc                          cterm=reverse
hi  Storageclass    ctermfg=0  ctermbg=0  cterm=none
hi  String          ctermfg=3  ctermbg=0  cterm=none
hi  Structure       ctermfg=0  ctermbg=0  cterm=none
hi  Tabline         ctermfg=0  ctermbg=0  cterm=none
hi  Tablinefill     ctermfg=0  ctermbg=0  cterm=none
hi  Tag             ctermfg=0  ctermbg=0  cterm=none
hi  Title           ctermfg=6  ctermbg=0  cterm=none
hi  Todo            ctermfg=0  ctermbg=0  cterm=none
hi  Type            ctermfg=5  ctermbg=0  cterm=none
hi  Typedef         ctermfg=5  ctermbg=0  cterm=none
hi  Underlined                            cterm=underline
hi  Vertsplit                  ctermbg=8   
hi  Visual                                cterm=reverse
hi  Visualnos       ctermfg=0  ctermbg=0  cterm=none
hi  Warningmsg      ctermfg=0  ctermbg=0  cterm=none
hi  Wildmenu        ctermfg=0  ctermbg=0  cterm=none

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
