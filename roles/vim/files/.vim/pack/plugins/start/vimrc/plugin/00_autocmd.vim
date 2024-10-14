augroup VimrcAutoCmd
  autocmd!

  " Replace any CRLF to LF line endings
  autocmd BufWritePre * :set ff=unix

  " Clean trailing whitespace and EOL markers
  autocmd BufWritePre * :%s/\s\+$//e

  " Wrap lines in location list window
  autocmd FileType qf setlocal wrap

  " Mark es6 as javascript
  autocmd BufRead,BufNewFile *.es6 setf javascript

  " Mark ssh config
  autocmd BufRead,BufNewFile */.ssh/conf.d/* setf sshconfig

  " Mark yaml.cloudformation as cloudformation
  autocmd BufRead,BufNewFile *.template.yaml set filetype=yaml.cloudformation

  " Mark circleci config
  autocmd BufRead,BufNewFile .circleci/*.yml set filetype=yaml.circleci

  " Mark github actions config
  autocmd BufRead,BufNewFile .github/workflows/*.yml set filetype=yaml.githubaction

  " Mark env
  autocmd BufRead,BufNewFile .env* set filetype=envconfig syntax=sh

  " Do not use spaces in make files
  autocmd FileType make setlocal noexpandtab

  " Auto open quickfix window with grep results
  autocmd QuickFixCmdPost grep redraw! | copen
augroup END
