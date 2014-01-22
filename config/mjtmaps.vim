"" Window navigation to be a bit easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Compatibility, sort of, with command-t
map <Leader>t <C-p>

"" To get NERDTree going
nmap <Leader>N :NERDTreeTabsToggle<CR>

"" Navigate into wrapped lines as if they were real lines
nnoremap j gj
nnoremap k gk

"" Nicer buffer scroll
nnoremap <C-E> <C-E>j
nnoremap <C-Y> <C-Y>k

imap <C-E> <ESC><C-E>i
imap <C-Y> <ESC><C-Y>i

"" Folding space like the spice
map <Space> za

"" Would appreciate Control-Enter behaving as without insert mode
"imap <C-CR> <ESC><CR>i

"" Play around with ack-grep
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <Leader>a :Ack

"" Can we do this with commentary?
if maparg('gC','n') ==# ''
  nmap gC  yypk<Plug>Commentary
endif

nmap ;C :source ~/.vim/vimrc<Enter>
nmap ;S :source ~/.vim/plugin/scratchpad.vim<Enter>
nmap ;M :source ~/.vim/config/mjt.vim<Enter>

" Stolen from mbrochh's vim-as-a-python-ide talk
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Damian Conway's dragvisual
vmap  <expr>  H   DVB_Drag('left')
vmap  <expr>  L   DVB_Drag('right')
vmap  <expr>  J   DVB_Drag('down')
vmap  <expr>  K   DVB_Drag('up')
vmap  <expr>  P   DVB_Duplicate()

" Damian Conway's vmath
vmap  <expr>  ++  VMATH_YankAndAnalyse()
nmap          ++  vip++

