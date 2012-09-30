" vim: tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

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

"" Play around with ack-grep
let g:ackprg="ack-grep -H --nocolor --nogroup --column"""

"" Because I used to have a recovery function that did not work and I learned
"" to save my files instead
set nobackup
set noswapfile

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


