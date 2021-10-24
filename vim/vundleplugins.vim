"Vundle settings
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'
Plugin 'tomasr/molokai'
Plugin 'dracula/vim'
Plugin 'rakr/vim-one'
" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" fuzzy finders
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" search
Plugin 'mhinz/vim-grepper'

" git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'tpope/vim-rhubarb'

" ctags cscope
Plugin 'craigemery/vim-autotag'

" motions
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-repeat'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'

" file and folder
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" autocomplete
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-syntastic/syntastic'
Plugin 'ervandew/supertab'

" sytax
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

"React 
Plugin 'mxw/vim-jsx'

Plugin 'francoiscabrol/ranger.vim'

"Tern
Plugin 'ternjs/tern_for_vim'
Plugin 'stefandtw/quickfix-reflector.vim'

"Encryption
Plugin 'jamessan/vim-gnupg'

"Latex
Plugin 'vim-latex/vim-latex'

"Vim Rest
Plugin 'diepm/vim-rest-console'

"IntelliJ
Plugin 'JetBrains/ideavim'
call vundle#end()
