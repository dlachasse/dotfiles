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
" let g:netrw_liststyle = 3

imap jj <Esc>

nnoremap <silent><leader>q :q<cr>
nnoremap <silent><leader>wq :wq<cr>
nnoremap <silent> <S-t> :tabnew %<CR>
nnoremap <silent> <S-tab> :tabn<CR>
nnoremap <Leader>e :Ranger<CR>
nnoremap <Leader>d :Pydocstring<CR>

" Perf Helpers
let g:loaded_matchparen        = 1
let g:loaded_matchit           = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_tarPlugin         = 1
let g:loaded_man               = 1
let g:loaded_gzip              = 1
let g:loaded_zipPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_remote_plugins    = 1

"
set nocursorcolumn
set nocursorline

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
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
"" Python specific
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'ambv/black'
Plug 'timothycrosley/isort'
Plug 'mgedmin/python-imports.vim'
Plug 'tpope/vim-fugitive'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'airblade/vim-gitgutter'
Plug 'aklt/plantuml-syntax'
Plug 'janko-m/vim-test'
Plug 'cespare/vim-toml'
Plug 'tmux-plugins/vim-tmux'
Plug 'mitsuhiko/jinja2'
Plug 'yaegassy/coc-sqlfluff', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
" Run :CocInstall coc-python to install python support

set background=dark
colorscheme solarized

" Ale defaults
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'yaml': ['yamlfix'],
\ }
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

" Ranger defaults
let g:ranger_replace_netrw = 1
