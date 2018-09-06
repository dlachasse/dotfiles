" Pathogen
execute pathogen#infect('bundle/{}')
filetype plugin indent on
autocmd FileType ruby compiler ruby
autocmd BufWritePre * StripWhitespace
autocmd FileType ruby setlocal commentstring=#\ %s
syntax enable
colorscheme solarized

set tabstop=2 shiftwidth=2 expandtab
set wrap linebreak nolist
set formatoptions-=t
set textwidth=100
set colorcolumn=+1
set so=999
set number
set rnu
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
nnoremap <Leader>e :Explore<CR>
nnoremap <Leader>d :call delete(expand('%')) \| bdelete!<CR>

" FZF
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

" Rubocop
nmap <Leader>rc :RuboCop<CR>

" Silver Surfer
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  nnoremap \ :Ag<SPACE>
endif

" Rspec.vim
let g:rspec_runner = "os_x_iterm"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
