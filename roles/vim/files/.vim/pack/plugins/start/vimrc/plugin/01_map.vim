" Tab mappings
noremap <Leader>1 :tabp<CR>
noremap <Leader>2 :tabn<CR>

" Silence search highlights
nnoremap <silent> <Leader><Space> :nohlsearch<Bar>:echo<CR>

" Save as sudo
cnoremap w!! execute 'silent! w !sudo tee % > /dev/null' <Bar> edit!

" Typing :e %%/ when editing the file sets current directory
cabbr <expr> %% expand('%:p:h')
