"javascript
let g:jsx_ext_required = 0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']

"texty
autocmd BufRead,BufNewFile *.md,*.txt,*.markdown, set filetype=markdown
autocmd BufRead,BufNewFile *.md,*.txt,*.markdown, setlocal spell wrap linebreak

"gql
autocmd BufNewFile,BufRead *.graphcool,*.prisma set filetype=graphql

"prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#parser = 'babylon'
autocmd BufWritePre *.js,*.jsx,*.mjs*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierCli
