" ===
" === auto-install vim-plug
" ===
if has('win32')
	if empty(glob('$HOME/AppData/Local/nvim/autoload/plug.vim'))
		silent !iwr -useb https://199.232.68.133/junegunn/vim-plug/master/plug.vim |
					\ ni "$HOME/AppData/Local/nvim/autoload/plug.vim" -Force
		"autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		autocmd VimEnter * PlugInstall | source $MYVIMRC
	endif
elseif has('unix')
	" for linux or macOS
	if empty(glob('~/.config/nvim/autoload/plug.vim'))
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
					\ https://199.232.68.133/junegunn/vim-plug/master/plug.vim
		"autocmd VimEnter * PlugInstall
		autocmd VimEnter * PlugInstall | source $MYVIMRC
	endif
endif
" ==================================================
" ============= vim-plug, myplugins ================
" ==================================================
if has('unix')
	call plug#begin('~/.config/nvim/plugged')
else
	call plug#begin('~/AppData/Local/nvim/plugged')
endif

" Treesitter need more soft
"Plug 'nvim-treesitter/nvim-treesitter'

" the fancy Start Screen for vim
Plug 'mhinz/vim-startify'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Plug 'tpope/vim-vinegar'

" Rooter changes the working directory to the project root
" when you open a file or directory.
Plug 'airblade/vim-rooter'

" file navigation
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc.
" on the fly for both vim and neovim.
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
" <c-p> :Leaderf file
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Make Ranger running in a floating window to communicate with Neovim via RPC
Plug 'kevinhwang91/rnvimr'

" Jump to any definition and references, IDE madness without overhead
Plug 'pechorin/any-jump.vim'

" Taglist
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
" Vim script for text filtering and alignment
Plug 'godlygeek/tabular' " gt, or :Tabularize <regex> to align
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
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
" Super-simple vim plugin for cycling through antonyms/words related to word under cursor
" gs for :Antovim<rc> switch antonyms or related word.
Plug 'jwarby/antovim'
" Vim script for text filtering and alignment
Plug 'godlygeek/tabular' " gt, or :Tabularize <regex> to align
" Ctrl+L <c-l> and <c-g>c (insert) to toggle capslock
Plug 'tpope/vim-capslock'
Plug 'gcmt/wildfire.vim'	" can quickly select the closest text object
Plug 'tpope/vim-repeat'		" using the . command after a plugin map
" Visual-Multi (VM in short) is a multiple selections/cursors plugin.
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Find & Replace
" Far.vim makes it easier to find and replace text through multiple files.
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
" Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'
" abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word
" Substitute: Child to Adult use the command :S or :Subvert/child{,ren}/adult{,s}/g
" Coercion: Want to turn fooBar into foo_bar? Press crs (coerce to snake_case).
" MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru), dash-case (cr-),
" dot.case (cr.), space case (cr<space>), and Title Case (crt) are all just 3 keystrokes away.
Plug 'tpope/vim-abolish'

" theme
Plug 'ajmwagar/vim-deus'
Plug 'morhetz/gruvbox'

" Status line
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'

" Cool Icons
"Plug 'kyazdani42/nvim-web-devicons'
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
Plug 'wellle/tmux-complete.vim'
" Plug 'christoomey/vim-tmux-navigator'

" Fugitive is the premier Vim plugin for Git.
" The crown jewel of Fugitive is :Git (or just :G), which calls any arbitrary Git command.
" :Git add :Git commit :Git diff :Git mergetool
Plug 'tpope/vim-fugitive'

" syntax check/linter
Plug 'vim-syntastic/syntastic'

" Better Comments
Plug 'tpope/vim-commentary'

" emmet
Plug 'mattn/emmet-vim'

" vim-snippets
Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" easymotion
Plug 'easymotion/vim-easymotion'
" Pairs of handy bracket mappings
" A mnemonic for the "a" commands is "args" and for the "q" commands is "quickfix".
" has more than 20 [\] commands. eg.
" [a :previous, [A :first, [b bprevious [t : tnext, [T :tfirst, [p :cprevious etc.
" [e Exchange the current line with [count] lines above it.
Plug 'tpope/vim-unimpaired'

" code debug
" Plug 'puremourning/vimspector'

" See what keys do like in emacs, need more config
"Plug 'liuchengxu/vim-which-key'

" A high-performance color highlighter for Neovim which has no external dependencies!
Plug 'norcalli/nvim-colorizer.lua'

" move!  select line or selection to move.
Plug 'valsorym/.del.vim-json'

call plug#end()

"========================  Custom Mappings ==========================="

" let g:python_host_prog  = 'C:\Python27\python.exe'
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
if has('unix')
	let g:python3_host_prog = '/usr/bin/python3'
	let g:perl_host_prog = '/usr/bin/perl'
else
	let g:python3_host_prog = 'C:\Python38\python.exe'
endif

let mapleader=","
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
			\ 'coc-lists',
			\ 'coc-prettier',
			\ 'coc-snippets',
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
			\ 'coc-yank'
			\ ]

			" \ 'coc-explorer',
			" \ 'coc-emmet',
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

" Use alt-c to trigger Completion.
if has('nvim')
	inoremap <silent><expr> <A-C> coc#refresh()
else
	inoremap <silent><expr> <A-C> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>y :<C-u>CocList -A --normal yank<cr>

" Use K[ey] to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" coc-explorer config
nmap <leader>e :CocCommand explorer<CR>

" coc-translator
nmap <leader>ts <Plug>(coc-translator-p)

" coc-vimslp config
let g:markdown_fenced_languages=[
			\ 'vim',
			\ 'help'
			\]

" Make <tab> used for trigger completion, completion confirm,
" snippet expand and jump like VSCode.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'

" may use other keys.
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" ######################## END ###############################
" #               coc.nvim config more plugins               #
" ############################################################

" Toggle on and off...
nmap <silent> <expr>  zz  FS_ToggleFoldAroundSearch({'context':1})

set nocompatible

" set nobackup
set noswapfile

if has('persistent_undo')
	set undofile
	if has('unix')
		if has('nvim')
			set undodir='~/.config/nvim/tmp/undo'
		else
			set undodir="/vimfiles/undo"
		endif
	else
		if has('nvim')
			" set undodir=~\AppData\Local\nvim\undo,.
			set undodir="~\AppData\Local\nvim\undo"
		else
			set undodir=~\vimfiles\undo,.
		endif
	endif
endif

" nnoremap / /\v
nnoremap S :w<CR>
nnoremap Q :q<CR>
noremap <C-Q> :qa<CR>
nnoremap Y y$
vnoremap Y "+y
" special ynak register 0, for 2nd visual put
vnoremap <leader>p "0p
inoremap jk <ESC>
" to first nonspace column
set startofline

" delays and poor user experience.
set updatetime=100
" Don't pass message to |ins-completion-menu|.
set shortmess+=c
" split"	 : Also shows partial off-screen results in a preview window.
"			   Works for |:substitute|, |:smagic|, |:snomagic|. |hl-Substitute|
set inccommand=split

set completeopt=longest,noinsert,menuone,noselect,preview
" Use visual bell instead of beeping.
set visualbell

set colorcolumn=100
set virtualedit=block
set termguicolors

" Split Management
set splitbelow
set splitright

"can change  directory
set autochdir

set hidden
set cursorline
" set cursorcolumn

" minimal number of screen to keep above and below the cursor.
set scrolloff=4
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4

" show tab and tail
set list
" set listchars=tab:▸\ ,trail:▫
set listchars=tab:\|\ ,trail:▫

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

" Convert to Unicode defaults
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
setglobal termencoding=utf-8
scriptencoding=utf-8

set mouse=a
" za，trigger fold; zA, trigger fold recursively;
" zM，close all folds; zm, fold more: subtract v:count1 from 'foldlevel'.
" zR，open all folds. zr, reduce folding: add v:count1 to 'foldlevel'
" set foldmethod=indent
set foldmethod=syntax
set foldlevel=99
set foldenable

" t Auto-wrap text using textwidth
" c Auto-wrap comments using textwidth,
" inserting the current comment leader automatically.
set formatoptions-=tc

"----------------Search------------------"
" highlight search.
set hlsearch
set incsearch

set ignorecase
set smartcase

set linebreak

set autoindent
set smartindent

set backspace=indent,eol,start

" set clipboard shared with window and vim
if has('nvim')
	set clipboard+=unnamedplus
else
	set clipboard=unnamed
