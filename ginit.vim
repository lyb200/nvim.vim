"Toggle Menu and Toolbar
set guioptions-=T
set guioptions-=m
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" Cancel scroll h & v
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" disable cursor blink
set guicursor=a:block-blinkon0

" set font
" set guifont=Courier\ New:h16
" GuiFont! Consolas:h16:l:cANSI:qDRAFT
if has('nvim')
	GuiFont! agave\ Nerd\ Font:h16
	" The GUI completion menu is also ugly and too long,
	" You can disable it by adding the following setting in ginit.vim
	GuiPopupmenu 0

    " if you want to use the mouse wheel to control the font-size
    let s:font_size=16
    function! AdjustFontSize(amount)
        let s:font_size = s:font_size + a:amount
        :execute "GuiFont! agave\ Nerd\ Font:h" . s:font_size
    endfunction

    noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
    noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
    inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
    inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

    " In normal mode, pressing numpad's +/- increases/decreases the font
    noremap <kPlus> :call AdjustFontSize(1)<CR>
    noremap <kMinus> :call AdjustFontSize(-1)<CR>
    " In insert mode, pressing ctrl + numpad's+ increases the font
    inoremap <C-kPlus> <Esc>:call AdjustFontSize(1)<CR>a
    inoremap <C-kMinus> <Esc>:call AdjustFontSize(-1)<CR>a
    else
        set guifont=agave\ Nerd\ Font:h16:cANSI:qDRAFT
endif
" Add the following settings to your ginit.vim file:
" call GuiWindowMaximized(1)
" set guifontwide=*      "may find a window to select font


" set lines=45 columns=82

autocmd GUIEnter * winpos 920 0

" set the menu & the message to English
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
