" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')
" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite.vim'
Plug 'osyo-manga/unite-quickfix'
Plug 'tsukkee/unite-tag'
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-repeat'
Plug 'sotte/presenting.vim', { 'for': 'markdown' }
Plug 'ervandew/supertab'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/matchit.zip'

Plug 'elzr/vim-json', { 'for': 'json' } " JSON support<Paste>
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'amitab/vim-unite-cscope'
Plug 'craigemery/vim-autotag'
Plug 'easymotion/vim-easymotion'
Plug 'geoffharcourt/vim-matchit'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rsi'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-scripts/DrawIt'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rizzatti/dash.vim'
call plug#end()
