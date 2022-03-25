"      __  __       _   _       _
"     |  \/  |_   _| \ | |_   _(_)_ __ ___
"     | |\/| | | | |  \| \ \ / / | '_ ` _ \
"     | |  | | |_| | |\  |\ V /| | | | | | |
"     |_|  |_|\__, |_| \_| \_/ |_|_| |_| |_|
"            |___/

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
		silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
					\ https://199.232.68.133/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall | source $MYVIMRC
	endif
endif
" }}}

"====================== Custom Mappings ===========================
let mapleader=","
nmap , <nop>

nnoremap S :w<CR>
nnoremap Q :q<CR>
noremap <C-Q> :qa<CR>
nnoremap Y y$
vnoremap Y "+y

inoremap jk <ESC>

nmap s <nop>
nmap t <nop>
" till
noremap ti t
noremap ; :
noremap <space>; ;

" move faster
nnoremap J 5j
nnoremap K 5k
noremap H ^
noremap L $
" remap H and L function
noremap <space>h H
noremap <space>l L

nnoremap <space>j J
nnoremap <space>k K

" 使<Bs>和<CR>具有开始新的undo序列
" inoremap <C-H> <C-G>u<C-H>
" 好像会让回车不能使用好
" inoremap <CR> <C-]><C-G>u<CR>

" cursor to center of screen
nnoremap n nzz
nnoremap N Nzz

" Indentation
vnoremap < <gv
vnoremap > >gv

" Move text up and down
nmap <A-j> V:move .+1<CR>==
nmap <A-k> V:move .-2<CR>==
vmap <A-j> :move .+1<CR>==
vmap <A-k> :move .-2<CR>==
xmap <A-j> :move '>+1<CR>gv-gv
xmap <A-k> :move '<-2<CR>gv-gv

" delete all, yank all, change all
onoremap al :<c-u>normal! ggVG<CR>
nnoremap val ggVG

" system copyboard to visual select some characters.
nnoremap <leader>p "+p
vnoremap <leader>p "+p
vnoremap p "_dp

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap <C-s> :<C-u>w !sudo tee > /dev/null %
" Save a file you edited in vim without the needed permission
" :w !sudo tee %

" swatch cursor to top or end of current line
" noremap <expr>se col(".")==1?"$":"0"
" vnoremap <expr>se col(".")==1?"$h":"0"

" can maintain sustitute flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" 输入法input method will change
set noimdisable
" make :lmap and IM turn off automatically when leaving Insert mode.
autocmd! InsertLeave * set imdisable
autocmd! InsertEnter * set noimdisable
" gvim
if has("gui_running")
	set imactivatekey=C-space
	inoremap <ESC> <ESC>:set iminsert=0<CR>
endif
nnoremap <silent> <ESC> <ESC>:nohlsearch<CR>
" noremap <silent> <BS> :nohlsearch<CR>
exec "nohlsearch"

" Open the init.vim file anytime
noremap <leader>n :e $MYVIMRC<CR>

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

cnoreabbrev git Git
cnoreabbrev gitd Git diff
cnoreabbrev gits Git status
cnoreabbrev gita Git add
cnoreabbrev gitc Git commit -m '
cnoreabbrev gitp Git push
cnoreabbrev gitl Git pull
cnoreabbrev w!! <C-u>w !sudo tee > /dev/null %

" ==============Command line mode cursor movement ===========
cnoremap <C-A> <Home>       "default <C-B>
cnoremap <C-E> <End>
cnoremap <C-P> <UP>
cnoremap <C-N> <DOWN>
cnoremap <C-H> <LEFT>
cnoremap <C-L> <RIGHT>
cnoremap <M-H> <S-Left>
cnoremap <M-L> <S-Right>

" ============== Move cursor in insert mode ===========
inoremap <C-K> <UP>
inoremap <C-J> <DOWN>
inoremap <C-B> <LEFT>
" 与后面的snippet-expand 冲突
inoremap <C-L> <RIGHT>

" find and replace
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap \s :%s/\v/g<left><left>
vnoremap \s :s/\v/g<left><left>

" Tab management
" Create a new tab with tb
noremap <leader>tc :tabedit<CR>
" default gt and gT jump next and previous tab
" Move the tabs with tmn and tmp
noremap <leader>mt :-tabmove<CR>
noremap <leader>mT :+tabmove<CR>
noremap <leader>mf :0tabmove<CR>
noremap <leader>ml :$tabmove<CR>

" j, k  Store relative line number jumps in the jumplist
" if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" search adjacent duplicate words
" noremap sdw /\(\<\w\+\>\)\_s*\1
noremap \dw /\v(<\w+>)\_s*<\1><cr>

" Folding
noremap <silent> - za
noremap <silent> _ zM

" show NERDTreeToggl
nnoremap tt :NERDTreeToggle<CR>

" Opening a terminal window
noremap s/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press <leader><space> twice to jump to the next '' and edit it
" noremap <SPACE><SPACE> <Esc>/<++><CR>:nohlsearch<CR>c4l
noremap <leader>;  <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap <leader>; <Esc>/<++><CR>:nohlsearch<CR>c4l

" Toggle spelling check with sc
noremap <leader>sc :set spell!<CR>
" 定于光标之前的单词，然后为它查找第一个拼写建议
" find the first spell suggestion for it.
noremap <A-s> ea<C-x>s
inoremap <A-s> <ESC>ea<C-x>s

