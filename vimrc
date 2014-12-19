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
let g:insertlessly_cleanup_trailing_ws = 0
let g:insertlessly_cleanup_all_ws = 0

" Try this with conqueterm
let g:ConqueTerm_ReadUnfocused = 1

"" some neocomplete confs, taken from https://github.com/Shougo/neocomplete.vim
let g:neocomplete#enable_at_startup = 1

" Plugin key-mappings.
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"" What's wrong with jedi.vim? Need to disable it to make it work?
let g:jedi#completions_enabled=0
" This is not the droid you are looking for :(
"let g:jedi#popup_select_first = 0

"" clang?
let g:clang_library_path="/usr/lib/llvm-3.5/lib/"

"" Because I used to have a recovery function that did not work and I learned
"" to save my files instead
set nobackup
set noswapfile

"" Try to go full hipster
set relativenumber
let &number = 1

set foldcolumn=1

"" Fix some file presets
autocmd BufEnter *.py setl tabstop=4 expandtab autoindent shiftwidth=4 fileencoding=utf-8 foldmethod=syntax
autocmd BufEnter *ml setl tabstop=4 expandtab autoindent shiftwidth=4 fileencoding=utf-8
autocmd BufEnter *vim setl tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8
autocmd BufEnter *.coffee setl tabstop=2 expandtab autoindent shiftwidth=2 fileencoding=utf-8 foldmethod=indent
autocmd BufEnter *.c setl tabstop=4 expandtab autoindent shiftwidth=4 fileencoding=utf-8 foldmethod=syntax
autocmd BufEnter *.cpp setl tabstop=4 expandtab autoindent shiftwidth=4 fileencoding=utf-8 foldmethod=syntax

"" And not have folds closed by default!
set foldlevelstart=10

"" From neocomplete and http://blog.fluther.com/django-vim/
" XXX: Is markdown really html enough to use the same completions
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType fbml set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Syntastic
let g:syntastic_python_checkers = ['flake8', 'python']

" Emmet might be a bit trigger happy
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Though this doesn't indent inside the parentheses, I like it
let g:pyindent_open_paren = '&-sw'
let g:pyindent_nested_paren = '&-sw'

"" This sources everything else I want
:source ~/.vim/config/mjt.vim