endif
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

" add matchpairs
set matchpairs+=<:>,«:»
set whichwrap+=<,>,[,]
set noswapfile

set undolevels=5000

set wildmode=list:longest,full

syntax enable

" H key: go to the start of the line
noremap <silent> H ^
" L key: go to the end of the line
noremap <silent> L $
" exchange two command
nnoremap <silent> $ L
nnoremap <silent> ^ H

" can maintain sustitute flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

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

" split windows config
" nmap s <nop>
" ss swatch cursor to top or end of current line
noremap <expr>ss col(".")==1?"$":"0"
vnoremap <expr>ss col(".")==1?"$h":"0"
nmap sl :set splitright<CR>:vsplit<CR>
nmap sh :set nosplitright<CR>:vsplit<CR>
nmap sj :set splitbelow<CR>:split<CR>
nmap sk :set nosplitbelow<CR>:split<CR>

" Open the init.vim file anytime
noremap <leader>i :e $MYVIMRC<CR>

" find and replace
noremap \s :%s//g<left><left>
noremap <LEADER>sw :set wrap<CR>
set nowrap

set textwidth=0

" Indentation
" nnoremap < <<
" nnoremap > >>

" find adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Folding
noremap <silent> <leader>o za

nnoremap <leader>tt :NERDTreeToggle<CR>

" visual line continue move
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

if has('win32')
	" silent !mkdir  $HOME\AppData\Local\nvim\tmp\backup
	" silent !mkdir  $HOME\AppData\Local\nvim\tmp\undo
else
	silent !mkdir -p $HOME/.config/nvim/tmp/backup
	silent !mkdir -p $HOME/.config/nvim/tmp/undo
endif

" open file where you leave the file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===================== START MAP Config ====================
" =                     switch window                       =
" ===========================================================
nnoremap <C-H> :wincmd h<CR>
nnoremap <C-J> :wincmd j<CR>
nnoremap <C-K> :wincmd k<CR>
nnoremap <C-L> :wincmd l<CR>

" ====================== exchange tab ======================
nmap sV <C-W>t<C-w>H
nmap sH <C-W>t<C-w>K
" Rotate screens
noremap srh <C-W>b<C-w>K
noremap srv <C-W>b<C-w>H

" Press to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

nmap <UP> :resize +5<CR>
nmap <DOWN> :resize -5<CR>
nmap <LEFT> :vertical resize +5<CR>
nmap <RIGHT> :vertical resize -5<CR>

" ===============get rid of postsearch's highlight ==========
noremap <BS> :nohlsearch<CR>

" ==============Command line mode cursor movement ===========
cnoremap <C-A> <Home>	"default <C-B>
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
inoremap <C-L> <RIGHT>

" filetype on
" filetype indent on
" filetype plugin on
filetype plugin indent on

" should make scrolling faster
set ttyfast
set lazyredraw

autocmd BufNewFile,BufRead * try
autocmd BufNewFile,BufRead *	set encoding=utf-8
autocmd BufNewFile,BufRead * endtry


let &t_CO=256
" some version color incorrect
"let &t_ut=''
" set cursor sharp
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"----------------Visuals------------------"
"colorscheme atom-dark
colorscheme deus

" auto source init.vim
augroup autosourcing
	autocmd!
	" autocmd BufWritePost ~/AppData/Local/nvim/init.vim source %
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" delete last trailinDTreeToggle
autocmd BufWritePre * :%s/\s\+$//e

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" ##############################################################
" #                      Plugins Config                        #
" ##############################################################

" ===
" === Tab management
" ===
" Create a new tab with tb
noremap <leader>tb :table<CR>
" Move around tabs with tn and tp
noremap <leader>tn :-tabnext<CR>
noremap <leader>tp :+tabnext<CR>
" Move the tabs with tmn and tmp
noremap <leader>tmn :-tabmove<CR>
noremap <leader>tmp :+tabmove<CR>

" ===
" === Markdown Settings
" ===
" Snippets
" source ~/AppData/Local/nvim/plugged/vim-snippets/snippets/**.snippets
" Auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" ===
" === Undotree
" ===
noremap <leader>tu :UndotreeToggle<CR>
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
" Just place you cursor on any variable/class/constant/name/symbol and press \j.
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
" === vim-instant-markdown
" ===
nnoremap <leader>mp :InstantMarkdownPreview<CR>
nnoremap <leader>ms :InstantMarkdownStop<CR>

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
noremap <LEADER>tmt :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