" 手动设置文件类型
nnoremap sf :set filetype=

" 启用光标
set mouse=a

" cnoreabbrev wrap :set wrap
" cnoreabbrev nowrap :set nowrap
set nowrap
noremap <leader>sw :set wrap<CR>
noremap <leader>sW :set nowrap<CR>

" Split windows Management
set splitbelow
set splitright
" nmap sl :set splitright<CR>:vsplit<CR>
" nmap sh :set nosplitright<CR>:vsplit<CR>
" nmap sj :set splitbelow<CR>:split<CR>
" nmap sk :set nosplitbelow<CR>:split<CR>
nmap sl :set splitright<CR>:vnew<CR>
nmap sh :set nosplitright<CR>:vnew<CR>
nmap sj :set splitbelow<CR>:new<CR>
nmap sk :set nosplitbelow<CR>:new<CR>
" show diffs side by side
set diffopt+=vertical

" ===================== START MAP Config ====================
" =                     switch window                       =
" ===========================================================
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" Terminal -- better navigate
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" ====================== exchange tab ======================
nmap sV <C-W>t<C-w>H<C-W>l
nmap sH <C-W>t<C-w>K<C-W>j
" Rotate screens
noremap srh <C-W>b<C-w>K
noremap srv <C-W>b<C-w>H

" Press to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

nmap <UP>    :resize +2<CR>
nmap <DOWN>  :resize -2<CR>
nmap <LEFT>  :vertical resize -2<CR>
nmap <RIGHT> :vertical resize +2<CR>

set nocompatible
set secure
syntax enable

"----------------Search------------------"
" highlight search.
set hlsearch
set incsearch

set ignorecase
set smartcase

set autoindent
set smartindent

set backspace=indent,eol,start

" set clipboard shared with window and vim
if has('nvim')
	set clipboard+=unnamedplus
else
	set clipboard=unnamed
endif

" File type on
filetype plugin indent on

" add matchpairs
set matchpairs+=<:>,«:»
set whichwrap+=<,>,[,]

set undolevels=5000

set wildmode=list:longest,full

" should make scrolling faster
set ttyfast
set lazyredraw

let &t_CO=256
" some version color incorrect
let &t_ut=''
" set cursor sharp
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set textwidth=0

set noswapfile

" to first nonspace column
set startofline

" delays and poor user experience.
set updatetime=100

" Don't pass message to |ins-completion-menu|.
set shortmess+=c
" split" : Also shows partial off-screen results in a preview window.
"  Works for |:substitute|, |:smagic|, |:snomagic|. |hl-Substitute|
set inccommand=split

set completeopt=longest,noinsert,menuone,noselect,preview
" Use visual bell instead of beeping.
set visualbell

set colorcolumn=100
set virtualedit=block
set termguicolors

"can change  directory
set autochdir

set hidden
set cursorline
" set cursor column

" minimal number of screen to keep above and below the cursor.
set scrolloff=5
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround

" show tab and tail
set list
" set listchars=tab:▸\ ,trail:▫
" set listchars+=nbsp:⦸   "CIRCLED reverse solidus(U+29B8)
" »(U+00BB) «(U+00AB) •(U+2022) ▷(U+25B7) →(U2192) ↲(U21b2)
set listchars=tab:\|\ ,trail:▫

if has('linebreak')
	" indent wrapped lines to match start
	set linebreak
	"Arrow pointing downwards then curving rightwards
	let &showbreak='⤷' "⤷(U+2937)
	if exists('&breakindentopt')
		"emphasize broken line by indenting them
		set breakindentopt=shift:2
	endif
endif

" Keep 1000 items in the history.
set history=1000
" always show tab page:2, only >1 files:1, never show:0
set showtabline=1
" show the cursor position.
set ruler
set showcmd
" show the possible matches just the above command line.
set wildmenu
set laststatus=2
"Makes popup menu smaller"
set pumheight=10
set notimeout
set ttimeoutlen=0

autocmd BufNewFile,BufRead * try
autocmd BufNewFile,BufRead *	set encoding=utf-8
autocmd BufNewFile,BufRead * endtry

" Convert to Unicode defaults
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
setglobal termencoding=utf-8
scriptencoding=utf-8

" za，trigger fold; zA, trigger fold recursively;
" zM，close all folds; zm, fold more: subtract v:count1 from 'foldlevel'.
" zR，open all folds. zr, reduce folding: add v:count1 to 'foldlevel'
" zn, fold none: reset 'foldenable'. All folds will be open.
" zN, fold normal.
" zM, close all folds: set 'foldlevel' to 0.  'foldenable' will be set.
" zR, Open all folds. This sets 'foldmethod' to highest fold level.

" set foldmethod=indent
set foldlevel=99
set foldenable

" Vimscript file settings ----------------{{{1
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

" save fold record and reload view.
" autocmd BufWinLeave, BufWritePre *.* mkview
" autocmd BufWinEnter *.* silent loadview

" t Auto-wrap text using textwidth
" c Auto-wrap comments using textwidth,
" inserting the current comment leader automatically.
set formatoptions-=tc

" visual-star.vim
" can make * at visual characters
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

" open file where you leave the file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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

" To configure a custom clipboard tool, set g:clipboard to a dictionary.
" For example this configuration integrates the tmux clipboard: >
if has('tmux')
	let g:clipboard = {
				\   'name': 'myClipboard',
				\   'copy': {
					\      '+': ['tmux', 'load-buffer', '-'],
					\      '*': ['tmux', 'load-buffer', '-'],
					\    },
					\   'paste': {
						\      '+': ['tmux', 'save-buffer', '-'],
						\      '*': ['tmux', 'save-buffer', '-'],
						\   },
						\   'cache_enabled': 1,
						\ }
endif

" gp for get picture 如果已经安装figlet，可以得到一个文字性的图案
if has('unix')
	noremap <leader>gp :r !figlet
endif

" auto source init.vim
augroup autosourcing
	autocmd!
	" autocmd BufWritePost $HOME/AppData/Local/nvim/init.vim source %
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" delete last trailinDTreeToggle
autocmd BufWritePre * :%s/\s\+$//e

" open the url under the cursor.
if has('unix')
	function! OpenUrlUnderCursor()
		let s:url = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
		echo s:url
		if s:url != ""
			silent exec "!open '".s:url."'" | redraw!
		else
			echo "No URL found in line."
		endif
	endfunction

	" maybe don't open in windows OS.
	map <leader>ou :call OpenUrlUnderCursor()<cr>
endif

" Plugins -- plug-vim --------------------------- {{{1
" ==================================================
" ============= vim-plug, myplugins ================
" ==================================================
if has('unix')
	call plug#begin('$HOME/.config/nvim/plugged')
else
	call plug#begin('$HOME/AppData/Local/nvim/plugged')
endif

" Treesitter need more soft
"Plug 'nvim-treesitter/nvim-treesitter'

" 起始页 the fancy Start Screen for vim
Plug 'mhinz/vim-startify'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Plug 'tpope/vim-vinegar'

" file navigation
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc.
" on the fly for both vim and neovim.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Rooter changes the working directory to the project root
" when you open a file or directory.
Plug 'airblade/vim-rooter'
" <c-p> :Leaderf file
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

if has('unix')
	" Make Ranger running in a floating window to communicate with Neovim via RPC
	Plug 'kevinhwang91/rnvimr'
	" 在vim和neovim中整合Ranger，这两个是否有冲突？
	Plug 'francoiscabrol/ranger.vim'
	" If you use neovim, you have to add the dependency to the plugin bclose.vim:
	Plug 'rbgrouleff/bclose.vim'
endif

" 终端管理，使用(neo)vim中的浮动或弹窗的终端 Terminal manager for (neo)vim
Plug 'voldikss/vim-floaterm'

" Jump to any definition and references, IDE madness without overhead
Plug 'pechorin/any-jump.vim'
" Extended f, F, t and T key mappings for Vim. maybe don't work.
Plug 'rhysd/clever-f.vim'

" Taglist: Viewer & Finder for LSP symbols and tags
Plug 'liuchengxu/vista.vim'

" Format code with one button press (or automatically on save).
" a list of formatprograms that are supported by default
Plug 'Chiel92/vim-autoformat'
" codefmt is a utility for syntax-aware code formatting.
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" auto set indent settings.
Plug 'tpope/vim-sleuth'
" Best syntax and indentation support. Hand-selected language packs.
Plug 'sheerun/vim-polyglot'

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
" HTML5 + inline SVG omnicomplete function, indent and syntax for Vim.
" Based on the default htmlcomplete.vim.
" This plugin contributes to vim-polyglot language pack.
Plug 'othree/html5.vim'
" The plugin is designed to automatically rename closing HTML/XML tags
" when editing opening ones (or the other way around).
Plug 'AndrewRadev/tagalong.vim'
" 用于文本过滤和对齐的vim脚本。其原理是使用正则进行分割，然后对齐。
" <leader>gt <regex> to align
Plug 'godlygeek/tabular'
Plug 'alvan/vim-closetag'	"default key > or >>
" A Vim syntax highlighting plugin for JavaScript and Flow.js
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Vim syntax highlighting for Vue components.
Plug 'posva/vim-vue'

" live server, plugin for live html, css, and javascript editing in vim
" bracey highlights all the elements selected by the css rule under the cursor.
" Any changes to a css file will automatically reload the css file in the browser
" if it contains no errors
Plug 'turbio/bracey.vim'

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" Semshi provides semantic highlighting for Python in Neovim.
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
" Text objects, folding, and more for Python and other indented languages.
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
"为 Markdown 生成 TOC 的 Vim 插件
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
" 对部分文件进行自动编号或重复插入 - or *
Plug 'dkarter/bullets.vim'

" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
" Vim script for text filtering and alignment
Plug 'godlygeek/tabular' " tab or :Tabularize <regex> to align
" <a-l> and <c-g>c (insert) to toggle capslock，切换大小写
Plug 'tpope/vim-capslock'
Plug 'gcmt/wildfire.vim'	" can quickly select the closest text object
Plug 'tpope/vim-repeat'		" using the . command after a plugin map
" Visual-Multi (VM in short) is a multiple selections/cursors plugin.
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Find & Replace
" Far.vim makes it easier to find and replace text through multiple files.
Plug 'brooth/far.vim'  ", { 'on': ['F', 'Far', 'Fardo'] }
" Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'
" abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word
" Substitute: Child to Adult use the command :S or :Subvert/child{,ren}/adult{,s}/g
" Coercion: Want to turn fooBar into foo_bar? Press crs (coerce to snake_case).
" MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru), dash-case (cr-),
" dot.case (cr.), space case (cr<space>), and Title Case (crt) are all just 3 keystrokes away.
Plug 'tpope/vim-abolish'
" Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode
" so you can see the contents of the registers.
" 寄存器面板
Plug 'junegunn/vim-peekaboo'

