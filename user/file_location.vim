" config python and perl etc. --------------{{{1
" let g:python_host_prog  = 'C:\Python27\python.exe'
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
if has('unix')
	let g:python3_host_prog = '/usr/bin/python3'
	let g:perl_host_prog = '/usr/bin/perl'
else
	let g:python3_host_prog = 'C:\Python38\python.exe'
endif
" }}}

" config nvim backup, undo and view directory ------ {{{1
" set nobackup
if has('win32')
	silent !mkdir $HOME/AppData/Local/nvim-data/backup
	silent !mkdir $HOME/AppData/Local/nvim-data/undo
	silent !mkdir $HOME/AppData/Local/nvim-data/view
else
	silent !mkdir -p $HOME/tmp/backup
	silent !mkdir -p $HOME/tmp/undo
	silent !mkdir -p $HOME/tmp/view
endif

if has('win32')
	set backupdir=$HOME/AppData/Local/nvim-data/backup
else
	set backupdir=$HOME/tmp/backup
endif

if has('mksession')
	if has('win32')
		set viewdir=$HOME/AppData/Local/nvim-data/view
	else
		set viewdir=$HOME/tmp/view
	endif
	set viewoptions=cursor,folds,slash,unix
endif

if has('persistent_undo')
	set undofile
	if has('unix')
		set undodir=$HOME/tmp/undo
	else
		" set undodir=$HOME/AppData/Local/nvim/undo,.
		set undodir=$HOME/AppData/Local/nvim-data/undo
	endif
endif
" }}}

