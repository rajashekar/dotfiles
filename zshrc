PATH=/usr/local/bin:/usr/local/texlive/2021/bin/universal-darwin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/Users/rchint1/.oh-my-zsh
DEFAULT_USER=rchint1
export TERM="xterm-256color"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="af-magic"
#ZSH_THEME="rawsyntax"
#ZSH_THEME="agnoster"
#if [ -n "$INSIDE_EMACS" ]; then
#	ZSH_THEME="robbyrussell"
#else
#	ZSH_THEME="powerlevel9k/powerlevel9k"
#fi
#ZSH_THEME="TheOne"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-z)

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/fasd/fasd.plugin.zsh
source ~/.profile

# source all .zsh files inside of the zsh/ directory
# export DOTFILES=$HOME/.dotfiles
# export ZSH=$DOTFILES/zsh
# for config ($ZSH/**/*.zsh) source $config

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vi'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zplug
source ~/.zplug/init.zsh
zplug "jocelynmallon/zshmarks"
zplug "zsh-users/zsh-autosuggestions"
zplug load --verbose
bindkey '^ ' autosuggest-accept

# iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias start-chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors &> /dev/null &"
alias start-chrome-profile1='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors --profile-directory="Profile 1" &> /dev/null &'
alias start-chrome-profile2='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors --profile-directory="Profile 2" --proxy-server="socks5://localhost:9002" &> /dev/null &'
alias start-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --ignore-certificate-errors &> /dev/null &"
alias start-canary-socks='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --proxy-server="socks5://localhost:9002" &> /dev/null &'
alias start-canary-noproxy='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --no-proxy-server &> /dev/null &'
alias webshare='python -m SimpleHTTPServer'
alias centos='ssh -p 2222 raj@localhost'

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks='tmux kill-session -t'
alias tnw='tmux new-window -t base -n'

# get current branch
alias gitc='git branch | cat | grep "*" | awk "{print $2}"'

# custom functions
function mcscope() {
	find . -name '*.java' -exec echo \"{}\" \;> cscope.files && cscope -b
}
# unjar and decompile class files
unjar () {
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
# ctrl p at command line
ctrlp() {
  </dev/tty vim -c CtrlP
}
zle -N ctrlp
# key bindings
bindkey "^p" ctrlp
#bindkey "^R" history-incremental-pattern-search-backward
#bindkey "^S" history-incremental-pattern-search-forward
# for regex completion
zstyle ':completion:*' completer _expand _complete _match _prefix
# fix for slow paste
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

export NVM_DIR="/Users/rchint1/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias vi='vim'

# fzf fd another way for cd
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

alias agf='ag --nobreak --nonumbers --noheading . | fzf'

# search history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# c - browse chrome history
ch() {
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
cb() {
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
GPG_TTY=$(tty)
export GPG_TTY

# browse git show fzf
gits() {
    git show $(git log --pretty=oneline | fzf | awk '{print $1}')
}
# browse git log
fshow() {
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
fcoc_preview() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview $_viewGitLogLine ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow_preview - git commit browser with previews
fshow_preview() {
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

fstatus_preview() {
    gsStatus | awk '{print $2}' |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview $_viewGitStatusLine \
                --header "enter to view, alt-a to run git add, alt-c to run git checkout --" \
                --bind "enter:execute:$_viewGitStatusLine | less -R" \
                --bind "alt-a:execute:$_gitStatusLine | xargs git add" \
                --bind "alt-c:execute:$_gitStatusLine | xargs git checkout --" \
}

# fasd
eval "$(fasd --init auto)"
alias v='f -e vim' # quick opening files with vim
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin:~/protoc-3.7.0-osx-x86_64/bin
export ISTIO=$GOPATH/src/istio.io # eg. ~/go/src/istio.io

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
#PS1='$(kube_ps1)'$PS1
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history
# save each command's beginning timestamp and the duration to the history file
setopt extended_history 
setopt hist_ignore_all_dups
# Convert a picture to a favicon
alias make-favicon="convert -colors 256 -resize 16x16 "

# Copy the working dir to the clipboard
alias cpwd='pwd|xargs echo -n|pbcopy'

# Show current airport status:
alias apinfo='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I'

alias httpdump='sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'

# mkdir, cd into it (via http://onethingwell.org/post/586977440/mkcd-improved)
function mkcd () {
    mkdir -p "$*"
    cd "$*"
}

function ydl () {
    for url ($*) /usr/bin/python /usr/local/bin/youtube-dl --continue --literal --console-title --format 22 "$url" || /usr/bin/python /usr/local/bin/youtube-dl --continue --literal --console-title "$url"
}

 export PATH="~/.cask/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/rchint1/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/rchint1/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/rchint1/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/rchint1/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time anaconda virtualenv)

alias gtw='~/totp --totp wmt | pbcopy'

# function to push to git
function obsidianpush() {
    git add --all
    git commit -a -m "sync notes"
    git pull --rebase
    git push
}

# aliases
alias opull="cd ~/Google\ Drive/obsidian/Obsidian && git pull"
alias opush="cd ~/Google\ Drive/obsidian/Obsidian && obsidianpush"

GPG_TTY=`tty`
export GPG_TTY

# Keychain
eval `keychain --agents ssh --eval id_rsa`
eval `keychain --agents gpg --eval 80DE15A80341233088142CFE134B443F329ED543`

# rclone
export RCLONE_PASSWORD_COMMAND="pass rc"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rchint1/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rchint1/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rchint1/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rchint1/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1
