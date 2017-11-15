" fugitive mappings
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gl :Glog<CR>

" add git sign-off
map <leader>gS :call SignOff()<CR>

if has("autocmd")
  " delete fugitive buffer with git objects befor opening a new one
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif
