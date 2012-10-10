:set statusline=\ 
:set statusline+=%t\                                        " filename tail
:set statusline+=(%{WordCount()})\                          " word count
:set statusline+=%m\                                        " modified flag
:set statusline+=%r\                                        " readonly flag
:set statusline+=%y[%{strlen(&fenc)?&fenc:'none'},%{&ff}]\  " encoding and dos/unix
:set statusline+=%b\ (0x%B)\                                " current character, and hex
:set statusline+=%=                                         " l/r separator
:set statusline+=%c,%l/%L\                                  " location in file
:set statusline+=%P\                                        " percent through file
:set statusline+=(%{FileSize()})\                           " file size
 