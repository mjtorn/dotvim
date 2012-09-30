" vim: tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8

call pathogen#infect()

syn on
colors evening

" So vim-git works etc
let mapleader=","

" python skeleton
:map <LEADER>pysk i# vim: tabstop=4 expandtab autoindent shiftwidth=4 fileencoding=utf-8<ENTER><ENTER><ENTER><ENTER># EOF<ENTER><ESC>kkk

" html skeleton
:map <LEADER>htsk gg:r ~/.vim/lib/html_skel.html<ENTER>ggdd5j

" test skeleton
:map <LEADER>testsk gg:r ~/.vim/lib/test_skel.py<ENTER>ggdd21j

:source ~/.vim/mjt.vim

"" Fairly good shit
"" http://code-and-hacks.blogspot.com/2009/05/recovering-after-vim-terminates.html
"" But I probably can't use DiffOrig
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

"" http://vim.wikia.com/wiki/VimTip1234
"" With renamed function name
" Find file in current directory and edit it.
function! FindAndEdit(name)
  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  " 2009-07-14: mjt: new tab
  execute ":tabnew"
  execute ":e ".l:line
endfunction
command! -nargs=1 FindAndEdit :call FindAndEdit("<args>")

"" Try to recover complete state
"" Leave open files whose contents did not match swap file
function! Recover()
  """ Set autocommand to be non-interactive! (E)dit anyway
  autocmd SwapExists * let v:swapchoice="e"
  """ Having more logic here would be helpful but it just won't work ARGH!
  "autocmd SwapExists * let v:swapchoice="e" | let swapname=v:swapname

  let raw_list=system("find . -name *sw?")
  let file_list=substitute(raw_list, "\.sw.", "", "g")
  let file_list=substitute(file_list, "\/\\.", "\/", "g")
  " Kludge around the fact vim sucks and we can't:
  " 1. set the swap file name into a variable
  " 2. use the variable to delete swap file
  let split_raw_list=split(raw_list, "\n")
  echo split_raw_list

  " Do a compare to see if this is a changed file or not
  let idx=0
  for file_name in split(file_list, "\n")
    " Get swap name through kludge
    let swapname=split_raw_list[idx]

    "" XXX: WHY THE FUCK IS THERE AT LEAST ONE EMPTY ERROR?! SOMETIMES MORE!!!
    " Error detected while processing function Recover:
    "line   28:
    "line   30:
    "line   32:

    " Recovered file
    execute ":recover " . file_name
    execute ":w " . file_name . ".recover"
    execute ":e " . file_name . ".recover"
    " Original file
    execute ":new " . file_name

    " Real work
    let difflen=strlen(system("diff -u " . file_name . " " . file_name . ".recover"))
    if difflen == 0
      execute "!rm " . swapname

      execute ":bnext"
      " XXX: Why the fuck do we have to issue two quits?
      execute ":q!"
      execute ":q!"

      execute "!rm " . file_name . ".recover"

      " XXX: Why the fuck do we lose colors here?
      execute ":syn on"
    endif

    let idx += 1

    " Open a new tab for next iteration
    execute ":tabnew"
  endfor
  " And close the last empty one
  execute ":tabclose"
endfunction
command! -nargs=0 Recover :call Recover()

""" Fix python
autocmd BufEnter *.py set tabstop=4 expandtab autoindent shiftwidth=4 fileencoding=utf-8
""" And fbml/html
autocmd BufEnter *ml set tabstop=4 expandtab autoindent shiftwidth=4 fileencoding=utf-8
""" And vim
autocmd BufEnter *vim set tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8

" Should enable pydiction
filetype plugin on
let g:pydiction_location = '/home/mjt/.vim/lib/pydiction/complete-dict'

let g:pydiction_menu_height = 20

"" no
" Ropevim too
"let ropevim_vim_completion=1

" http://blog.fluther.com/django-vim/
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType fbml set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

nnoremap <Leader>s i<Enter><Esc>

nmap ;S :source ~/.vim/plugin/scratchpad.vim<Enter>
nmap ;M :source ~/.vim/mjt.vim<Enter>


