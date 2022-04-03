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

