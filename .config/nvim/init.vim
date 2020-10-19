filetype plugin indent on
syntax enable

set nocompatible
set rnu
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
nnoremap <Leader>d :Pydocstring<CR>

" FZF
set rtp+=~/.fzf
nnoremap <c-p> :FZF<cr>

" Silver Surfer
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  nnoremap \ :Ag<SPACE>
endif


" Jenkinsfile syntax highlighting
au BufNewFile,BufRead Jenkinsfile setf groovy

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'dense-analysis/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'juliosueiras/vim-terraform-completion'
"" Python specific
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'ambv/black'
Plug 'fisadev/vim-isort'
Plug 'mgedmin/python-imports.vim'
call plug#end()
" Run :CocInstall coc-pyright to install pyright

set background=dark
colorscheme solarized

" Ale defaults
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\ }
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
