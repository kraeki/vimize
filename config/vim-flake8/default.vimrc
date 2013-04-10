" Do you want to use PEP8 for python files?
let use_pep8 = 0

" vim-flake8 max line length for PEP8
let g:flake8_max_line_length = 150

" if FileType is python then map Shift + F7 to vim-flake8
autocmd FileType python          map  <S-F7> :call Flake8()<CR>
autocmd FileType python          imap <S-F7> <ESC>:call Flake8()<CR>

if use_pep8 == 1
  " if FileType is python then indent with 4 spaces instead of 2
  autocmd FileType python          setl tabstop=4 softtabstop=4 shiftwidth=4

  " call flake8 after writing a python file
  autocmd BufWritePost *.py call Flake8()
endif
