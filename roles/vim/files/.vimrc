" Run pathogen plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Syntax highlighting
syntax on

" Colorscheme settings
set background=dark
colorscheme solarized

" General settings
" Incremental search
set incsearch

" Show line numbers
set number

" Highlight all search pattern matches
set hlsearch

" Insert spaces on tab key
set expandtab

" Set indentation to 2 spaces
set shiftwidth=2

" Set tab width to 2 spaces
set softtabstop=2

" Convert existing tabs to spaces
retab

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

" Disable swap file creation
set noswapfile

" Show matching brackets
set showmatch

" Automatically read file, that was chanegd by external tool
set autoread

" Always show tab labels
set showtabline=2

" Shorten vim message prints
set shortmess=at

" Number of screen lines to use for the command line
set cmdheight=2

" Autocmd settings
" Replace any CRLF to LF line endings
autocmd BufWritePre * :set ff=unix

" Clean trailing whitespace and EOL markers
autocmd BufWritePre * :%s/\s\+$//e

" Wrap lines in location list window
autocmd FileType qf setlocal wrap

" Mark es6 as javascript
autocmd BufRead,BufNewFile *.es6 set filetype=javascript

" Detect filetypes and indentation based on plugin
filetype plugin indent on

" Syntastic settings
" Enable checkers
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_less_checkers = ['lessc']
let g:syntastic_sass_checkers = ['sass']
let g:syntastic_scss_checkers = ['sass', 'scss_lint']
let g:syntastic_coffee_checkers = ['coffee', 'coffeelint']
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_sh_checkers = ['checkbashisms', 'shellcheck']
let g:syntastic_haml_checkers = ['haml', 'haml_lint']

" If enabled, syntastic will do syntax checks when buffers are first loaded as well as on saving
let g:syntastic_check_on_open = 1

" Use this option to tell syntastic whether to use the |:sign| interface to mark syntax errors
let g:syntastic_enable_signs = 0

" Enable this option to tell syntastic to always stick any detected errors into the |location-list|
let g:syntastic_always_populate_loc_list = 1

" When set to 1 the error window will be automatically opened when errors are detected, and closed when none are detected.
let g:syntastic_auto_loc_list = 1

" Run eslint through npx
let g:syntastic_javascript_eslint_exe = 'npx eslint'

" Vim-markdown settings
" Set folding level
let g:vim_markdown_folding_level = 3

" Ansible-vim settings
" Highlight and brighten only instances of key= found on newlines
let g:ansible_attribute_highlight = 'ob'

" Keyboard map
:map <F7> :tabp<CR>
:map <F8> :tabn<CR>
nmap <S-Tab> <<
nmap <Tab> >>
imap <S-Tab> <Esc><<i

" Command line abbreviations
" Typing :e %%/ when editing the file sets current directory
cabbr <expr> %% expand('%:p:h')

" Silence search highlights
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
