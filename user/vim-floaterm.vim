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

