"Vundle settings
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'tpope/vim-rhubarb'

" color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'
Plugin 'alessandroyorba/sidonia'
Plugin 'tomasr/molokai'
Plugin 'dracula/vim'
Plugin 'rakr/vim-one'

" unite
Plugin 'Shougo/denite.nvim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/unite-session'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'tsukkee/unite-help'
Plugin 'tsukkee/unite-tag'
Plugin 'ujihisa/unite-colorscheme'
Plugin 'osyo-manga/unite-quickfix'

" ctags cscope
Plugin 'amitab/vim-unite-cscope'
Plugin 'craigemery/vim-autotag'

" motions
Plugin 'easymotion/vim-easymotion'
Plugin 'geoffharcourt/vim-matchit'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rsi'
Plugin 'AndrewRadev/splitjoin.vim'

" fuzzy finders
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'

" file and folder
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" autocomplete
Plugin 'sheerun/vim-polyglot'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'ervandew/supertab'

" sytax
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'Yggdroot/indentLine'
Plugin 'ryanoasis/vim-devicons'
Plugin 'elzr/vim-json'

"Presenting
Plugin 'sotte/presenting.vim'
Plugin 'godlygeek/tabular'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'vim-scripts/DrawIt'

"tmux
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'rizzatti/dash.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
