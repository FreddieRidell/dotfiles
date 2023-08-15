"javascript
let g:jsx_ext_required = 0
"let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
"let g:neomake_jsx_enabled_makers = ['eslint']
let g:javascript_plugin_flow = 1

"texty
autocmd BufRead,BufNewFile *.md,*.txt,*.markdown,*.mdx, setlocal filetype=markdown
autocmd BufRead,BufNewFile *.md,*.txt,*.markdown,*.mdx, setlocal spell wrap linebreak

"gql
autocmd BufNewFile,BufRead *.graphcool,*.prisma set filetype=graphql

autocmd BufWritePre, *.js,*.jsx,*.ts,*.tsx,*.mjs,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.mdx Prettier
"autocmd BufWritePre, *.rs Neoformat rustfmt
autocmd BufWritePre, *.res RescriptFormat

autocmd BufWritePost, *.ink !ballpoint --write % 
