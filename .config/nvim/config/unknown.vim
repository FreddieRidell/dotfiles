set mouse=v


"create folder on save if none exists 
"function s:MkNonExDir(file, buf)
    "if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        "let dir=fnamemodify(a:file, ':h')
        "if !isdirectory(dir)
            "call mkdir(dir, 'p')
        "endif
    "endif
"endfunction

"augroup BWCCreateDir
    "autocmd!
    "autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
"augroup END
