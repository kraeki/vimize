" pathogen for bundles
call pathogen#infect() 

" public setup
" ============
syntax enable

set t_Co=256 " enable 256 colors

" limits
set history=500

set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

" set c1ipboard to x-windows selection
set clipboard=unnamed

" dom't wrap lines
set nowrap

" status bar
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2 

" vim coloring
hi! User1 ctermfg=LightGrey cterm=bold ctermbg=52 guifg=Black guibg=#665555
hi! User2 ctermfg=DarkGreen cterm=bold ctermbg=52 guifg=Green guibg=#443333
hi! User3 ctermfg=DarkCyan  cterm=bold ctermbg=52 guifg=Can  guibg=#443333
hi! User4 ctermfg=DarkCyan  cterm=bold ctermbg=52 guifg=Cyan  guibg=#443333

" set leader key
let mapleader = ","

" create ctags file
set tags=tags;/
set tags+=~/.vim/stl_tags
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>
imap <F8> <ESC>:!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>


" switch buffer mappings
map <a-left> :bp<CR>
map <a-right> :bn<CR>
imap <a-left> <ESC>:bp<CR>
imap <a-right> <ESC>:bn<CR>

" shortcut to auto indent entire file
nmap <F11> 1G=G''
imap <F11> <ESC>1G=Ga''

" spell mapping and setting
"map <F9> :set spell!<CR>
"imap <F9> <ESC>:set spell!<CR>
set spelllang=de_ch

" when pressing <Home> go to first charachter in line
function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction
nnoremap <silent> <Home> :call SmartHome()<CR>
inoremap <silent> <Home> <C-O>:call SmartHome()<CR>


" let have vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" DON'T EDIT BELOW

" load default vimrc
for f in split( glob('~/.vim/config/*/default.vimrc'), '\n' )
  exe 'source' f
endfor
" load custom vimrc
for f in split( glob('~/.vim/config/*/vimrc'), '\n' )
  exe 'source' f
endfor

