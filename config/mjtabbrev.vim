autocmd FileType python iabbrev i <C-R>=virtcol('.') == 1 ? "import" : 
  \ match(getline(line('.')), 'from') > -1 ? "import" : "i" <CR>
autocmd FileType python iabbrev f <C-R>=virtcol('.') == 1 ? "from" : "f"<CR>

autocmd FileType python iabbrev d <C-R>=(4 % (virtcol('.') - 1)) == 0 ? "def" : "d"<CR>
autocmd FileType python iabbrev c <C-R>=(4 % (virtcol('.') - 1)) == 0 ? "class" : "c"<CR>

autocmd FileType c iabbrev #d <C-R>="#define"<CR>
autocmd FileType c iabbrev #i <C-R>="#include"<CR>