" easymotion
Plug 'easymotion/vim-easymotion'

" 输入法自动切换, for linux
Plug 'brglng/vim-im-select'

" 翻译，暂时不用，基本上是网速太慢的提示
Plug 'voldikss/vim-translator'

" 显示或隐藏mark, Plugin to toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

" theme
Plug 'ajmwagar/vim-deus'
Plug 'morhetz/gruvbox'

" Status line
" Plug 'theniceboy/eleline.vim'
" Plug 'liuchengxu/eleline.vim'
Plug 'ojroques/vim-scrollstatus'
Plug 'nvim-lualine/lualine.nvim'
" Cool Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" General Highlighter
" windows system has some problem, can't works.
"Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" for automatically highlighting other uses of the current word under the cursor
Plug 'RRethy/vim-illuminate'

" fuzzy file finder
" Plug 'kien/ctrlp.vim'

" Auto Complete
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" for insert mode completion of words in adjacent tmux panes
"Just enter insert mode, start typing any word you see and
"press <C-X><C-U> to the trigger user defined insert mode completion.
" Plug 'wellle/tmux-complete.vim'   " 使用时在js文件有错误提示
" Plug 'christoomey/vim-tmux-navigator'

" Fugitive is the premier Vim plugin for Git.
" The crown jewel of Fugitive is :Git (or just :G), which calls any arbitrary Git command.
" :Git add :Git commit :Git diff :Git mergetool
Plug 'tpope/vim-fugitive'
" A git commit browser in Vim
Plug 'junegunn/gv.vim'
" 使用符合提示git管理的文件是否增加、删除和修改
Plug 'mhinz/vim-signify'
" GitHub extension for fugitive.vim
Plug 'tpope/vim-rhubarb'
" Plugin for calling lazygit from within neovim.
Plug 'kdheepak/lazygit.nvim'

" syntax check/linter
Plug 'vim-syntastic/syntastic'

" Better Comments
Plug 'tpope/vim-commentary'

" The ultimate snippet solution for Vim.使用coc-snippets 后这个暂时不用。
Plug 'SirVer/ultisnips'
" vim-snippets
Plug 'honza/vim-snippets'
" 最近发现的两个snippests
" Plug 'rafamadriz/friendly-snippets'
" Plug 'L3MON4D3/LuaSnip'

" Undo Tree
Plug 'mbbill/undotree'

" Pairs of handy bracket mappings
" A mnemonic for the "a" commands is "args" and for the "q" commands is "quickfix".
" has more than 20 [\] commands. eg.
" [a :previous, [A :first, [b bprevious [t : tnext, [T :tfirst, [p :cprevious etc.
" [e Exchange the current line with [count] lines above it.
Plug 'tpope/vim-unimpaired'

" code debug
" Plug 'puremourning/vimspector'

" See what keys do like in emacs, need more config
" On-demand lazy load
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" " This nvim-plugin is just a wrapper for vim-which-key to simplify setup in lua.
" Plug 'AckslD/nvim-whichkey-setup.lua'

" A high-performance color highlighter for Neovim which has no external dependencies!
Plug 'norcalli/nvim-colorizer.lua'

" 在默认浏览器中打开url
" Plug 'dhruvasagar/vim-open-url'
Plug 'lyb200/vim-open-url'

" 中文vim文档
" Plug 'yianwillis/vimcdoc'

call plug#end()
" }}}

" ##############################################################
" #                      Plugins Config                        #
" ##############################################################

" ########################## START ###########################
" #               coc.nvim config more plugins               #
" ############################################################
let g:coc_global_extensions = [
			\ 'coc-marketplace',
			\ 'coc-actions',
			\ 'coc-diagnostic',
			\ 'coc-flutter-tools',
			\ 'coc-gitignore',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-explorer',
			\ 'coc-snippets',
			\ 'coc-emmet',
			\ 'coc-lists',
			\ 'coc-prettier',
			\ 'coc-pyright',
			\ 'coc-python',
			\ 'coc-stylelint',
			\ 'coc-syntax',
			\ 'coc-tasks',
			\ 'coc-todolist',
			\ 'coc-translator',
			\ 'coc-tslint-plugin',
			\ 'coc-tsserver',
			\ 'coc-vetur',
			\ 'coc-vimlsp',
			\ 'coc-flutter-tools',
			\ 'coc-lua',
			\ 'coc-yank'
			\ ]

" \ 'coc-yaml',

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use alt-c or ctrl-o to trigger Completion.
if has('unix')
	inoremap <silent><expr> <C-e> coc#refresh()
else
	inoremap <silent><expr> <C-e> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" come from cw's config
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" 使用emmet时，需要 ctrl + enter 来触发emmet expand
" may use other keys.
" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab split<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>y :<C-u>CocList -A --normal yank<cr>

" Use to K[ey] to show documentation in preview window.
" 似乎与默认K的功能一样
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <c-c> :CocCommand<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" 但是，以上的两条配置，niceboy自己的配置如下：
" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<cr>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>CocActionsOpenFromSelected<cr>

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold   :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR     :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" coc-explorer config
nmap te :CocCommand explorer<CR>

" ===
" === coc-translator
" ===
" popup
nmap <leader>tp <Plug>(coc-translator-p)
vmap <leader>tp <Plug>(coc-translator-pv)
" replace
nmap <leader>tr <Plug>(coc-translator-r)
vmap <leader>tr <Plug>(coc-translator-rv)

