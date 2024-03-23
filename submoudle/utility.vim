set nocompatible
filetype plugin on
" set tab for appointed space
set tabstop=4
set shiftwidth=4
set expandtab 

"set the number of command in buffer
set history=500
set ignorecase
set smartcase
set clipboard+=unnamedplus
"default on
set hidden
set number
set relativenumber

set wildmenu
set showcmd
set wrap
set cursorline
syntax on

"J,K,H,L
noremap J 5j
noremap K 5k
noremap H ^
noremap L $

"can change map for else.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"set ex history scroll
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"set hotkey of off highlight for search 
nnoremap <LEADER><CR> :<C-u>nohlsearch<CR><C-l>

"switch current directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"ctags hotkey
nnoremap <f5> :!ctags -R<CR>

"open terminal in vim
nmap <leader>: sh:terminal<CR>i

"get current path in cmd by typed %%.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"visual mode search
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<CR>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<CR>=@/<CR><CR>

function! s:VSetSearch()
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction
