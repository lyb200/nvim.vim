" auto -install vim-plug --------{{{1
if has('win32')
	if empty(glob('$HOME/AppData/Local/nvim/autoload/plug.vim'))
		silent !iwr -useb https://199.232.68.133/junegunn/vim-plug/master/plug.vim |
					\ ni "$HOME/AppData/Local/nvim/autoload/plug.vim" -Force
		"autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		autocmd VimEnter * PlugInstall | source $MYVIMRC
	endif
elseif has('unix')
	" for linux or macOS
	if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
		silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim
					\ https://199.232.68.133/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall | source $MYVIMRC
	endif
endif
" }}}