" coc-vimslp config
let g:markdown_fenced_languages=[
			\ 'vim',
			\ 'help'
			\]

let g:snips_author = "Sameul"
autocmd BufRead,BufNewFile tsconfig.json set FileType=jsonc

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>-  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>=  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ######################## END ###############################
" #               coc.nvim config more plugins               #
" ############################################################
"colorscheme atom-dark
colorscheme deus


" ===
" === ultisnips
" ===
" Trigger configuration. You need to change this to something other
" than <tab> if you use some plugin.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsExpandTrigger="<c-cr>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsJumpBackwardTrigger="<c-p>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Split the window vertically or horizontally depending on context.
" let g:UltiSnipsEditSplit="context"

" ===
" === Undotree
" ===
noremap <leader>ud :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

" ===
" === AutoFormat
" ===
nnoremap \f :Autoformat<CR>
let g:formatdef_custom_js = '"js-beautify -t"'
let g:formatters_javascript = ['custom_js']
au BufWrite *.js :Autoformat

" ===
" === any-jump
" ===
" In normal or visual mode.
" Just place you cursor on any variable/class/constant/name/symbol and press \j or <leader>j.
" You can also use visual mode to select proper keyword (j also works in visual mode)
" With :AnyJumpArg myKeyword command you can manually write what you want to be searched for.
" Normal mode: Jump to definition under cursore
nnoremap \j :AnyJump<CR>
" Visual mode: jump to selected text in visual mode
xnoremap \j :AnyJumpVisual<CR>
" Normal mode: open previous opened file (after jump)
nnoremap \ab :AnyJumpBack<CR>
" Normal mode: open last closed search window again
nnoremap \al :AnyJumpLastResults<CR>

let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9
" Disabling default any-jump keybindings:
let g:any_jump_disable_default_keybindings = 0
" Prefered search engine: rg or ag
" let g:any_jump_search_prefered_engine = 'rg'


" ===
" === Closetags
" ===
noremap \c :CloseTagToggleBuffer

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
			\ 'typescript.tsx': 'jsxRegion,tsxRegion',
			\ 'javascript.jsx': 'jsxRegion',
			\ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'


" ===
" === Closetags
" ===
"lua require'colorizer'.setup()


" ===
" === Limelight
" ===
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ===
" === goyo
" ===
" noremap <C-g> :Goyo<CR>

function! s:goyo_enter()
	" if executable('tmux') && strlen($TMUX)
	"   silent !tmux set status off
	"   silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	" endif
	set noshowmode
	set noshowcmd
	set scrolloff=999
	Limelight
	set nocursorline
endfunction

function! s:goyo_leave()
	" if executable('tmux') && strlen($TMUX)
	"   silent !tmux set status on
	"   silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	" endif
	set showmode
	set showcmd
	set scrolloff=5
	Limelight!
	set cursorline
endfunction


" ===
" === Wildfire_objects
" ===
" in this example, html and xml share the same text objects
let g:wildfire_objects = {
			\ "*" : ["i'", 'i"', "i)", "i]", "i}"],
			\ "html,xml" : ["at", "it"],
			\ }
" Select the next closest text object
map so <Plug>(wildfire-fuel)
" Select the previous closest text object
" map sO <Plug>(wildfire-water)

" ===
" === vim-commentary
" ===
" if a file type isn't supported! Relax! You just have to adjust 'commentstring':
" autocmd FileType apache setlocal commentstring=#\ %s

" ===
" === vim-easy-align
" ===
" Predefined delimiter key, such as
"	<Space>, `=`, `:`, `.`, `|`, `&`, `#`, and `,`.
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ===
" === vim-closetag
" ===
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'


" ===
" === vim-vue
" ===
" You can trim down which pre-processors to use by setting g:vue_pre_processors
"		to a whitelist of languages to support:
"let g:vue_pre_processors = ['pug', 'scss']
" To disable pre-processor languages altogether (only highlight HTML, JavaScript, and CSS):
"let g:vue_pre_processors = []
" Available pre-processors are:
"		coffee, haml, handlebars, less, pug, sass, scss, slm, stylus, typescript
" When g:vue_pre_processors is set to 'detect_on_enter' instead of a list,
"		vim-vue will detect the pre-processors used when a file is opened,
"		and load only their syntax files.
let g:vue_pre_processors = 'detect_on_enter'


" ===
" === turbio/bracey
" ===
" bracey won't do anything until it is explicitly called
":Bracey
" this starts the bracey server and optionally opens your default web browser to bracey's address.
"		if you have an html file open as your current buffer,
"		it will be displayed and you may begin editing it live.
":BraceyStop
" will shutdown the server and stop sending commands
":BraceyReload
" force the current web page to be reloaded
":BraceyEval [args]
" if argument(s) are given then evaluate them as javascript in the browser.
" Otherwise, evaluate the entire buffer (regardless of its filetype).

" ===
" === Snippets Markdown-Settings
" ===
" source $HOME/AppData/Local/nvim/plugged/vim-snippets/snippets/**.snippets
" Auto spell
autocmd BufRead,BufNewFile *.md setlocal spell
" md shortcut for only markdown
if has('unix')
	source $HOME/.config/nvim/md-snippets.vim
else
	source $HOME/AppData/Local/nvim/md-snippets.vim
endif

