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

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf