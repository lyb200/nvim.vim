" ==================================================
" ============= vim-plug, myplugins ================
" ==================================================
if has('unix')
	call plug#begin('$HOME/.config/nvim/plugged')
else
	call plug#begin('$HOME/AppData/Local/nvim/plugged')
endif

Plug 'nvim-lua/popup.nvim'   " An implementation of the Popup API from vim in Neovim
Plug 'nvim-lua/plenary.nvim' " Useful lua functions used ny lots of plugins

" Treesitter need more soft
Plug 'nvim-treesitter/nvim-treesitter'

" Better Comments
Plug 'numToStr/Comment.nvim'

" Cool Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-tree.lua'
" use { "kyazdani42/nvim-tree.lua", commit = "f183c7f31197ae499c3420341fb8b275636a49b8" }

" 起始页 the fancy Start Screen for vim
Plug 'mhinz/vim-startify'
" any jump
Plug 'phaazon/hop.nvim'

" 终端管理，使用(neo)vim中的浮动或弹窗的终端 Terminal manager for (neo)vim
Plug 'voldikss/vim-floaterm'

" A high-performance color highlighter for Neovim which has no external dependencies!
Plug 'norcalli/nvim-colorizer.lua'





" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc.
" on the fly for both vim and neovim.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Rooter changes the working directory to the project root
" when you open a file or directory.
Plug 'airblade/vim-rooter'
" <c-p> :Leaderf file
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

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
" Plug 'suan/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
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

" 翻译，暂时不用，基本上是网速太慢的提示
Plug 'voldikss/vim-translator'

" 显示或隐藏mark, Plugin to toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

" theme
Plug 'ajmwagar/vim-deus'
Plug 'morhetz/gruvbox'

" Status line
Plug 'ojroques/vim-scrollstatus'
Plug 'nvim-lualine/lualine.nvim'

" for automatically highlighting other uses of the current word under the cursor
Plug 'RRethy/vim-illuminate'

" Auto Complete
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" 在默认浏览器中打开url
Plug 'lyb200/vim-open-url'

" 中文vim文档
" Plug 'yianwillis/vimcdoc'

call plug#end()
