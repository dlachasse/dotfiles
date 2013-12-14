execute pathogen#infect()
syntax on
syntax enable
set background=dark
colorscheme solarized
set nu
filetype plugin indent on
let g:neocomplcache_enable_at_startup = 1
set tabstop=2
set shiftwidth=2
set expandtab

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'thoughtbot/vim-rspec'

noremap   <Up>    ""
noremap!  <Up>    <Esc>
noremap   <Down>  ""
noremap   <Down>  <Esc>
noremap!  <Left>  ""
noremap   <Left>  <Esc>
noremap   <Right> ""
noremap!  <Right> <Esc>
