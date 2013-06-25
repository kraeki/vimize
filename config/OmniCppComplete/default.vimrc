if v:version >= 600
  filetype plugin on
  filetype indent on
else
  filetype on
endif

if v:version >= 700
  set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
  "let OmniCpp_NamespaceSearch     = 1
  "let OmniCpp_MayCompleteDot      = 1
  "let OmniCpp_MayCompleteArrow  = 1
  "let OmniCpp_MayCompleteScope  = 1
  let OmniCpp_GlobalScopeSearch   = 1
  let OmniCpp_DisplayMode         = 1
  let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
  let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
  let OmniCpp_ShowAccess          = 1 "show access in pop-up
  let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
  let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
  set completeopt=menuone,menu,longest
endif


" change color from pink (default) to green
if version >= 700
  let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
  highlight   Pmenu         ctermfg=0 ctermbg=2
  highlight   PmenuSel      ctermfg=0 ctermbg=7
  highlight   PmenuSbar     ctermfg=7 ctermbg=0
  highlight   PmenuThumb    ctermfg=0 ctermbg=7
endif




