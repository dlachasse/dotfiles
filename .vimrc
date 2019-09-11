" Pathogen
execute pathogen#infect('bundle/{}')
filetype plugin indent on
syntax enable
colorscheme solarized

set nocompatible
set tabstop=2 shiftwidth=2 expandtab
set wrap linebreak nolist
set formatoptions-=t
set textwidth=100
set colorcolumn=+1
set so=999
set number
set ttyfast
set backupdir=~/.vim/_tmp
set directory=~/.vim/_tmp
set undodir=~/.vim-undo
set undofile
set undolevels=1000 "max number of changes that can be undone
set undoreload=10000 "max number lines to save for undo on buffer reload
set clipboard+=unnamed
set pastetoggle=<leader>p

let mapleader=" "
let g:netrw_liststyle = 3

imap jj <Esc>

nnoremap <silent><leader>q :q<cr>
nnoremap <silent><leader>wq :wq<cr>
nnoremap <silent> <S-t> :tabnew %<CR>
nnoremap <silent> <S-tab> :tabn<CR>
nnoremap <Leader>e :Explore<CR>

" FZF
set rtp+=/usr/local/opt/fzf
nnoremap <c-p> :FZF<cr>

" Silver Surfer
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  nnoremap \ :Ag<SPACE>
endif

" Ale defaults
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\ }
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

" Airline
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='solarized'

" Jenkinsfile syntax highlighting
au BufNewFile,BufRead Jenkinsfile setf groovy