" ===
" === vim-instant-markdown
" ===
nnoremap <leader>mp  :InstantMarkdownPreview<CR>
nnoremap <leader>tft :TableFormat<CR>
nnoremap <leader>ms  :InstantMarkdownStop<CR>

let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
let b:table_mode_corner='+'
" 可以把其他格式转换为table格式，:Tableize  , 默认是 ,
" 也可以使用不同的分隔符，:Tableize/{pattern}，例如，:Tableize/;
"let g:table_mode_disable_mappings = 1
" 在插入模式下，使用 || 或 __, 快速启用 / 禁用 表格模式table mode：
function! s:isAtStartOfLine(mapping)
	let text_before_cursor = getline('.')[0 : col('.')-1]
	let mapping_pattern = '\V' . escape(a:mapping, '\')
	let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
	return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
			\ <SID>isAtStartOfLine('\|\|') ?
			\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
" inoreabbrev <expr> __
"           \ <SID>isAtStartOfLine('__') ?
"           \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" ===
" === vim-markdown-toc
" ===
" :GenTocGFM  --> 用于生成GFM连接格式的目录.
" :GenTocRedcarplet --> 用于生成Redcarplet连接格式的目录.
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" ===
" === Bullets.vim
" ===
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]
" 启用或禁用默认的key mapping
" let g:bullets_set_mappings = 0 " default = 1
" Add a leader key before default mappings:
" let g:bullets_mapping_leader = '<M-b>'
" Set <M-b> to the leader before all default mappings:
" Example: renumbering becomes `<M-b>gN` instead of just `gN`

" 映射
" Insert new bullet in INSERT mode: <cr> (Return key)
" Same as in case you want to unmap in INSERT mode (compatibility depends on your terminal emulator): <C-cr>
" Insert new bullet in NORMAL mode: o
" Renumber current visual selection: gN
" Renumber entire bullet list containing the cursor in NORMAL mode: gN
" Toggle a checkbox in NORMAL mode: <leader>x
" Demote a bullet (indent it, decrease bullet level, and make it a child of the previous bullet):
"     NORMAL mode: >>
"     INSERT mode: <C-t>
"     VISUAL mode: >
" Promote a bullet (unindent it and increase the bullet level):
"     NORMAL mode: <<
"     INSERT mode: <C-d>
"     VISUAL mode: >

" ===
" === vim-visual-multi
" ===
" select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
" press n/N to get next/previous occurrence, press [/] to select next/previous cursor
" press q to skip current and get next occurrence
" press Q to remove current cursor/selection
" in cursor mode commands work as they would in normal mode
" in extend mode commands work as they would in visual mode
" press Tab to switch between «cursor» and «extend» mode
" Mouse mappings (also permanent) can be enabled with:
let g:VM_mouse_mappings = 1

" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 700
" hi illuminatedWord cterm=undercurl gui=undercurl
augroup illuminate_augroup
	autocmd!
	autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
augroup END
" augroup illuminate_augroup
"     autocmd!
"     autocmd VimEnter * hi link illuminatedWord CursorLine
" augroup END

" ===
" === nvim-colorizer.lua
" ===
lua require 'colorizer'.setup()

" ===
" === AutoFormat vim-codefmt
" ===
augroup autoformat_settings
	" autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
	" autocmd FileType dart AutoFormatBuffer dartfmt
	" autocmd FileType go AutoFormatBuffer gofmt
	" autocmd FileType gn AutoFormatBuffer gn
	autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	autocmd FileType java AutoFormatBuffer google-java-format
	autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	" autocmd FileType rust AutoFormatBuffer rustfmt
	autocmd FileType vue AutoFormatBuffer prettier
augroup END

" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }
" function! NearestMethodOrFunction() abort
"		return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15

" Show the nearest method/function in the statusline
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
" set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" ===
" === Far.vim
" ===
" shortcut for far.vim find
nnoremap <silent> tf  :Farf<cr>
vnoremap <silent> tf  :Farf<cr>
" shortcut for far.vim replace
nnoremap <silent> tr  :Farr<cr>
vnoremap <silent> tr :Farr<cr>

" :Far {pattern} {replace-with} {file-mask} [params]
" Find the text to replace.Similar to :substitute command.The auguments are separated by space(" ").
" To escape space use "\s" or "\ ", "\"", to escape backslash use "\\\\".

" :F {pattern} {file-mask} [params]  |  Find only.

" :Farr foo bar **/*.py  | Uninterative Farr.

" :Farr [params]         | Interative Far.
" Shows searching modes in the status bar (regex, case sensitive, word boundary, replace).
" Modes can be toggled by the key mapping it prompted. Allows to enter {pattern}, {replace-with}
" and {file-mask} one after the other.

" :Farf [params]
" Interative F. The interaction is similar to Farr. Commands in the searching result window

" :Fardo [params]
" Runs the replacement task. The shortcut for it is s (substitute).
" :Farundo [params]
" Undo the recurrent replacement. The shortcut for it is u (undo).
" It is available when set let g:far#enable_undo=1.

" :Refar [params]
" Refar reruns Far or Farp with the same arguments or you can change any via [params].

" ===
" === tabular
" ===
" 在命令行输入的正则作为分隔符，然后插入空格对齐字段
" 可以不指定range，会自动匹配指定的正则的行，如果后面不指定正则，会使用前面的正则。
vmap tab :Tabularize /
nmap tab :Tabularize /
" :Tabularize /<regexp>/[flagn...]
" flag: l, r, or c(for left, right, center), n 代表下一个字段前面的空格数量。


