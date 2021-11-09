autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set pyxversion=3
let g:vim_isort_python_version = 'python3'

let b:ale_fixers = ['black', 'isort']
let b:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1

let b:ale_linters = ['flake8']

let g:pydocstring_formatter = 'google'
