" Colors
set t_Co=256
set bg=dark
color zenburn
let g:zenburn_high_Contrast=1
set guifont=fixed

call pathogen#infect()

set number
set hidden
set ruler
syntax on
filetype plugin indent on
set incsearch

set undodir=~/.vimundo/
set undofile

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

set laststatus=2
set statusline=%f\ %2*%m\ %1*%h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)

nmap <F8> :TagbarToggle<CR>
map <F2> :NERDTreeToggle<CR>

set clipboard=unnamed