" Compile function (,ru for run) ---------------{{{1
noremap <leader>ru :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		:FloatermNew python3 %
		" set splitbelow
		" :sp
		" :term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		:FloatermNew export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
		" set splitbelow
		" :sp
		" :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		:FloatermNew go run .
		" set splitbelow
		" :sp
		" :term go run .
	elseif &filetype == 'lua'
		if has('unix')
			:FloatermNew lua54 %
		else
			:FloatermNew c:\lua_bin/lua54 %
		endif
	endif
endfunc
"}}}

" ===
" === FZF
" ===
if has('unix')
	set runtimepath+=$HOME/.config/.fzf/bin
else
	set runtimepath+=$HOME/AppData/Local/nvim
endif
noremap <silent> <leader>sf :Files<CR>
noremap <silent> <leader>sg :Rg<CR>
noremap <silent> <leader>sh :History<CR>
noremap <silent> <leader>sH :History:<CR>
"noremap <C-t> :BTags<CR>
noremap <silent> <leader>sl :Lines<CR>
noremap <silent> <leader>sb :Buffers<CR>
noremap <silent> <leader>sd :BD<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
	redir => list
	silent ls
	redir END
	return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
	execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
			\ 'source': s:list_buffers(),
			\ 'sink*': { lines -> s:delete_buffers(lines) },
			\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
			\ }))

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" ===
" === Leaderf
" ===
nnoremap <c-p> :Leaderf file<CR>
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
" let g:Lf_CommandMap = {
" \   '<C-k>': ['<C-u>'],
" \   '<C-j>': ['<C-e>'],
" \   '<C-]>': ['<C-v>'],
" \   '<C-p>': ['<C-n>'],
" \}
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
			\ 'dir': ['.git', 'vendor', 'node_modules'],
			\ 'file': ['__vim_project_root']
			\}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0

" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> <leader>rt :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
tnoremap <silent> <leader>rt :<C-\><C-n>:RnvimrToggle<CR>
let g:rnvimr_action = {
			\ '<C-t>': 'NvimEdit tabedit',
			\ '<C-x>': 'NvimEdit split',
			\ '<C-v>': 'NvimEdit vsplit',
			\ 'gw': 'JumpNvimCwd',
			\ 'yw': 'EmitRangerCwd'
			\ }
