" vim: tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

syn on
colors evening

" So vim-git works etc
let mapleader=","

"" Split a line
nnoremap <Leader>s i<Enter><Esc>

"" Look at the undo tree
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_right = 1

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
" How many lines
set undoreload=10000

:source ~/.vim/mjt.vim

"" Play around with ack-grep
let g:ackprg="ack-grep -H --nocolor --nogroup --column"""

"" Because I used to have a recovery function that did not work and I learned
"" to save my files instead
set nobackup
set noswapfile

"" Fix some file presets
autocmd BufEnter *.py set tabstop=4 expandtab autoindent shiftwidth=4 fileencoding=utf-8
autocmd BufEnter *ml set tabstop=4 expandtab autoindent shiftwidth=4 fileencoding=utf-8
autocmd BufEnter *vim set tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8

" http://blog.fluther.com/django-vim/
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType fbml set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

nmap ;S :source ~/.vim/plugin/scratchpad.vim<Enter>
nmap ;M :source ~/.vim/mjt.vim<Enter>


