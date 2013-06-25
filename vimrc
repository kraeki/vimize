" pathogen for bundles
call pathogen#infect()

" public setup
" ============
syntax enable

" clear highlighting
highlight clear

set t_Co=256 " enable 256 colors

" limits
set history=500

" map leader key to comma (,)
let mapleader=","

" tab settings
set expandtab
set shiftwidth=2
set softtabstop=2

" indenting
set cindent
set autoindent
set smartindent

" folding
set nofoldenable

" set clipboard to x-windows selection
set clipboard=unnamed

" set fileformat to unix
set fileformat=unix

" turn on incremental search with ignore case (except explicit caps) and
" highlighting
set hlsearch
set incsearch
set ignorecase
set smartcase

" disable backup files
set nobackup

" show list instead of just completing
set wildmenu
set wildmode=longest,list

" complete options
set completeopt=menuone,menu,longest,preview

" set tag locations
set tags=tags;/
set tags+=~/.vim/tags/stl_tags

" copy up to 1000 lines from one file to another
set viminfo='1000,\"2000,s2000,h

" Set spell language
set spelllang=de_ch

" wildignore
set wildignore+=*.o,*.lo,*.la,*.obj,.git,*.pyc,*.so,*/.git/*

" Don't show currect mode
set noshowmode

" set number formats for Ctrl+A and Ctrl+X
set nrformats=alpha,octal,hex

" undo files
if version >= 703
  set undodir=~/.vim/undodir
  set undofile
endif

" ----------------------
" ---- Highlighting ----
" ----------------------

" diff highlighting
highlight DiffAdd          cterm=none ctermfg=64     ctermbg=235 gui=none guifg=Black guibg=Green
highlight DiffDelete       cterm=none ctermfg=124     ctermbg=235 gui=none guifg=Black guibg=Red
highlight DiffChange       cterm=none ctermfg=136     ctermbg=235 gui=none guifg=Black guibg=Yellow
highlight DiffText         cterm=none ctermfg=33     ctermbg=235 gui=none guifg=Black guibg=Magenta

" status line highlighting
"highlight! User1           cterm=bold ctermfg=LightGrey ctermbg=52               guifg=Black guibg=#665555
"highlight! User2           cterm=bold ctermfg=DarkGreen ctermbg=52               guifg=Green guibg=#443333
"highlight! User3           cterm=bold ctermfg=DarkCyan  ctermbg=52               guifg=Cyan  guibg=#443333
"highlight! User4           cterm=bold ctermfg=DarkCyan  ctermbg=52               guifg=Cyan  guibg=#443333


" ----------------------
" ---- Status line  ----
" ----------------------
" status line settings
set laststatus=2 " Always show the statusline
"set statusline=%4*---%1*\ %F%m%r%h%w\ %2*%{fugitive#statusline()}%1*\ %{&ff}\ %Y\ \[0x\%02.2B=\%03.3b]\ [%l,%v\ %p%%\ %Lb]\ %3*\[%F\]%1*
"set statusline=   " clear the statusline for when vimrc is reloaded
"set statusline=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
"set statusline+=%=      "left/right separator
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file


" ----------------------
" ---- Autocommands ----
" ----------------------
"
if has("autocmd")
  " set filetypes
  autocmd BufNewFile,BufRead *.gv set filetype=dot
  autocmd BufNewFile,BufRead *.feature set filetype=cucumber

  " open files at the last opened position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " automatically open and close the popup menu / preview window
  autocmd CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif

  " remove trailing whitespace on write
  autocmd BufWritePre * :%s/\s\+$//e

  " source the vimrc file after saving it
  autocmd BufWritePost .\=vimrc source $MYVIMRC

  " Delete .netrwhist ( netrw history file ) after leaving vim
  autocmd VimLeave * if filereadable(".netrwhist") | call delete(".netrwhist") | endif

  " --------
  "  mappings
  " --------

  " if FileType is c or cpp then execute make
  autocmd FileType c,cpp,cucumber  map  <F5> :w<CR>:make<CR>
  autocmd FileType c,cpp,cucumber  imap <F5> <ESC>:w<CR>:make<CR>

  " if FileType is python then start python
  autocmd FileType python          map  <F5> :w<CR>:!python "%"<CR>
  autocmd FileType python          imap <F5> <ESC>:w<CR>:!python "%"<CR>


  " if FileType is shell script then start shell script
  autocmd FileType sh              map  <F5> :w<CR>:!$SHELL "%"<CR>
  autocmd FileType sh              imap <F5> <ESC>:w<CR>:!$SHELL "%"<CR>
endif

" ------------------
" ---- Mappings ----
" ------------------

" change window
nnoremap <leader>1 1
nnoremap <leader>2 2
nnoremap <leader>3 3
nnoremap <leader>4 4

" clear search pattern
map  <S-F2>     :nohlsearch<CR>
imap <S-F2>     <ESC>:nohlsearch<CR>

""nerdtree
"map  <F3>      :NERDTreeToggle<CR>
"imap <F3>      <ESC>:NERDTreeToggle<CR>

"" signatures
"map  <S-F3>    :SignatureToggle<CR>
"map  <leader>m :SignatureToggle<CR>
"imap <S-F3>    <ESC>:SignatureToggle<CR>

"" git gutter
"map  <S-F4>    :ToggleGitGutter<CR>
"imap <S-F4>    <ESC>:ToggleGitGutter<CR>

" Note: F5 is already mapped in autocmd section

"" Shebang
"map  <S-F6>    :call SetExecutable()<CR>
"imap <S-F6>    <ESC>:call SetExecutable()<CR>

"" Doxygen
"map  <F7>      :Dox<CR>
"imap <F7>      <ESC>:Dox<CR>

" Note: Shift + F7 is already mapped in autocmd section

" ctags
map  <F8>      :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>
imap <F8>      <ESC>:!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>

" Spelling
map  <F9>      :set spell!<CR>
imap <F9>      <ESC>:set spell!<CR>

"" extradite.vim
"map  <S-F9>    :Extradite<CR>
"imap <S-F9>    <ESC>:Extradite<CR>

" Next error to F10
map  <F10>     :cn<CR>
imap <F10>     <ESC>:cn<CR>
"
" shortcut to auto indent entire file
map  <F11>     1G=G''
imap <F11>     <ESC>1G=Ga''

"" Conque shell horizontal split -> start ipython
"map  <S-F11>   :ConqueTermSplit ipython<CR>
"imap <S-F11>   <ESC>:ConqueTermSplit ipython<CR>

"" Conque Shell horizontal split -> start bash
"map  <S-F12>   :ConqueTermSplit bash<CR>
"imap <S-F12>   <ESC>:ConqueTermSplit bash<CR>

" toggle paste mode
map  <S-F3>     :set paste!<CR>

" switch buffer mappings
map  <a-left>       :bp<CR>
imap <a-left>  <ESC>:bp<CR>
map  <a-right>      :bn<CR>
imap <a-right> <ESC>:bn<CR>
map  <C-j>       :bp<CR>
imap <C-j>  <ESC>:bp<CR>
map  <C-k>      :bn<CR>
imap <C-k> <ESC>:bn<CR>

" remap code completion to Ctrl+Space
inoremap <Nul> <C-x><C-o>
"inoremap <C-@> <C-R>=SuperCleverTab()<CR>

" smart home function
function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction
nnoremap <silent> <Home> :call SmartHome()<CR>
inoremap <silent> <Home> <C-O>:call SmartHome()<CR>

" map highlighting group under cursor
map <C-S-H> :call <SID>SynStack()<CR>


" DON'T EDIT BELOW

" load default vimrc
for f in split( glob('~/.vim/config/*/default.vimrc'), '\n' )
  exe 'source' f
endfor
" load custom vimrc
for f in split( glob('~/.vim/config/*/vimrc'), '\n' )
  exe 'source' f
endfor
