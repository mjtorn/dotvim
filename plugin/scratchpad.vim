"" Start with faux values, but remember on re-source
if !exists("g:mjt_sp_buf")
  let g:mjt_sp_win = -1
  let g:mjt_sp_buf = -1
  let g:mjt_sp_tab = -1
endif

function! CloseScratchpad()
  if g:mjt_sp_win > 0
    exec "tabnext" g:mjt_sp_tab
    exec g:mjt_sp_win "wincmd w"
    :hide

    " Return window
    let g:mjt_sp_win = -1
    let g:mjt_sp_tab = -1
  endif
endfunction

function! OpenScratchpad()
  " Are we closed?
  if g:mjt_sp_win == -1 && g:mjt_sp_tab == -1
    let save_eq = &equalalways
    set noequalalways
    " Open a new buffer if one does not exist
    if g:mjt_sp_buf == -1
      :new
      let g:mjt_sp_buf = winbufnr("%")
    else
      " Nevar forget how sucky evaluations in vimscript are
      exec "sb" g:mjt_sp_buf
    endif
    let &equalalways = save_eq

    " Nevar forget window
    let g:mjt_sp_tab = tabpagenr()
    let g:mjt_sp_win = winnr()

    " See about height
    let lines = getline(0, 15)
    let g:linecount = len(lines)

    if g:linecount < 4
      let g:linecount = 4
    elseif g:linecount > 14
      let g:linecount = 14
    endif
    exec "resize" (g:linecount + 1)
  endif
endfunction

function! ToggleScratchpad()
  let g:mjt_scratchpad = exists("g:mjt_scratchpad") ? !g:mjt_scratchpad : 1

  if g:mjt_scratchpad == 0
    call CloseScratchpad()
  else
    call OpenScratchpad()
  endif
endfunction

function! MoveScratchpad()
  if exists("g:mjt_scratchpad") && g:mjt_scratchpad == 1
    if winbufnr("%") != g:mjt_sp_buf && g:mjt_sp_buf != -1
      if tabpagenr() != g:mjt_sp_tab && g:mjt_sp_buf != -1
        let g:mjt_sp_swap_tab = tabpagenr()

        " Resets variables to -1
        call CloseScratchpad()
        exec "tabnext"g:mjt_sp_swap_tab
        unlet g:mjt_sp_swap_tab
        call OpenScratchpad()
      endif
    endif
  endif
endfunction

function! SetScratchpadWindow()
  if exists("g:mjt_scratchpad") && g:mjt_scratchpad == 1
    " Works because BufLeave is triggered before leaving
    if winbufnr("%") == g:mjt_sp_buf
      let g:mjt_sp_win = winnr()
    endif
  endif
endfunction

autocmd BufEnter * call MoveScratchpad()
autocmd BufLeave * call SetScratchpadWindow()
nmap \s :call ToggleScratchpad()<CR>

