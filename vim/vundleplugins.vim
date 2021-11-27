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
" Add icons to plugins, you need to have Nert compatible font
Plugin 'ryanoasis/vim-devicons'

" fuzzy finders
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" fancy startup screen
Plugin 'mhinz/vim-startify'

" search
Plugin 'mhinz/vim-grepper'

" file and folder
Plugin 'scrooloose/nerdtree'
" shows git marks in tree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" git
Plugin 'tpope/vim-fugitive'
" A git commit browser.
Plugin 'junegunn/gv.vim'
" shows what line got changed, move between hunks
Plugin 'airblade/vim-gitgutter'
" Enables :GBrowse from fugitive.vim to open GitHub URLs.
Plugin 'tpope/vim-rhubarb'


" session management
Plugin 'tpope/vim-obsession'


" automatic tabling
" :Tabularize /= will align with =
Plugin 'godlygeek/tabular'
" An awesome automatic table creator & formatter
" ,tm to toggle TableModeToggle
Plugin 'dhruvasagar/vim-table-mode'

" navigate seamlessly between vim and tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'preservim/vimux'
Plugin 'ivanov/vim-ipython'

" code
" Gives mappings to surround text with special chars
Plugin 'tpope/vim-surround'
" Gives mappings with ] [
Plugin 'tpope/vim-unimpaired'
" Gives option to repeat above
Plugin 'tpope/vim-repeat'
" Gives options C-a, C-e in insert mode
Plugin 'tpope/vim-rsi'
" Provides automatic closing brackets
Plugin 'Raimondi/delimitMate'
" language packs for Vim
Plugin 'sheerun/vim-polyglot'
" Supertab is a vim plugin which allows you to use <Tab> for all your insert
" completion needs
Plugin 'ervandew/supertab'
" commenting
Plugin 'scrooloose/nerdcommenter'
" ctags cscope
Plugin 'craigemery/vim-autotag'
" React
Plugin 'mxw/vim-jsx'
" Tern is a stand-alone code-analysis engine for JavaScript
Plugin 'ternjs/tern_for_vim'
" syntax checking plugin
Plugin 'vim-syntastic/syntastic'
" Snippet engine
Plugin 'SirVer/ultisnips'
" Provides some default snippets
Plugin 'honza/vim-snippets'
" show vertical bars for indented lines
Plugin 'Yggdroot/indentLine'
" json highlighting
Plugin 'elzr/vim-json'
"Latex
Plugin 'vim-latex/vim-latex'
"Vim Rest
Plugin 'diepm/vim-rest-console'
" Liquid support
Plugin 'tpope/vim-liquid'
" sneak
Plugin 'justinmk/vim-sneak'
" which key
Plugin 'liuchengxu/vim-which-key'
" css colors
Plugin 'ap/vim-css-color'

"Encryption
Plugin 'jamessan/vim-gnupg'
call vundle#end()
