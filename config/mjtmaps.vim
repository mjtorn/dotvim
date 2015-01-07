"" Window navigation to be a bit easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Double <Leader> is a good way to prevent fiddling with timeoutlen!
inoremap <Leader><Leader> <Leader>

"" To get NERDTree going
nmap <Leader>N :NERDTreeTabsToggle<CR>

"" Navigate into wrapped lines as if they were real lines, but skip over them
"" like expected
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

"" Also prefer Y to be congruent with C and D
nnoremap Y y$

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

"" Copy line and edit
nmap <Leader>c yyPVgcj

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

"" Fix whitespaces manually
nnoremap <Leader>fw :%s/\s\+\%#\@<!$//g<CR>

