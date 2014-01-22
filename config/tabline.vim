" :help setting-tabline tells us the tabline is a long string

function! CreateTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)

  return bufname(buflist[winnr-1])
endfunction

function! CreateTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " This determines if we are active
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " Tab page number
    let s .= '[' . i . ']'

    " The buffer (~= file) name
    let s .= CreateTabLabel(i + 1)

    if i != tabpagenr('$')
      let s .= '%#TabLineFill#'
      let s .= ' '
    endif
  endfor

  " fill the rest of the line and reset number
  let s .= '%#TabLineFill#%T'

  return s
endfunction

:set tabline=%!CreateTabLine()

