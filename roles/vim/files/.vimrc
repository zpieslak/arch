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

" Disable viminfo
set viminfo=""

" Autocmd settings
" Replace any CRLF to LF line endings
au BufWritePre * :set ff=unix

" Clean trailing whitespace and EOL markers
au BufWritePre * :%s/\s\+$//e

" Wrap lines in location list window
au FileType qf setlocal wrap

" Mark es6 as javascript
au BufRead,BufNewFile *.es6 set ft=javascript

" Mark yaml.cloudformation as cloudformation
au BufRead,BufNewFile *.template.yaml set ft=yaml.cloudformation

" Mark ssh config
au BufRead,BufNewFile */.ssh/conf.d/* setf sshconfig

" Detect filetypes and indentation based on plugin
filetype plugin indent on

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

" Ale settings
" Chek files
let g:ale_linters = {
\ 'ansible': ['ansible_lint'],
\ 'cs': ['OmniSharp'],
\ 'haskell': ['ghc'],
\ 'javascript': ['eslint'],
\ 'json' : ['jq'],
\ 'python' : ['flake8'],
\ 'ruby' : ['rubocop'],
\ 'terraform' : ['terraform'],
\ 'typescript' : ['tslint'],
\ 'typescriptreact' : ['tslint'],
\ 'yaml' : ['yamllint'],
\ 'yaml.cloudformation' : ['cloudformation'],
\}

" Fix files
let g:ale_fixers = {
\ 'cs': ['dotnet-format'],
\ 'javascript': ['eslint'],
\ 'python' : ['autopep8'],
\ 'ruby' : ['rubocop'],
\ 'json' : ['jq'],
\ 'terraform' : ['terraform'],
\ 'typescript' : ['tslint'],
\ 'typescriptreact' : ['tslint'],
\}

" Only run linters named in ale_linters settings.
" let g:ale_linters_explicit = 1

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Map Ale wrap
" nmap <silent> <A-k> <Plug>(ale_previous_wrap)
" nmap <silent> <A-j> <Plug>(ale_next_wrap)

augroup omnisharp_commands
  autocmd!
  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
augroup END
