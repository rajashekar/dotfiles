" set title
set title
" for syntax
syntax on
" select color scheme
colorscheme solarized
set background=dark
" be iMproved, required
set nocompatible              
" to show numbers
set number
" to auto indent
set autoindent
" dont wrap large lines
set nowrap
" enable increment search
set incsearch
" enable ignore case
set ignorecase
" when using caps, ignore ic
set smartcase
" highlight search
set hlsearch
" yanking will paste directly to clipboard
set clipboard=unnamed
" disable creating swp file
set noswapfile
" on shell, which shell to use
set shell=zsh
" Better command-line completion
set wildmode=longest,list
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
" enable mouse support for vim
set mouse=a
" Always display the status line, even if only one window is displayed
set laststatus=2
" Set the command window height to 2 lines, to avoid many cases of having to
" " "press <Enter> to continue"
set cmdheight=2
" set paste toggle
set pastetoggle=<leader>v
" Indentation settings for using 4 spaces instead of tabs.
" " Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
" lines of text around cursor
set scrolloff=3 
" command bar height
set cmdheight=1
" current buffer can be put into background
set hidden
" don't redraw while executing macros
set nolazyredraw
" switch between current and last buffer
nmap <space>. <c-^>
set noshowmode
execute pathogen#infect()
" Default to soft tabs, 2 spaces
set expandtab
set sw=2
set sts=2
" Except Markdown
autocmd FileType mkd set sw=4
autocmd FileType mkd set sts=4

" Folding
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=20
let g:vim_markdown_folding_disabled=1 " Markdown
let javaScript_fold=1                 " JavaScript
let perl_fold=1                       " Perl
let php_folding=1                     " PHP
let r_syntax_folding=1                " R
let ruby_fold=1                       " Ruby
let sh_fold_enabled=1                 " sh
let vimsyn_folding='af'               " Vim script
let xml_syntax_folding=1              " XML
autocmd BufRead,BufNewFile *.cql set filetype=cql

"Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>
" custom command to indent json
com! FormatJSON %!python -m json.tool
" custom command to show unprintable characters
" AirlineToggleWhitespace

" Set list characters - Can be toggled with 'col'
" set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:+
set listchars+=trail:-
set showbreak=↪
com! ShowSpecial set list


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
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'geoffharcourt/vim-matchit'
Plugin 'elzr/vim-json'
Plugin 'tsukkee/unite-tag'
Plugin 'tsukkee/unite-help'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/unite-session'
Plugin 'mileszs/ack.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'amitab/vim-unite-cscope'
Plugin 'craigemery/vim-autotag'
Plugin 'ujihisa/unite-colorscheme'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

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
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
"let g:unite_split_rule = 'botright'
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_prompt = ' ▸▸ '
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --smart-case --nogroup --nocolor --ignore-dir={.git, .cabal-sandbox, .stack-work}'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command ='ag --follow --nocolor --nogroup --hidden -g ""'
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts ='-i --smart-case --nogroup --nocolor --ignore-dir=''.git, .cabal-sandbox, .stack-work'''
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command ='ack -f --nofilter --nogroup --nocolor'
endif
" use -no-split to not to show quick view
" find file recuresively 
nnoremap <space>a :<C-u>Unite -buffer-name=files -winheight=10 -input= -start-insert file_rec/async:!<cr>
" search all tags
nnoremap <space>t :<C-u>Unite -buffer-name=tags -winheight=10 -input= -start-insert tag<cr>
" browse files 
nnoremap <space>f :<C-u>Unite -buffer-name=files -start-insert file<cr>
" get recent files
nnoremap <space>r :<C-u>Unite -buffer-name=mru -winheight=10 -input= -start-insert file_mru<cr>
" get outline of current buffer
nnoremap <space>o :<C-u>Unite -buffer-name=outline -input= -start-insert outline<cr>
" get all buffers
nnoremap <space>b :<C-u>Unite -buffer-name=buffer -winheight=10 -input= buffer<cr>
" get all yanks and history
nnoremap <space>y :<C-u>Unite -buffer-name=yank -winheight=10 -input= history/yank<cr>
" get all jump locations
nnoremap <space>j :<C-u>Unite -buffer-name=jump jump<cr>
" search help files
nnoremap <C-h>  :<C-u>Unite -buffer-name=help -start-insert help<CR>
" search text in all files
nnoremap <space>/ :Unite -no-empty -no-resize grep:.<cr>
" search word under cursor
nnoremap <space>w :Unite -start-insert -no-quit -buffer-name=ag grep:.<cr><C-r><C-w><cr>
" get buffers quick match
" nnoremap <space>b :Unite -quick-match buffer<cr>
nnoremap <space>u :UniteResume<cr>
" cscope call reference mappings
nnoremap <space>g : Unite cscope/find_this_symbol<cr><C-r><C-w><cr>
nnoremap <space>h : Unite cscope/functions_calling<cr><C-r><C-w><cr>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    nmap <silent><buffer><expr> Enter unite#do_action('switch')
    nmap <silent><buffer><expr> <C-t> unite#do_action('tabswitch')
    nmap <silent><buffer><expr> <C-h> unite#do_action('splitswitch')
    nmap <silent><buffer><expr> <C-v> unite#do_action('vsplitswitch')
    nnoremap <buffer> <space>q :UniteClose<CR>
endfunction

"Ggrep custom command
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!

" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
" using silver searcher for ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" java decompiler
augr class
  au!
  au bufreadpost,filereadpost *.class %!jad -noctor -lnc -ff -i -p %
  au bufreadpost,filereadpost *.class set readonly
  au bufreadpost,filereadpost *.class set ft=java
  au bufreadpost,filereadpost *.class normal gg=G
  au bufreadpost,filereadpost *.class set nomodified
augr END

" UltiSnips Trigger configuration. 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"NERTtree mappings
" Toggle NERDTree
nmap <silent> <leader>n :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>N :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
"silent! nmap <F2> :NERDTreeToggle<CR>
"silent! map <F3> :NERDTreeFind<CR>
"let g:NERDTreeMapActivateNode="<F3>"
"let g:NERDTreeMapPreview="<F4>"

" session management
let g:session_autosave='yes'
let g:session_autoload='yes'
let g:session_default_to_last='1'
let g:session_autosave_to = 'default'

"CtrlP
let g:ctrlp_working_path_mode = ""
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
nnoremap <leader>. :CtrlPTag<cr>
"nmap <leader>w <C-P><C-\>w
nmap <leader>w :CtrlPMixed<cr><C-\>w

" air-line settings
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
