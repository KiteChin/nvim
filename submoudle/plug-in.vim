"must config before plug
source $HOME/.config/nvim/submoudle/plugConfig/polyglot.vim

call plug#begin('~/.config/nvim/plugged')
        " status bar
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        " start screen 
        Plug 'mhinz/vim-startify'

        " vim-coc
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        " gitdiff
        Plug 'airblade/vim-gitgutter'
        " git command for vim
        Plug 'tpope/vim-fugitive'

        " gutentags automanage tags
        "Plug 'ludovicchabant/vim-gutentags'
        
        " tag navigator
        Plug 'preservim/tagbar'

        " file system explorer
        Plug 'preservim/nerdtree'

        " 
		Plug 'dyng/ctrlsf.vim'

        " translator plug
        Plug 'voldikss/vim-translator'

        " polyglot highlight syntax
        Plug 'sheerun/vim-polyglot'
		    "Plug 'vim-jp/vim-cpp'
        " colorscheme
        "Plug 'rebelot/kanagawa.nvim'
        "auto pairs
        Plug 'jiangmiao/auto-pairs'
        "vim-rainbow
        Plug 'frazrepo/vim-rainbow'
        "align plug
        Plug 'junegunn/vim-easy-align'
        "cs/ds/ys
        Plug 'tpope/vim-surround'
        "markdonw-preview
        "Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
        "
        Plug 'tpope/vim-repeat'
call plug#end()

source $HOME/.config/nvim/submoudle/plugConfig/coc.vim
source $HOME/.config/nvim/submoudle/plugConfig/airline.vim
source $HOME/.config/nvim/submoudle/plugConfig/translator.vim
source $HOME/.config/nvim/submoudle/plugConfig/tagbar.vim
source $HOME/.config/nvim/submoudle/plugConfig/nerdtree.vim
source $HOME/.config/nvim/submoudle/plugConfig/rainbow.vim
source $HOME/.config/nvim/submoudle/plugConfig/easyalign.vim
source $HOME/.config/nvim/submoudle/plugConfig/gitgutter.vim

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
