" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

noremap <F3> :set number! relativenumber! \| IndentLinesToggle <CR>
inoremap <F3> <ESC>:set number! relativenumber! \| IndentLinesToggle <CR>
