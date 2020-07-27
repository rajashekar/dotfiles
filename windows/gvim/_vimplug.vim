"Vim plug settings
filetype off

set rtp+=~/vimfiles/autoload/plug.vim
set shell=cmd.exe shellcmdflag=/c 

call plug#begin('~/vimfiles/plugged')

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-rhubarb'

" color schemes
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'dracula/vim'
Plug 'rakr/vim-one'

" unite
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-session'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'tsukkee/unite-help'
Plug 'tsukkee/unite-tag'
Plug 'ujihisa/unite-colorscheme'
Plug 'osyo-manga/unite-quickfix'

" ctags cscope
Plug 'amitab/vim-unite-cscope'
Plug 'craigemery/vim-autotag'

" motions
Plug 'easymotion/vim-easymotion'
Plug 'geoffharcourt/vim-matchit'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rsi'
Plug 'AndrewRadev/splitjoin.vim'

" fuzzy finders
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

" file and folder
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" autocomplete
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'ervandew/supertab'

" sytax
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'elzr/vim-json'

"Presenting
Plug 'sotte/presenting.vim'
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-scripts/DrawIt'

"tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

Plug 'rizzatti/dash.vim'

"React 
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'francoiscabrol/ranger.vim'

"Tern
Plug 'ternjs/tern_for_vim'
Plug 'stefandtw/quickfix-reflector.vim'
call plug#end()            " required
