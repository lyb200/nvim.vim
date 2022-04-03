"      __  __       _   _       _
"     |  \/  |_   _| \ | |_   _(_)_ __ ___
"     | |\/| | | | |  \| \ \ / / | '_ ` _ \
"     | |  | | |_| | |\  |\ V /| | | | | | |
"     |_|  |_|\__, |_| \_| \_/ |_|_| |_| |_|
"            |___/


" auto git clone vim-plug
source $HOME/AppData/Local/nvim/user/vim-plug_clone.vim
source $HOME/AppData/Local/nvim/user/options.vim
source $HOME/AppData/Local/nvim/user/keymap.vim
source $HOME/AppData/Local/nvim/user/file_location.vim
source $HOME/AppData/Local/nvim/user/autocmds.vim
source $HOME/AppData/Local/nvim/user/plugins.vim
source $HOME/AppData/Local/nvim/user/nvim-tree.vim
source $HOME/AppData/Local/nvim/user/coc_config.vim
source $HOME/AppData/Local/nvim/user/UndotreeToggle.vim
source $HOME/AppData/Local/nvim/user/vim-table-mode.vim
source $HOME/AppData/Local/nvim/user/bullets.vim
source $HOME/AppData/Local/nvim/user/vim-floaterm.vim
source $HOME/AppData/Local/nvim/user/autoformat.vim
source $HOME/AppData/Local/nvim/user/hop.vim
source $HOME/AppData/Local/nvim/user/lualine.vim

"colorscheme atom-dark
colorscheme deus

" source $HOME/AppData/Local/nvim/comment.vim
lua require('Comment').setup()
" ===
" === nvim-colorizer.lua
" ===
lua require 'colorizer'.setup()



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
" === Snippets Markdown-Settings
" ===
" source $HOME/AppData/Local/nvim/plugged/vim-snippets/snippets/**.snippets
" Auto spell
autocmd BufRead,BufNewFile *.md setlocal spell
" md shortcut for only markdown
if has('unix')
	source $HOME/.config/nvim/user/md-snippets.vim
else
	source $HOME/AppData/Local/nvim/user/md-snippets.vim
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



" :options can list all configures
" :h option-list can get help.

" vim: filetype=vim :
