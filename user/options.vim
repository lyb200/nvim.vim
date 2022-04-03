" 启用光标
set mouse=a

" cnoreabbrev wrap :set wrap
" cnoreabbrev nowrap :set nowrap
set nowrap

" Split windows Management
set splitbelow
set splitright

" show diffs side by side
set diffopt+=vertical

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
set ttimeoutlen=50
set timeoutlen=500

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

" t Auto-wrap text using textwidth
" c Auto-wrap comments using textwidth,
" inserting the current comment leader automatically.
set formatoptions-=tc
