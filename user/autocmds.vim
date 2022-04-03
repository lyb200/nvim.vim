
" open file where you leave the file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" auto source init.vim
augroup autosourcing
	autocmd!
	" autocmd BufWritePost $HOME/AppData/Local/nvim/init.vim source %
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" delete last trailinDTreeToggle
autocmd BufWritePre * :%s/\s\+$//e

