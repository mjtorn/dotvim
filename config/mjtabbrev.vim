autocmd FileType python iabbrev i <C-R>=virtcol('.') == 1 ? "import" : 
  \ match(getline(line('.')), 'from') > -1 ? "import" : "i" <CR>
autocmd FileType python iabbrev f <C-R>=virtcol('.') == 1 ? "from" : "f"<CR>

autocmd FileType python iabbrev d <C-R>=(4 % (virtcol('.') - 1)) == 0 ? "def" : "d"<CR>
autocmd FileType python iabbrev c <C-R>=(4 % (virtcol('.') - 1)) == 0 ? "class" : "c"<CR>

" :D
iabbrev <silent> CWD <C-R>=getcwd()<CR>

autocmd FileType c iabbrev #d <C-R>="#define"<CR>
autocmd FileType c iabbrev #i <C-R>="#include"<CR>

"" Navigate into wrapped lines as if they were real lines
nnoremap j gj
nnoremap k gk

nmap <C-E> <C-E>j
nmap <C-Y> <C-Y>k

imap <C-E> <ESC><C-E>i
imap <C-Y> <ESC><C-Y>i

"" Would appreciate Control-Enter behaving as without insert mode
"imap <C-CR> <ESC><CR>i

