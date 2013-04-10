"" errormarker
map  <S-F5>    :ErrorAtCursor<CR>
imap <S-F5>    <ESC>:ErrorAtCursor<CR>

" errormarker settings
let errormarker_errorgroup   = "ErrorMsg"
let errormarker_warninggroup = "Todo"

" errorformat for make and errormarker
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

