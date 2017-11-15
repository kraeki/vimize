" update taglist
if has("autocmd")
  autocmd BufWritePost * :TlistUpdate
endif

" Taglist
map  <F4>      :TlistToggle<CR><C-W><a-right>
imap <F4>      <ESC>:TlistOpen<CR><C-W><a-right>

" taglist update
map  <S-F8>    :TlistUpdate<CR>
imap <S-F8>    <ESC>:TlistUpdate<CR>

" taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth         = 60
let Tlist_Close_On_Select  = 1
