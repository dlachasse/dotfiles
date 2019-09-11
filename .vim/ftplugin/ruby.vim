set tabstop=2 shiftwidth=2 expandtab
setlocal commentstring=#\ %s
compiler ruby

" Rubocop
nmap <Leader>rc :RuboCop<CR>

" Rspec.vim
let g:rspec_runner = "os_x_iterm"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
