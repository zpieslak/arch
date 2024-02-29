" Syntax highlighting
syntax enable

" Turn on indentation based on filetype
filetype indent on

" Set indentation to 2 spaces
set shiftwidth=2

" Set tab width to 2 spaces
set tabstop=2

" Insert spaces on tab key
set expandtab

" Disable line wrapping
set nowrap

" Always show a status line
set laststatus=2

" Bash style autocomplete
set wildmenu
set wildmode=list:longest

" Set output encoding
set encoding=utf-8

" Set file encoding
set fileencoding=utf-8

" Set unix line endings
set ff=unix

" Highlight pattern matches while typing
set incsearch

" Highlight all search pattern matches
set hlsearch

" Show line numbers
set number

" Disable swap file creation
set noswapfile

" Show matching brackets
set showmatch

" Always show tab labels
set showtabline=2

" Shorten vim message prints
set shortmess=at

" Number of screen lines to use for the command line
set cmdheight=2

" Disable viminfo
set viminfo=""

" Show (partial) command in the last line of the screen.
set showcmd

" Show non printable characters
set list listchars=tab:\│\ ,nbsp:~

" Don't redraw while executing macros
set lazyredraw

" Select default regexp engine
set re=0

" Grep options
set grepformat=%f:%l:%c:%m

if executable('rg')
  set grepprg=rg\ --vimgrep\ --hidden\ --glob\ '!.git'
else
  set grepprg=grep\ -iInR\ -Dskip\ --exclude-dir=.git\ --exclude-dir=tmp\ --exclude-dir=log\ --exclude=tags\ $*
endif
