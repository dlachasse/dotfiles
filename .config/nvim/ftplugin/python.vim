autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

let b:ale_fixers = ['black']
let b:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1

let b:ale_linters = ['flake8']

let g:pydocstring_formatter = 'google'
