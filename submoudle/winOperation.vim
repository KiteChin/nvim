let mapleader=" "
"hotkey for windows operation
noremap <LEADER>w <C-w>w
noremap <LEADER>j <C-w>j
noremap <LEADER><S-j> <C-w>J
noremap <LEADER>k <C-w>k
noremap <LEADER><S-k> <C-w>K
noremap <LEADER>h <C-w>h
noremap <LEADER><S-h> <C-w>H
noremap <LEADER>l <C-w>l
noremap <LEADER><S-l> <C-w>L
noremap <LEADER>o <C-w>o
noremap <LEADER>q <C-w>q

"nmap sj :split<CR><LEADER>k
"nmap sk :split<CR>
"nmap sl :vsplit<CR><LEADER>h
"nmap sh :vsplit<CR>

noremap sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sh :set splitright<CR>:vsplit<CR>

nmap sv <C-w>v

noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
