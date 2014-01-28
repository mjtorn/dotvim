" vim: tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" Needed for coffeescript
filetype plugin indent on

let g:nerdtree_tabs_focus_on_files = 1
let g:NERDTreeWinSize = 30

set modeline

" Prefer this in the statusbar, for vmath and echoes to work
set noshowmode

set expandtab
set tabstop=2
set ruler

set noautochdir

set lazyredraw
set laststatus=2

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

let g:ctrlp_custom_ignore = {
\  'file': '\v\.(pyc)$',
\ }

" Make insertlessly do less. Frees the space key for folding
let g:insertlessly_insert_spaces = 0
let g:insertlessly_backspace_past_bol = 0

" Try this with conqueterm
let g:ConqueTerm_ReadUnfocused = 1

" Could SnipMate work after all?
let g:snips_trigger_key = '<c-f>'
let g:snips_trigger_key_backwards = '<s-c-f>'

" some ycm confs
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0

"" Because I used to have a recovery function that did not work and I learned
"" to save my files instead
set nobackup
set noswapfile

"" Try to go full hipster
set relativenumber

"" Highlight overfows at 80 and 100
call matchadd('ColorColumn', '\%81v', 100)
call matchadd('ColorColumn', '\%101v', 100)

"" Fix some file presets
autocmd BufEnter *.py setl tabstop=4 expandtab autoindent shiftwidth=4 fileencoding=utf-8 foldmethod=syntax
autocmd BufEnter *ml setl tabstop=4 expandtab autoindent shiftwidth=4 fileencoding=utf-8
autocmd BufEnter *vim setl tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8
autocmd BufEnter *.coffee setl tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8 foldmethod=indent

"" And not have folds closed by default!
set foldlevelstart=10

" http://blog.fluther.com/django-vim/
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType fbml set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Though this doesn't indent inside the parentheses, I like it
let g:pyindent_open_paren = '&-sw'
let g:pyindent_nested_paren = '&-sw'

"" This sources everything else I want
:source ~/.vim/config/mjt.vim

