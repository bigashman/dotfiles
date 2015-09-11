" Configure the colours for a dark background
set background=dark
" Configure the visual editor mode to insert 2 spaces for indentation
" taking this out for now...
set shiftwidth=2
" Use 256 colours
" set t_Co=256
" Use a colorscheme from ~/.vim/colors/
" colorscheme astronaut
" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
call pathogen#infect()
syntax on
filetype indent plugin on
set expandtab
set smarttab
set autoindent
set nocompatible

set tabstop=2
set softtabstop=2

" These next lines mean that hitting an unnecessary whitespace will be highlighted nicely
highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>

