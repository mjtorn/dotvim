:set statusline=
:set statusline+=\ %f\                                      " relative filename
:set statusline+=(%{WordCount()})\                          " word count
:set statusline+=%m\                                        " modified flag
:set statusline+=%r\                                        " readonly flag
:set statusline+=%y[%{strlen(&fenc)?&fenc:'none'},%{&ff}]\  " encoding and dos/unix
:set statusline+=%b\ (0x%B)\                                " current character, and hex
:set statusline+=[%{foldlevel('.')}]                        " wolf in the fold
:set statusline+=\ %{FakeMode()}\                           " mode
:set statusline+=%=                                         " l/r separator
:set statusline+=%c,%l/%L\                                  " location in file
:set statusline+=%P\                                        " percent through file
:set statusline+=(%{FileSize()})\                           " file size

