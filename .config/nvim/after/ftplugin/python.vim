autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

let b:ale_fixers = ['black', 'isort']
let b:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1

let b:ale_linters = ['flake8', 'mypy']

let g:pydocstring_formatter = 'google'

" vim-test

let test#python#runner = 'pytest'
let test#neovim#term_position = 'vert'
let g:vim_isort_config_overrides = {
\   'profile': 'black',
\   'multi_line_output': 3,
\ }
nnoremap <silent><leader>tf :TestFile<CR>
nnoremap <silent><leader>tn :TestNearest<CR>
nnoremap <silent><leader>is :Isort<CR>
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
