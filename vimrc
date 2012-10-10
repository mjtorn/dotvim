" vim: tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" Needed for coffeescript
filetype plugin indent on

let g:nerdtree_tabs_focus_on_files = 1
let g:NERDTreeWinSize = 30

syn on
colors evening

set expandtab
set tabstop=2
set ruler

set noautochdir

:source ~/.vim/config/mjt.vim

autocmd BufRead /tmp/mutt* :source ~/.vim/config/mail.vim

" So vim-git works etc
let mapleader=","

"" Look at the undo tree
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_right = 1

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
" How many lines
set undoreload=10000

" Window navigation to be a bit easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Play around with ack-grep
let g:ackprg="ack-grep -H --nocolor --nogroup --column"""
nnoremap <Leader>A :Ack 
nnoremap <Leader>a :Ack 

" Compatibility, sort of, with command-t
map <Leader>t <C-p>

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
nmap ;M :source ~/.vim/config/mjt.vim<Enter>

nmap <Leader>n :NERDTreeTabsToggle<CR>

