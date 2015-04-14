" ctrlp.vim :CtrlPBuffer - show all open buffers
map  <F2>       :CtrlPBuffer<CR>
map  <leader>b  :CtrlPBuffer<CR>
imap <F2>       <ESC>:CtrlPBuffer<CR>

" Change the default command to invoke CtrlP
"let g:ctrlp_cmd = 'CtrlP'

" ignore some directories and files in ctrlp plugin
let g:ctrlp_custom_ignore = '\.git/*'

" open files in new hidden buffer in ctrlp plugin
let g:ctrlp_open_multiple_files = 'ijr'
let g:ctrlp_working_path_mode = 'wra'


" always files in new tabs instead of buffers
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
