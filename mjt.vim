" vim: tabstop=4 shiftwidth=4

"""
""" http://www.tutorialhero.com/click-59484-scripting_the_vim_editor_with_vmscript.php
"""

function! ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax on
  endif
endfunction

nmap ;s :call ToggleSyntax()<Enter>

function! CapitalizeCenterAndMoveDown()
  s/\<./\u&/g
  center
  +1
endfunction

"" Meant to show how & is for accessing pseudovariables, like & for vim option, &l for local etc
nmap ]> :let &tabstop += 1<CR>:echo "tabstop:"&tabstop<CR>
nmap [< :let &tabstop -= (&tabstop > 1 ? 1 : 0)<CR>:echo "tabstop:"&tabstop<CR>



"" Listing 10
" This sucks, we're wanting DiffText instead, it's better
highlight STANDOUT term=bold cterm=bold gui=bold

let s:words = [
  \ "it's", "its",
  \ "your", "you're",
  \ "were", "we're", "where"
\ ]

" s: local to script file
let s:words_matcher = 'match DiffText /\c\<\(' . join(s:words, '\|') . '\)\>/'

function! WordCheck()
  "" Flag toggling as a variable, are we doing this already?
  "" w:check_words is local to window, window where ;p is called
  " Invert state if available, otherwise set
  let w:check_words = exists('w:check_words') ? !w:check_words : 1

  if w:check_words
    exec s:words_matcher
  else
    match none
  endif
  echo "checking highlight-words?"w:check_words
endfunction

nmap <silent>  ;p :call WordCheck()<CR>

"" Scripting in insert mode
"imap <silent> <C-D><C-D> <C-R>=strftime("%Y-%m-%d ")<CR>
"imap <silent> <C-T><C-T> <C-R>=strftime("%H:%M:%S ")<CR>

" K for kalkulation! Because C-C is used already
imap <silent> <C-k> <C-R>=string(eval(input("Calculate: ")))<CR> 

"" Listing 11 (modified)
" Extend insert-mode C-e and C-y behavior

function! LookDirection(direction)
  " Which column are we on?
  let column_num = virtcol('.')
  " WTF is this first part about?
  let target_pattern = '\%' . column_num . 'v.' 

  "" Does not work if expanded here o_O
  " Look for non-whitespaces
  "let target_pattern .= '*\S'

  " arguments prefixed by a:
  if a:direction == "up"
    let target_line_num = search(target_pattern . '*\S', 'bnW')
  else
    let target_line_num = search(target_pattern . '*\S', 'nW')
  endif

  if !target_line_num
    return ""
  else
    return matchstr(getline(target_line_num), target_pattern)
endfunction

imap <silent> <C-Y> <C-R><C-R>=LookDirection('up')<CR>
imap <silent> <C-E> <C-R><C-R>=LookDirection('down')<CR>

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

function! MoveScratchPad()
  if exists("g:mjt_scratchpad") && g:mjt_scratchpad == 1
    if winbufnr("%") != g:mjt_sp_buf
      if tabpagenr() != g:mjt_sp_tab
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

autocmd BufEnter * call MoveScratchPad()
nmap \s :call ToggleScratchpad()<CR>

" EOF

