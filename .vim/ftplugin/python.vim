set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

nmap <silent> <Leader>d :Pydocstring<CR>

" Check Python files with flake8 and pylint.
let b:ale_linters = ['pylint']
" Fix Python files with autopep8.
let g:ale_fixers = {
\   '*': ['add_blank_lines_for_python_control_statements', 'remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8']
\ }

let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=100
let g:autopep8_ignore="E111,E128,E124,E225,E302,E501,E231,E121,E226"
