let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set shiftwidth=4

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set clipboard+=unnamedplus

noremap <LEADER><CR> :nohlsearch<CR>
"noremap <C-v> "+p
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>rv :e .nvimrc<CR>
noremap <LEADER>rz :e ~/.zshrc<CR>
noremap <LEADER>ri :e ~/.config/i3/config<CR>
noremap <LEADER>rr :e ~/.config/ranger/rc.conf<CR>


noremap <C-k> 5<C-y>
noremap <C-j> 5<C-e>
inoremap <C-a> <ESC>A

noremap J 5j
noremap K 5k
noremap H 0
noremap L $
noremap W 5w
noremap B 5b

noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap <LEADER>o <C-w>o
noremap <LEADER>q <C-w>q

noremap sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sh :set splitright<CR>:vsplit<CR>
noremap sv <C-w>v

noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

"tag hotkey
noremap tt :tabe<CR>
noremap tT :tab split<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>


" Make Y to copy till the end of the line
nnoremap Y y$
" Copy to system clipboard
vnoremap Y "+y

nnoremap < <<
nnoremap > >>

nnoremap ; :

nnoremap dp d%

map S :w<CR>
map s <nop>
map Q :q<CR>

"let absPath=expand("%:p")
map R :source <C-R>%<CR>


call plug#begin('~/.config/nvim/plugged')
 
	" status bar
	Plug 'vim-airline/vim-airline'

	" colour
	Plug 'connorholyday/vim-snazzy'

	" Treesitter
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'nvim-treesitter/playground'

	" Pretty Dress
	Plug 'theniceboy/nvim-deus'
	Plug 'arzg/vim-colors-xcode'

	" Status line
	Plug 'theniceboy/eleline.vim'
	"Plug 'ojroques/vim-scrollstatus'

	"Coc aotu completion
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	"NerdTree
	Plug 'preservim/nerdtree'

	"multi-select like vs code
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

	" a start screen for vim
	Plug 'mhinz/vim-startify'

	"auto pairs
	Plug 'jiangmiao/auto-pairs'
	"vim-rainbow
	Plug 'frazrepo/vim-rainbow'

	"align plug
	Plug 'junegunn/vim-easy-align'
	"cs/ds/ys
	Plug 'tpope/vim-surround'
	"select by enter
	Plug 'gcmt/wildfire.vim'

	":GenTocGFM
	Plug 'mzlogin/vim-markdown-toc'

	"markdown-preview
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


call plug#end()

""" Plug config


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"NERDTree config
nnoremap <C-b> :NERDTreeToggle<CR>

" =====
" ===== coc.nvim
" =====
"let g:coc_globle_extension = [	
"      \ 'coc-json',
"      \ 'coc-git',
"      \ 'coc-cmake',
"      \ 'coc-clangd',
"      \ 'coc-vimlsp']

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-i> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>m :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" =====
" ===== 
" =====


""Treesitter 
"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"  ensure_installed = {"typescript", "dart", "java"},     -- one of "all", "language", or a list of languages
"  highlight = {
"    enable = true,              -- false will disable the whole extension
"    disable = { "c", "rust" },  -- list of language that will be disabled
"  },
"}
"EOF

"airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab


nmap <leader>d1 <Plug>AirlineSelectTab1 :bd<CR>
nmap <leader>d2 <Plug>AirlineSelectTab2 :bd<CR>
nmap <leader>d3 <Plug>AirlineSelectTab3 :bd<CR>
nmap <leader>d4 <Plug>AirlineSelectTab4 :bd<CR>
nmap <leader>d5 <Plug>AirlineSelectTab5 :bd<CR>
nmap <leader>d6 <Plug>AirlineSelectTab6 :bd<CR>
nmap <leader>d7 <Plug>AirlineSelectTab7 :bd<CR>
nmap <leader>d8 <Plug>AirlineSelectTab8 :bd<CR>
nmap <leader>d9 <Plug>AirlineSelectTab9 :bd<CR>
nmap <leader>d0 <Plug>AirlineSelectTab0 :bd<CR>
nmap <leader>d- <Plug>AirlineSelectPrevTab :bd<CR>
nmap <leader>d= <Plug>AirlineSelectNextTab :bd<CR>

"markdown-preview config:
	" set to 1, nvim will open the preview window after entering the markdown buffer
	" default: 0
	let g:mkdp_auto_start = 1

	" set to 1, the nvim will auto close current preview window when change
	" from markdown buffer to another buffer
	" default: 1
	let g:mkdp_auto_close = 1

	"markdwon-preview Mappings
	nmap <C-s> <Plug>MarkdownPreview
	nmap <M-s> <Plug>MarkdownPreviewStop
	nmap <C-p> <Plug>MarkdownPreviewToggle

"vim-markdown-toc config:
    let g:vmt_auto_update_on_save = 0

"wildfire config:
    let g:wildfire_objects = ["i'", 'i"', "i\*", "i>", "i`", "i)", "i]", "i}", "ip", "it"]
