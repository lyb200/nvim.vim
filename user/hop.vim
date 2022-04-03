lua << EOF
local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end
hop.setup()
EOF

" c = { ":HopChar1<CR>", "jump char1" },
" C = { ":HopChar2<CR>", "jump char2" },
" l = { ":HopLine<CR>", "jump line" },
" p = { ":HopPattern<cr>", "jump pattern" },
" w = { ":HopWord<CR>", "jump word" },
