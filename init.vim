set encoding=utf-8
let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set shiftwidth=4
" support for vim-polyglot
set nocompatible
"enter directory where current file in
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>


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
noremap E 3e
noremap B 3b
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
 

	" Treesitter
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'nvim-treesitter/playground'

	" Pretty Dress
	"Plug 'theniceboy/nvim-deus'
	"Plug 'arzg/vim-colors-xcode'

	" Status line
	"Plug 'theniceboy/eleline.vim'
	"Plug 'ojroques/vim-scrollstatus'
	"
	Plug 'junegunn/fzf.vim'

	"NerdTree
	Plug 'preservim/nerdtree'

	" status bar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	"" Vim IDE for C/C++
	" Language packs(C/C++)
		Plug 'sheerun/vim-polyglot'
		    Plug 'vim-jp/vim-cpp'

		Plug 'arcticicestudio/nord-vim'

		Plug 'preservim/tagbar'

		Plug 'dyng/ctrlsf.vim'

		Plug 'derekwyatt/vim-fswitch'

		Plug 'derekwyatt/vim-protodef'

		Plug 'Yggdroot/indentLine'

		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		"Plug 'ycm-core/YouCompleteMe'

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

""" Vim IDE Config For C/C++ 
		" colorscheme 
				colorscheme nord

		" Start interactive EasyAlign in visual mode (e.g. vipga)
				xmap ga <Plug>(EasyAlign)

		" Start interactive EasyAlign for a motion/text object (e.g. gaip)
				nmap ga <Plug>(EasyAlign)

		"NERDTree config
				nnoremap <F2> :NERDTreeToggle<CR>

		"" Tagbar Config
				" Focus the panel when opening it
				let g:tagbar_autofocus = 1
				" Highlight the active tag
				let g:tagbar_autoshowtag = 1
				" Make panel vertical and place on the right
				let g:tagbar_position = 'botright vertical'
				" Mapping to open and close the panel
				nmap <F8> :TagbarToggle<CR>

		"" CtrlFS Config
				" Use the ack tool as the backend
				let g:ctrlsf_backend = 'ag'
				" Auto close the results panel when opening a file
				let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
				" Immediately switch focus to the search window
				let g:ctrlsf_auto_focus = { "at":"start" }
				" Don't open the preview window automatically
				let g:ctrlsf_auto_preview = 0
				" Use the smart case sensitivity search scheme
				let g:ctrlsf_case_sensitive = 'smart'
				" Normal mode, not compact mode
				let g:ctrlsf_default_view = 'normal'
				" Use absoulte search by default
				let g:ctrlsf_regex_pattern = 0
				" Position of the search window
				let g:ctrlsf_position = 'right'
				" Width or height of search window
				let g:ctrlsf_winsize = '46'
				" Search from the current working directory
				let g:ctrlsf_default_root = 'cwd'
				noremap <C-F> <nop>

				" (Ctrl+F) Open search prompt (Normal Mode)
				nmap <C-F>f <Plug>CtrlSFPrompt 
				" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
"				xmap <C-F>f <Plug>CtrlSFVwordPath
				" (Ctrl-F + F) Perform search with selection (Visual Mode)
				xmap <C-F>f <Plug>CtrlSFVwordExec
				" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
				nmap <C-F>n <Plug>CtrlSFCwordPath
				" (Ctrl-F + o )Open CtrlSF window (Normal Mode)
				nnoremap <C-F>o :CtrlSFOpen<CR>
				" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
				nnoremap <C-F>t :CtrlSFToggle<CR>
				" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
				inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

				" FSwitch config
				au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
				"au! BufEnter *.c let b:fswitchdst = 'h'
				au! BufEnter *.h let b:fswitchdst = 'cpp,c'
				nmap <C-Z> :vsplit <bar> :wincmd l <bar> :FSRight<CR>
				" 设置 pullproto.pl 脚本路径
				let g:protodefprotogetter='~/.config/nvim/plugged/vim-protodef/pullproto.pl'
				"成员函数的实现顺序与声明顺序一致
				let g:disable_protodef_sorting=1
				" Pull in prototypes
				nnoremap <buffer> <silent> <leader> ,PP
				" Pull in prototypes without namespace definition"
				nnoremap <buffer> <silent> <leader> ,PN



" =====
" ===== coc.nvim
" =====
set hidden
set cmdheight=2
set updatetime=100
set shortmess+=c

nmap <leader>e :CocCommand explorer<CR>

let g:coc_global_extensions = [
		\'coc-marketplace', 
		\'coc-vimlsp',
		\'coc-cmake',
		\'coc-git',
		\'coc-json',
		\'coc-clangd',
		\'coc-tsserver']
			

inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-o> coc#refresh()
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use <LEADER>h to show documentation in preview window.
nnoremap <silent> <LEADER>H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>cm  :<C-u>CocList marketplace<cr>

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
	let g:airline_powerline_fonts = 1
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
	let g:mkdp_auto_start = 0

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
