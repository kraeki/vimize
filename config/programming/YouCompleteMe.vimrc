" YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/.vim/config/YouCompleteMe/ycm_config.py'
let g:ycm_confirm_extra_conf = 0

nmap <c-]> :YcmCompleter GoToDefinition<cr>
