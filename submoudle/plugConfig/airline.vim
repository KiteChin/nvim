"===============================
"========airline config=========
"===============================

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2

let g:airline#extensions#tabline#buffer_idx_mode = 1
noremap <leader>1 <Plug>AirlineSelectTab1
noremap <leader>2 <Plug>AirlineSelectTab2
noremap <leader>3 <Plug>AirlineSelectTab3
noremap <leader>4 <Plug>AirlineSelectTab4
noremap <leader>5 <Plug>AirlineSelectTab5
noremap <leader>6 <Plug>AirlineSelectTab6
noremap <leader>7 <Plug>AirlineSelectTab7
noremap <leader>8 <Plug>AirlineSelectTab8
noremap <leader>9 <Plug>AirlineSelectTab9
noremap <leader>0 <Plug>AirlineSelectTab0
noremap <leader>- <Plug>AirlineSelectPrevTab
noremap <leader>= <Plug>AirlineSelectNextTab


noremap <leader>d1 <Plug>AirlineSelectTab1 :bd<CR>
noremap <leader>d2 <Plug>AirlineSelectTab2 :bd<CR>
noremap <leader>d3 <Plug>AirlineSelectTab3 :bd<CR>
noremap <leader>d4 <Plug>AirlineSelectTab4 :bd<CR>
noremap <leader>d5 <Plug>AirlineSelectTab5 :bd<CR>
noremap <leader>d6 <Plug>AirlineSelectTab6 :bd<CR>
noremap <leader>d7 <Plug>AirlineSelectTab7 :bd<CR>
noremap <leader>d8 <Plug>AirlineSelectTab8 :bd<CR>
noremap <leader>d9 <Plug>AirlineSelectTab9 :bd<CR>
"0 for 10
noremap <leader>d0 <Plug>AirlineSelectTab0 :bd<CR> 
"delete current buffer
noremap <leader>dd :bd<CR>
noremap <leader>d- <Plug>AirlineSelectPrevTab :bd<CR>
noremap <leader>d= <Plug>AirlineSelectNextTab :bd<CR>

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
