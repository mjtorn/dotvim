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
" And do not use them because they suck
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

"imap <silent> <C-Y> <C-R><C-R>=LookDirection('up')<CR>
"imap <silent> <C-E> <C-R><C-R>=LookDirection('down')<CR>

function! TogglePaste()
  if exists("g:pasting") && g:pasting == 1
    :set nopaste
    let g:pasting = 0
    echo "nopaste"
  else
    :set paste
    let g:pasting = 1
    echo "paste"
  endif
endfunction

nmap \p :call TogglePaste()<Enter>

:source ~/.vim/mjttab.vim
:source ~/.vim/mjtabbrev.vim

" EOF
