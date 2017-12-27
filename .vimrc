" Just a basic .vimrc 🐨

"""""""""
" General
"""""""""

" File encoding
set encoding=utf8

" Number of lines to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

"""""""""
" Display
"""""""""

" Show line numbers
set nu

" Current position (includes column number)
set ruler

" Height of the command bar
set cmdheight=2

" Highlight search results
set hlsearch

" Show matching braces
set showmatch

" Syntax highlighting
syntax enable

""""""""""""""
" Text Related
""""""""""""""

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2

" Line width = 100 characters
set lbr
set tw=100

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Remove trailing whitespace
if has("autocmd")
  autocmd BufWritePre * %s/\s\+$//e
endif

