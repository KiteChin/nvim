let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set clipboard=unnamedplus

noremap <LEADER><CR> :nohlsearch<CR>
"noremap <C-v> "+p
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>rv :e .nvimrc<CR>


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
map R :source $MYVIMRC<CR>

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

	"markdown-preview
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }


call plug#end()

set re=0
" experimental
set lazyredraw
"set regexpengine=1


hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" ===
" === eleline.vim
" ===
let g:airline_powerline_fonts = 0


"Treesitter 
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"typescript", "dart", "java"},     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF


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