function! s:isAtStartOfLine(mapping)
	let text_before_cursor = getline('.')[0 : col('.')-1]
	let mapping_pattern = '\V' . escape(a:mapping, '\')
	let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
	return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' .
				\ mapping_pattern . '\v$')
endfunction
inoreabbrev <expr> <bar><bar>
			\ <SID>isAtStartOfLine('\|\|') ?
			\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'

" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

" ===
" === vim-json
" ===
nmap <A-k>   :Move current line/selection up
nmap <A-j>   :Move current line/selection down
vmap <A-k>   :Move current line/selection up
vmap <A-j>   :Move current line/selection down

" ===
" === vim-visual-multi
" ===
" select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
" press n/N to get next/previous occurrence
" press [/] to select next/previous cursor
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
" === emmet-vim
" ===
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" To remap the default <C-Y> leader:
" the trailing , still needs to be entered, so the new keymap would be <A-E>,.
let g:user_emmet_leader_key='<A-E>'

" ===
" === nvim-colorizer.lua
" ===
lua require 'colorizer'.setup()

" ===
" === valsorym/.del.vim-json
" ===
let g:move_key_modifier = 'A'
map <A-k>  :Move current line/selection up
map <A-j>  :Move current line/selection down

" ===
" === AutoFormat vim-codefmt
" ===
augroup autoformat_settings
	" autocmd FileType bzl AutoFormatBuffer buildifier
	" autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
	" autocmd FileType dart AutoFormatBuffer dartfmt
	" autocmd FileType go AutoFormatBuffer gofmt
	" autocmd FileType gn AutoFormatBuffer gn
	autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	" autocmd FileType java AutoFormatBuffer google-java-format
	autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	" autocmd FileType rust AutoFormatBuffer rustfmt
	" autocmd FileType vue AutoFormatBuffer prettier
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
" 	return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15

" ===
" === Far.vim
" ===
" :Far {pattern} {replace-with} {file-mask} [params]
" Find the text to replace.
" :F {pattern} {file-mask} [params]
" Find only.
" Searching Interatively
" :Farr foo bar **/*.py
" :Farr [params]
" Interative Far. Shows searching modes in the status bar (regex, case sensitive, word boundary, replace).
" Modes can be toggled by the key mapping it prompted. Allows to enter {pattern}, {replace-with}
" and {file-mask} one after the other.
" :Farf [params]
" Interative F. The interaction is similar to Farr.
" Commands in the searching result window
" :Fardo [params]
" Runs the replacement task. The shortcut for it is s (substitute).
" :Farundo [params]
" Undo the recurrent replacement. The shortcut for it is u (undo).
" It is available when set let g:far#enable_undo=1.
" :Refar [params]
" Change Far/F/Farr/Farf params.

" shortcut for far.vim find
nnoremap <silent> <leader><leader>f  :Farf<cr>
vnoremap <silent> <leader><leader>f  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <leader><leader>r  :Farr<cr>
vnoremap <silent> <leader><leader>r :Farr<cr>

" ===
" === Antovim
" ===
" To extend the global list, you can simply extend it
" let g:antovim_definitions = extend(g:antovim_definitions, [['yes', 'no', 'maybe']])
nnoremap gs :Antovim<CR>

" ===
" === tabular
" ===
vmap gt :Tabularize /


" Compile function
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
		set splitbelow
		:sp
		:term python3 %
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
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

" ===
" === FZF
" ===
if has('unix')
	set runtimepath+=$HOME/.config/.fzf/bin
else
	set runtimepath+=$HOME/AppData/Local/nvim
endif
nnoremap <c-p> :Leaderf file<CR>
" noremap <silent> <C-p> :Files<CR>
noremap <silent> <A-f> :Rg<CR>
noremap <silent> <A-h> :History<CR>
"noremap <C-t> :BTags<CR>
noremap <silent> <A-l> :Lines<CR>
noremap <silent> <A-w> :Buffers<CR>
noremap <leader>; :History:<CR>

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

noremap <A-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" ===
" === Leaderf
" ===
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
