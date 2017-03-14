" manage plugins by vundle
source ~/.vundleplugins.vim
" set title
set title
" for syntax
syntax on
" be iMproved, required
set nocompatible              
" to show numbers
set number
" to auto indent
set autoindent
set smartindent
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
" press <Enter> to continue"
set cmdheight=2
" set paste toggle
set pastetoggle=<leader>v
" lines of text around cursor
set scrolloff=3 
" command bar height
set cmdheight=1
" current buffer can be put into background without closing
set hidden
" don't redraw while executing macros
set nolazyredraw
" switch between current and last buffer
nmap <space>. <c-^>
" don't show which mode disabled for PowerLine
set noshowmode
" faster redrawing
set ttyfast
" show matching braces
set showmatch
" how many tenths of a second to blink
set mat=2
" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500
" Tab control
set noexpandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
" detect when a file is changed
set autoread
" mapping leader
let mapleader=","
" required for tmux
set term=screen-256color
" matchit fix
runtime macros/matchit.vim

execute pathogen#infect()
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
nnoremap <leader>L :nohl<CR>
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
nnoremap <leader>l :set list!<cr>

" select color scheme
colorscheme onedark 

"colorscheme sidonia
"set termguicolors

"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

"colorscheme solarized
"set background=dark

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
"

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
"let g:unite_split_rule = 'botright'
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_prompt = ' ▸▸ '
let g:unite_source_rec_max_cache_files = 99999
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --smart-case --nogroup --nocolor --ignore-dir={.git, .cabal-sandbox, .stack-work }'
  let g:unite_source_grep_recursive_opt = ''
  "let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup','--hidden','--ignore "**.jar"','-g','']
  let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden --ignore "**.jar" -g ""'
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts ='-i --smart-case --nogroup --nocolor --ignore-dir=''.git, .cabal-sandbox, .stack-work'''
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command ='ack -f --nofilter --nogroup --nocolor'
endif
" use -no-split to not to show quick view
" find file recuresively 
nnoremap <space>a :<C-u>Unite -buffer-name=files -winheight=10 -input= -start-insert file_rec/async:!<cr>
" find file recuresively cursor under the word
nnoremap <space>A :<C-u>UniteWithInput -buffer-name=fileswithInput -winheight=10 -start-insert file_rec/async<cr><C-r><C-w><cr>
" find lines in file
nnoremap <space>l :<C-u>Unite -buffer-name=currentFile -winheight=10 -input= -start-insert line<cr>
" find lines in file under the cursor
nnoremap <space>L :<C-u>UniteWithInput -buffer-name=currentFile -winheight=10 -start-insert line<cr><C-r><C-w><cr>
" recent directories
nnoremap <space>d :<C-u>Unite -buffer-name=directories -winheight=10 -start-insert directory_mru directory_rec/async<cr>
" search all tags
nnoremap <space>t :<C-u>Unite -buffer-name=tags -winheight=10 -input= -start-insert tag<cr>
" search all tags cursor under the word
nnoremap <space>T :<C-u>UniteWithInput -buffer-name=tagswithInput -winheight=10 -start-insert tag<cr><C-r><C-w><cr>
" browse files 
nnoremap <space>f :<C-u>Unite -buffer-name=files -start-insert file<cr>
" get recent files
nnoremap <space>r :<C-u>Unite -buffer-name=mru -winheight=10 -input= -start-insert file_mru<cr>
" get outline of current buffer
nnoremap <space>o :<C-u>Unite -buffer-name=outline -input= -start-insert outline<cr>
" get all buffers
nnoremap <space>b :<C-u>Unite -buffer-name=buffer -winheight=10 -input= buffer<cr>
" get all key mappings 
nnoremap <space>m :<C-u>Unite -buffer-name=mappings -winheight=10 -input= mapping<cr>
" get colorscheme
nnoremap <space>c :<C-u>Unite -buffer-name=mappings -winheight=10 -input= colorscheme<cr>
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
" Unite quick fix
nnoremap <space>q :<C-u>Unite -buffer-name=quickfix -winheight=10 -input= -start-insert quickfix<cr>
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
    nmap <buffer> <tab> <Plug>(unite_loop_cursor_down)
    nmap <buffer> <s-tab> <Plug>(unite_loop_cursor_up)
    imap <buffer> <C-a> <Plug>(unite_choose_action)
    nmap <silent><buffer><expr> Enter unite#do_action('switch')
    nmap <buffer> <C-s>      <Plug>(unite_redraw)
    nnoremap <silent><nowait><buffer><expr> r unite#smart_map('r', unite#do_action('delete'))
    nnoremap <silent><nowait><buffer><expr> d unite#smart_map('d', unite#do_action('diff'))
    nnoremap <silent><nowait><buffer><expr> h unite#smart_map('h', unite#do_action('split'))
    nnoremap <silent><nowait><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
    nnoremap <silent><nowait><buffer><expr> t unite#smart_map('t', unite#do_action('tabswitch'))
    nnoremap <silent><nowait><buffer><expr> c unite#smart_map('c', unite#do_action('cd'))
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
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
"
"If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

"NERTtree mappings
" Toggle NERDTree
nmap <silent> <leader>t :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>T :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowExecutableFlag = 0
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
if executable('ag')
  let g:ctrlp_user_command = 'ag --nocolor -g "" %s'
  let g:ctrlp_use_caching = 0
endif

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

set cursorline
" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>
" to write as root
noremap <leader>W :w !sudo tee % > /dev/null
" <Leader>q: Quit all, very useful in vimdiff
nnoremap <Leader>q :qa<cr>
" _ : Quick horizontal splits
nnoremap _ :new<cr>
" | : Quick vertical splits
nnoremap <bar> :vnew<cr>
nnoremap <leader>e : enew<cr>
" buffer delete
nnoremap <leader>d :bd!<cr>
nnoremap <leader>D :%bd!<cr>
" compare split windows
nnoremap <leader>c :windo diffthis<cr>
nnoremap <leader>C :windo diffoff<cr>
" move to current directory
nnoremap gc :lcd %:p:h<cr>

" gui settings
if has("gui_running") 
  "set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h14
  "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h14
  set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h14
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

"Easy motions 
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

"git
let g:fugitive_github_domains      = ['https://gecgithub01.walmart.com']
let g:github_enterprise_urls       = ['https://gecgithub01.walmart.com']
autocmd User fugitive 
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
nnoremap <leader>gl :Glog -10 -- %<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>

" toggle background
function! BgToggleSol()
  if &background == "light"
    execute ":set background=dark"
  else
    execute ":set background=light"
  endif
endfunction
nnoremap <F2> :call BgToggleSol()<cr>

" disable meta keys for RSI
let g:rsi_no_meta = 1

"Souround settings
" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`

" vimux settings
map <leader>vp :VimuxPromptCommand<cr>
map <leader>vc :VimuxCloseRunner<cr> 

" remove lines 
nnoremap <leader>G :g//d<CR>
nnoremap <leader>V :v//d<CR>
nnoremap <leader>S :%s///g<CR>

" copy current relative file path
nnoremap <leader>cf :let @*=expand("%")<CR>
