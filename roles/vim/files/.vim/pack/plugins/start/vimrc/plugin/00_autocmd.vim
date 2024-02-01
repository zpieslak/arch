" Replace any CRLF to LF line endings
au BufWritePre * :set ff=unix

" Clean trailing whitespace and EOL markers
au BufWritePre * :%s/\s\+$//e

" Wrap lines in location list window
au FileType qf setlocal wrap

" Mark es6 as javascript
au BufRead,BufNewFile *.es6 setf javascript

" Mark ssh config
au BufRead,BufNewFile */.ssh/conf.d/* setf sshconfig

" Mark yaml.cloudformation as cloudformation
au BufRead,BufNewFile *.template.yaml set filetype=yaml.cloudformation

" Mark circleci config
au BufRead,BufNewFile .circleci/*.yml set filetype=yaml.circleci

" Mark env
au BufRead,BufNewFile .env* set filetype=envconfig syntax=sh

" Do not use spaces in make files
au FileType make setlocal noexpandtab
