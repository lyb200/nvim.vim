
let mapleader=","
nmap , <nop>
nmap s <nop>
nmap t <nop>

nnoremap S :w<CR>
nnoremap Q :q<CR>
noremap <C-Q> :qa<CR>
nnoremap Y y$
vnoremap Y "+y

inoremap jk <ESC>

nnoremap <expr><silent> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr><silent> k v:count == 0 ? 'gk' : 'k'

" j, k  Store relative line number jumps in the jumplist
" if they exceed a threshold.
" nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
" nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" till
noremap ti t
noremap ; :
noremap <space>; ;

" move faster
nnoremap J 5j
nnoremap K 5k
noremap <silent>H :bprevious<CR>
noremap <silent>L :bnext<CR>
" remap H and L function
noremap <space>h H
noremap <space>l L

nnoremap <space>j J
nnoremap <space>k K

nnoremap <silent>so :source %<CR>

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
vnoremap p "_dP

" swatch cursor to top or end of current line
noremap <expr>se col(".")==1?"$":"0"
vnoremap <expr>se col(".")==1?"$h":"0"

" can maintain sustitute flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" make :lmap and IM turn off automatically when leaving Insert mode.
autocmd! InsertLeave * set imdisable
autocmd! InsertEnter * set noimdisable

" gvim
if has("gui_running")
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

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap <C-s> :<C-u>w !sudo tee > /dev/null %
cnoreabbrev w!! w !sudo tee > /dev/null %

cnoreabbrev git Git
cnoreabbrev gitd Git diff
cnoreabbrev gits Git status
cnoreabbrev gita Git add .
cnoreabbrev gitc Git commit -m '
cnoreabbrev gitp Git push
cnoreabbrev gitl Git pull

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

" search adjacent duplicate words
" noremap sdw /\(\<\w\+\>\)\_s*\1
noremap \dw /\v(<\w+>)\_s*<\1><cr>

" Folding
noremap <silent> - za
noremap <silent> _ zM

nnoremap tt :NvimTreeToggle<CR>

" Opening a terminal window
noremap s/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press <leader><space> twice to jump to the next '' and edit it
" noremap <SPACE><SPACE> <Esc>/<++><CR>:nohlsearch<CR>c4l
nnoremap ,; /<++><CR>:nohlsearch<CR>c4l
inoremap ,; <Esc>/<++><CR>:nohlsearch<CR>c4l

" Toggle spelling check with sc
noremap <leader>sc :set spell!<CR>
" 定于光标之前的单词，然后为它查找第一个拼写建议
" find the first spell suggestion for it.
noremap <A-s> ea<C-x>s
inoremap <A-s> <ESC>ea<C-x>s

" 手动设置文件类型
nnoremap sf :set filetype=

noremap <leader>sw :set wrap<CR>
noremap <leader>sW :set nowrap<CR>

" nmap sl :set splitright<CR>:vsplit<CR>
" nmap sh :set nosplitright<CR>:vsplit<CR>
" nmap sj :set splitbelow<CR>:split<CR>
" nmap sk :set nosplitbelow<CR>:split<CR>
nmap sl :set splitright<CR>:vnew<CR>
nmap sh :set nosplitright<CR>:vnew<CR>
nmap sj :set splitbelow<CR>:new<CR>
nmap sk :set nosplitbelow<CR>:new<CR>

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

nmap <C-UP>    :resize +2<CR>
nmap <C-DOWN>  :resize -2<CR>
nmap <C-LEFT>  :vertical resize -2<CR>
nmap <C-RIGHT> :vertical resize +2<CR>

" File type on
filetype plugin indent on

" Vimscript file settings ----------------{{{1
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

" save fold record and reload view.
" autocmd BufWinLeave, BufWritePre *.* mkview
" autocmd BufWinEnter *.* silent loadview

" can make * at visual characters
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

" gp for get picture 如果已经安装figlet，可以得到一个文字性的图案
if has('unix')
	noremap <leader>gp :r !figlet
endif