let g:rnvimr_layout = { 'relative': 'editor',
			\ 'width': &columns,
			\ 'height': &lines,
			\ 'col': 0,
			\ 'row': 0,
			\ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" ===
" === vim-abolish
" ===
" you can use :S --> :Subvert


" ===
" === ranger
" ===
let g:ranger_map_keys = 0
map <leader>ra :Ranger<CR>
map <leader>rnt :RangerNewTab<CR>
" Ranger // open current file by default
" RangerCurrentFile // Default Ranger behaviour
" RangerCurrentDirectory
" RangerWorkingDirectory

" // open always in new tabs
" RangerNewTab
" RangerCurrentFileNewTab
" RangerCurrentDirectoryNewTab
" RangerWorkingDirectoryNewTab

" // open tab, when existant or in new tab when not existant
" RangerCurrentFileExistingOrNewTab
" RangerCurrentDirectoryExistingOrNewTab
" RangerWorkingDirectoryExistingOrNewTab


" ===
" === clever-f
" ===
" controls to search a character across multi lines or not.
" set it to 1 to search a character only in current line.
let g:clever_f_across_no_line = 0
" controls whether or not searches are case-insensitive.
" 1 for case-inseitive
let g:clever_f_ignore_case = 1
" controls whether searches are smart case or not
" set it to 1 to enable searching by smart case.
let g:clever_f_smart_case = 1
" timeout
let g:clever_f_timeout_ms = 1000
" Repeat last input
" let g:clever_f_repeat_last_char_inputs = ["\<CR>", "\<Tab>"]
" If you want to show a prompt when you input a character for clever-f
" let g:clever_f_show_prompt = 1

" ===
" === auto-pairs
" ===
" inoremap <buffer> <silent> <CR> <C-R>=AutoPairsSpace()<CR>
" Map <CR> to insert a new indented line if cursor in (|), {|}, [|], '|', "|"
inoremap <buffer> <silent> <CR> <C-R>=AutoPairsReturn()<CR>
" Map <BS> to delete brackets and quotes in pair
inoremap <buffer> <silent> <BS> <C-R>=AutoPairsDelete()<CR>
" System Shortcuts:
" <CR> : Insert new indented line after return if cursor in blank brackets or quotes.
" <BS> : Delete brackets in pair
" <M-p>: Toggle Autopairs (|g:AutoPairsShortcutToggle|)
" <M-e>: Fast Wrap (|g:AutoPairsShortcutFastWrap|)
" <M-n>: Jump to next closed pair (|g:AutoPairsShortcutJump|)
" <M-b>: BackInsert (|g:AutoPairsShortcutBackInsert|)

" ===
" === vim-easymotion
" ===
" Set to 0 will disable the default mappings
let g:EasyMotion_do_mapping = 1
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
" keep cursor colum JK motion
let g:EasyMotion_startofline = 0
" map tj  <Plug>(easymotion-sol-j)
" map tk  <Plug>(easymotion-sol-k)
map sw  <Plug>(easymotion-bd-W)
" go to search 2 chars<cr>, gs default for go to sleep.
nmap ss <Plug>(easymotion-s2)
xmap ss <Plug>(easymotion-s2)
omap sz <Plug>(easymotion-s2)

" ===
" === tpope/vim-capslock
" ===
imap <a-l> <C-O><Plug>CapsLockToggle
set statusline^=%{exists('*CapsLockStatusline')?CapsLockStatusline():''}

" ===
" === vim-xkbswitch
" ===
" Basic configuration requires only 1 line in your .vimrc:
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = 'C:/Nervim_xkbswitch/libxkbswitch32.dll'

" ===
" === vim-translator
" ===
let g:translator_default_engines=['bing', 'haici', 'youdao']
" Echo translation in the cmdline
nmap <silent> \tc <Plug>Translate
vmap <silent> \tc <Plug>TranslateV
" Display translation in a window
nmap <silent> \tw <Plug>TranslateW
vmap <silent> \tw <Plug>TranslateWV
" Replace the text with translation
nmap <silent> \tr <Plug>TranslateR
vmap <silent> \tr <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> \tx <Plug>TranslateX
" 一旦翻译窗口打开，<C-w>p to jump into it and again to jump back
" 有一个函数可以滚动窗口 only works in neovim.
nnoremap <silent><expr> <M-y> translator#window#float#has_scroll() ?
			\ translator#window#float#scroll(1) : "\<M-f>"
nnoremap <silent><expr> <M-u> translator#window#float#has_scroll() ?
			\ translator#window#float#scroll(0) : "\<M-f>"

" ===
" === vim-open-url
" ===
" gB: Open url under cursor in the default web browser.
" s<CR>: Search word under cursor using default search engine(baidu)
" sb: baidu search word under cursor in the default web browser
" sm: bing search word under cursor in the default web browser
" <leadr>gt: 把选择的或光标下的单词送到百度翻译页面

" ===
" === vim-peekaboo
" ===
" g:peekaboo_window				vert bo 30new		Command for creating Peekaboo window
" g:peekaboo_delay				0 (ms)					Delay opening of Peekaboo window
" g:peekaboo_compact			0 (boolean)			Compact display
" g:peekaboo_prefix				Empty (string)	Prefix for key mapping (e.g. <leader>)
" g:peekaboo_ins_prefix		Empty (string)	Prefix for insert mode key mapping (e.g. <c-x>)

" ===
" === vim-signify
" ===
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk

" When you jump to a hunk, show "[Hunk 2/15]" by putting this in your vimrc:
autocmd User SignifyHunk call s:show_current_hunk()

function! s:show_current_hunk() abort
	let h = sy#util#get_hunk_stats()
	if !empty(h)
		echo printf('[Hunk %d/%d]', h.current_hunk, h.total_hunks)
	endif
endfunction

" ===
" === gv.vim
" ===
" Commands
"     :GV to open commit browser
"         You can pass git log options to the command, e.g. :GV -S foobar -- plugins.
nnoremap <leader>gv :GV<cr>
"     :GV! will only list commits that affected the current file
"     :GV? fills the location list with the revisions of the current file

" :GV or :GV? can be used in visual mode to track the changes in the selected lines.

" Mappings
"     o or <cr> on a commit to display the content of it
"     o or <cr> on commits to display the diff in the range
"     O opens a new tab instead
"     gb for :GBrowse
"     ]] and [[ to move between commits
"     . to start command-line with :Git [CURSOR] SHA à la fugitive
"     q or gq to close

" ===
" === lazygit.nvim
" ===
nnoremap <leader>lg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support

" ===
" === lualine.nvim
" ===
lua << END
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
		},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
		},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
		},
	tabline = {},
	extensions = {}
	}
END
" component_separators = { left = '', right = ''},

" ===
" === vim-floaterm
" ===
nnoremap <silent> <leader>fc  :FloatermNew<CR>
tnoremap <silent> <leader>fc  <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <leader>fp  :FloatermPrev<CR>
tnoremap <silent> <leader>fp  <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <leader>fn  :FloatermNext<CR>
tnoremap <silent> <leader>fn  <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <leader>ff  :FloatermFirst<CR>
tnoremap <silent> <leader>ff  <C-\><C-n>:FloatermFirst<CR>
nnoremap <silent> <leader>fl  :FloatermLast<CR>
tnoremap <silent> <leader>fl  <C-\><C-n>:FloatermLast<CR>
nnoremap <silent> <leader>ft  :FloatermToggle<CR>
tnoremap <silent> <leader>ft  <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_width = 0.6
" let g:floaterm_height = 0.6
let g:floaterm_height = 0.4
let g:floaterm_gitcommit = 'floaterm'
let g:floaterm_autoinsert = 1
let g:floaterm_wintitle = 0
let g:floaterm_autoclose = 0
let g:floaterm_wintype = 'split'
let g:floaterm_position = 'botright'
" let g:floaterm_position = 'rightbelow'

" ===
" === vim-im-select
" ===
let g:im_select_get_im_cmd = ['im-select']
let g:ImSelectSetImCmd = {key -> ['im-select', key]}

function! GetImCallback(exit_code, stdout, stderr) abort
    return a:stdout
endfunction

let g:ImSelectGetImCallback = function('GetImCallback')
let g:im_select_default = '1033'                      " The default value on Windows


" 输入法自动切换
let g:im_select_default = '2052'

" :options can list all configures
" :h option-list can get help.

" vim: filetype=vim :
