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
hi  Boolean         ctermfg=2        ctermbg=0      cterm=none
hi  Character       ctermfg=3        ctermbg=0      cterm=none
hi  ColorColumn     ctermfg=15       ctermbg=0      cterm=none
hi  Comment         ctermfg=15
hi  Conditional     ctermfg=1        ctermbg=0      cterm=bold
hi  Constant        ctermfg=5        ctermbg=0      cterm=bold
hi  Cursor          cterm=inverse
hi  Cursorcolumn    ctermfg=0        ctermbg=0      cterm=none
hi  Cursorline      cterm=underline
hi  Cursorlinenr    ctermfg=6        ctermbg=0      cterm=bold
hi  Debug           ctermfg=0        ctermbg=0      cterm=none
hi  Define          ctermfg=6        ctermbg=0      cterm=none
hi  Delimiter       ctermfg=7        ctermbg=0      cterm=none
hi  Diffadd         ctermfg=2        ctermbg=0      cterm=none
hi  Diffchange      ctermfg=4        ctermbg=0      cterm=none
hi  Diffdelete      ctermfg=1        ctermbg=0      cterm=none
hi  Difftext        ctermfg=7        ctermbg=0      cterm=none
hi  Directory       ctermfg=4        ctermbg=0      cterm=bold
hi  Error           ctermbg=1        cterm=bold
hi  Errormsg        ctermbg=1        cterm=bold
hi  Exception       ctermfg=1        ctermbg=0      cterm=none
hi  Float           ctermfg=6        ctermbg=0      cterm=none
hi  Foldcolumn      ctermfg=0        ctermbg=8      cterm=none
hi  Folded          ctermfg=0        ctermbg=0      cterm=none
hi  Function        ctermfg=2        cterm=bold
hi  Icursor         ctermfg=0        ctermbg=0      cterm=none
hi  Identifier      ctermfg=6        ctermbg=0      cterm=bold
hi  Ignore          ctermfg=15       ctermbg=0      cterm=none
hi  Incsearch       cterm=bold       cterm=reverse
hi  Label           ctermfg=4        ctermbg=0      cterm=none
hi  Linenr          ctermfg=15       ctermbg=0      cterm=bold
hi  Macro           ctermfg=3        ctermbg=0      cterm=none
hi  Matchparen      ctermfg=7        ctermbg=7      cterm=bold
hi  Modemsg         ctermfg=0        ctermbg=0      cterm=none
hi  Moremsg         ctermfg=0        ctermbg=0      cterm=none
hi  Nontext         ctermfg=0        ctermbg=0      cterm=none
hi  Normal          ctermfg=7        ctermbg=0      cterm=none
hi  Number          ctermfg=5        ctermbg=0      cterm=none
hi  Operator        ctermfg=1
hi  Pmenu           ctermfg=7        ctermbg=0      cterm=none
hi  Pmenusbar       ctermfg=1        ctermbg=0      cterm=none
hi  Pmenusel        ctermfg=2        ctermbg=0      cterm=bold
hi  Pmenuthumb      ctermfg=3        ctermbg=0      cterm=none
hi  PreProc         ctermfg=2
hi  Precondit       ctermfg=0        ctermbg=0      cterm=none
hi  Question        ctermfg=0        ctermbg=0      cterm=none
hi  Repeat          ctermfg=1        cterm=bold
hi  Search          ctermfg=0        ctermbg=7      cterm=none
hi  Signcolumn      ctermfg=0        ctermbg=0      cterm=none
hi  Special         ctermfg=4
hi  Specialchar     ctermfg=4        ctermbg=0      cterm=none
hi  Specialcomment  ctermfg=3        ctermbg=0      cterm=none
hi  Specialkey      ctermfg=0        ctermbg=0      cterm=none
hi  Spellbad        ctermbg=1        cterm=none
hi  Spellcap        ctermbg=2        cterm=none
hi  Spelllocal      ctermbg=3        cterm=none
hi  Spellrare       ctermbg=4        cterm=none
hi  Statement       ctermfg=1        ctermbg=0      cterm=none
hi  Statuslinenc    cterm=reverse
hi  Storageclass    ctermfg=6
hi  String          ctermfg=3        ctermbg=0      cterm=none
hi  Structure       ctermfg=5        ctermbg=0      cterm=none
hi  Tabline         ctermfg=0        ctermbg=15     cterm=none
hi  Tablinefill     ctermfg=0        ctermbg=15     cterm=none
hi  Tag             ctermfg=0        ctermbg=0      cterm=none
hi  Title           ctermfg=6        ctermbg=0      cterm=none
hi  Todo            ctermfg=0        ctermbg=7
hi  Type            ctermfg=4        ctermbg=0      cterm=none
hi  Typedef         ctermfg=5        ctermbg=0      cterm=none
hi  Underlined      cterm=underline
hi  Vertsplit       ctermbg=8
hi  Visual          cterm=reverse
hi  Visualnos       ctermfg=0        ctermbg=0      cterm=none
hi  Warningmsg      ctermfg=0        ctermbg=0      cterm=none
hi  Wildmenu        ctermfg=7        ctermbg=0      cterm=none
hi  keyword         ctermfg=9        ctermbg=0      cterm=bold
hi tsxAttrib ctermfg=3
hi tsxAttributeBraces ctermfg=7
hi tsxCloseString ctermfg=6
hi tsxCloseTag ctermfg=6
hi tsxEqual ctermfg=2
hi tsxTagName ctermfg=2

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
