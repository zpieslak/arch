" Tab mappings
noremap <Leader>1 :tabp<CR>
noremap <Leader>2 :tabn<CR>

" Silence search highlights
nnoremap <silent> <Leader><Space> :nohlsearch<Bar>:echo<CR>

" Toggle relativenumber
nnoremap <Leader>' :set invrelativenumber<CR>

" Typing :e %%/ when editing the file sets current directory
cnoreabbrev <expr> %% expand('%:p:h')

" Save as sudo
cnoreabbrev w!! execute 'silent! w !sudo tee % > /dev/null' <Bar> edit!

" Surpress grep output
cnoreabbrev grep silent grep
