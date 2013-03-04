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

nmap ;C :source ~/.vim/vimrc<Enter>
nmap ;S :source ~/.vim/plugin/scratchpad.vim<Enter>
nmap ;M :source ~/.vim/config/mjt.vim<Enter>

nmap <Leader>n :NERDTreeTabsToggle<CR>

"" Navigate into wrapped lines as if they were real lines
nnoremap j gj
nnoremap k gk

nmap <C-E> <C-E>j
nmap <C-Y> <C-Y>k

imap <C-E> <ESC><C-E>i
imap <C-Y> <ESC><C-Y>i

"" Folding space like the spice
map <Space> za

"" Would appreciate Control-Enter behaving as without insert mode
"imap <C-CR> <ESC><CR>i


