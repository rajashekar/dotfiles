# Search options
# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history
# save each command's beginning timestamp and the duration to the history file
setopt extended_history 
setopt hist_ignore_all_dups

# Emacs style edit command line
autoload -U edit-command-line
zle -N edit-command-line

# VARIABLES
DEFAULT_USER=rchint1
ZSH_THEME="robbyrussell"
KREW_PATH=${KREW_ROOT:-$HOME/.krew}/bin

if command -v brew > /dev/null; then
	SLEGE_PATH=~/.slege/bin
	TEX_PATH=/usr/local/texlive/2021/bin/universal-darwin
	GO_PATH=~/go/bin
	PROTOC_PATH=~/protoc-3.7.0-osx-x86_64/bin
	RVM_PATH=$HOME/.rvm/bin
	PATH=$SLEGE_PATH:$GOPATH:$TEX_PATH:$RVM_PATH:$PROTOC_PATH:$KREW_PATH:/usr/local/bin:$PATH
fi

# EXPORTS
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
export EDITOR='vi'
export PATH
# rclone
export RCLONE_PASSWORD_COMMAND="pass rc"

# SOURCE
source $ZSH/oh-my-zsh.sh
source ~/.profile
# source all .zsh files inside of the zsh/ directory
# export DOTFILES=$HOME/.dotfiles
# export ZSH=$DOTFILES/zsh
# for config ($ZSH/**/*.zsh) source $config


# PLUGIN MANAGER
# zplug
source ~/.zplug/init.zsh
zplug "jocelynmallon/zshmarks"
zplug "agkozak/zsh-z"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
if ! zplug check; then
    zplug install
fi
# source plugins and add commands to the PATH
zplug load

# style control
# for regex completion
zstyle ':completion:*' completer _expand _complete _match _prefix
# fix for slow paste
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Plugins
# Which plugins would you like to load? 
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(
	copybuffer
	copyfile
	docker
	dotenv
	emacs
	fasd 
	kubectl
	kube-ps1
	git 
	gpg-agent
	gcloud
	pass
	nvm
	tmux
)

# need to manually add keychain
# Keychain
eval `keychain --agents ssh --eval id_rsa`
eval `keychain --agents gpg --eval 80DE15A80341233088142CFE134B443F329ED543`
# need to manually source fzf 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# need to manually source kube ps1
source $HOME/.oh-my-zsh/plugins/kube-ps1/kube-ps1.plugin.zsh
# KUBERNETES (this needs to be after)
PROMPT='$(kube_ps1)'$PROMPT

# ALIASES
if command -v brew > /dev/null; then
	alias vim='/usr/local/bin/vi'
	alias vi='/usr/local/bin/vi'
elif command -v apt > /dev/null; then
	alias vi='/usr/bin/vim'
fi
alias start-chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors &> /dev/null &"
alias start-chrome-profile1='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors --profile-directory="Profile 1" &> /dev/null &'
alias start-chrome-profile2='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors --profile-directory="Profile 2" --proxy-server="socks5://localhost:9002" &> /dev/null &'
alias start-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --ignore-certificate-errors &> /dev/null &"
alias start-canary-socks='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --proxy-server="socks5://localhost:9002" &> /dev/null &'
alias start-canary-noproxy='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --no-proxy-server &> /dev/null &'
alias webshare='python -m SimpleHTTPServer'
alias centos='ssh -p 2222 raj@localhost'
alias gtw='~/totp --totp wmt | pbcopy'
# Convert a picture to a favicon
alias make-favicon="convert -colors 256 -resize 16x16 "
# Copy the working dir to the clipboard
alias cpwd='pwd|xargs echo -n|pbcopy'
# Show current airport status:
alias apinfo='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I'
alias httpdump='sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'
alias gitc='git branch | cat | grep "*" | awk "{print $2}"'
alias agf='ag --nobreak --nonumbers --noheading . | fzf'
alias v='f -e vim' # quick opening files with vim


# FUNCTIONS
function mcscope() {
	find . -name '*.java' -exec echo \"{}\" \;> cscope.files && cscope -b
}
# unjar and decompile class files
function unjar () {
  mkdir -p /tmp/unjar/$1 ;
  unzip -d /tmp/unjar/$1 $1 "*.class" 1>/dev/null && find /tmp/unjar/$1 -name "*.class" -type f | xargs jad -ff -nl -nonlb -o -sjava -space -stat ;
}
# open git url in browser
function opengit() {
	vim -c Gbrowse -c q README.md
}
# open git url with selected file
function gbro() {
	vim -c Gbrowse -c q $1
}
# open git url with selected lines
function gbros() {
	vim -c $2,$3Gbrowse -c q $1
}
# find file and open with vi
function vf() {
   vim -p `find . -iname "*$1*"`;
}
# fzf fd another way for cd
function fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# search history
function hist_copy() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//' | pbcopy )
}
zle -N hist_copy

# c - browse chrome history
function ch() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# c - browse chrome bookmarks
function cb() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/Library/Application\ Support/Google/Chrome/Default/Bookmark /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# browse git show fzf
function gits() {
    git show $(git log --pretty=oneline | fzf | awk '{print $1}')
}
# browse git log
function fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# browse git log fancy 
alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
local _gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
local _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"
# fcoc_preview - checkout git commit with previews
function fcoc_preview() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview $_viewGitLogLine ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow_preview - git commit browser with previews
function fshow_preview() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview $_viewGitLogLine \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-y:execute:$_gitLogLineToHash | pbcopy"
}

# fstatus_preview - git show diff of status
alias gsStatus='git status -s "$@"'
local _gitStatusLine="echo {} | awk '{print $2}' | head -1"
local _viewGitStatusLine="$_gitStatusLine | xargs -I % sh -c 'git diff --color=always % | diff-so-fancy'"
function fstatus_preview() {
    gsStatus | awk '{print $2}' |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview $_viewGitStatusLine \
                --header "enter to view, alt-a to run git add, alt-c to run git checkout --" \
                --bind "enter:execute:$_viewGitStatusLine | less -R" \
                --bind "alt-a:execute:$_gitStatusLine | xargs git add" \
                --bind "alt-c:execute:$_gitStatusLine | xargs git checkout --" \
}

# mkdir, cd into it (via http://onethingwell.org/post/586977440/mkcd-improved)
function mkcd () {
    mkdir -p "$*"
    cd "$*"
}

function ydl () {
    for url ($*) /usr/bin/python /usr/local/bin/youtube-dl --continue --literal --console-title --format 22 "$url" || /usr/bin/python /usr/local/bin/youtube-dl --continue --literal --console-title "$url"
}

ke() { k exec -it "$@" -- sh }
fzfc() {cat ~/.zsh_history | awk -F';' '{print $2}' | fzf | pbcopy}
fzfv() {vi $(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')}
fzfn() {nvim $(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')}

# KEY BINDINGS
bindkey '^ ' autosuggest-accept
bindkey "^h" hist-copy
bindkey "^x^o" copybuffer
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Application specific
# Anaconda
if command -v brew > /dev/null; then
	CONDA_PATH=$HOME/opt/anaconda3
elif command -v apt > /dev/null; then
	CONDA_PATH=$HOME/anaconda3
fi
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$CONDA_PATH/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_PATH/etc/profile.d/conda.sh" ]; then
        . "$CONDA_PATH/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_PATH/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
