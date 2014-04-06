"" Match whitespaces except where typing
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"" Highlight overfows at 80 and 100
autocmd BufWinEnter * call matchadd('ColorColumn', '\%81v', 100)
autocmd BufWinEnter * call matchadd('ColorColumn', '\%101v', 100)

