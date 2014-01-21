" vim: tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8

syn on

let g:defaultTheme = "ir_black"
let g:themePath = "~/.vim/themes/"

function! SetTheme(themeName)
  let a:themePath = g:themePath . a:themeName . ".vim"
  if findfile(a:themePath) != ""
    exe "source " . a:themePath
  else
    echoe "Nothing found! " . a:themePath
  endif
endfunction

if !exists("g:colors_name")
  call SetTheme(g:defaultTheme)
endif

