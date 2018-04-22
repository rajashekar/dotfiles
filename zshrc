# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/rchint1/.oh-my-zsh
DEFAULT_USER=rchint1
export TERM="xterm-256color"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="af-magic"
#ZSH_THEME="rawsyntax"
if [ -n "$INSIDE_EMACS" ]; then
	ZSH_THEME="robbyrussell"
else
	ZSH_THEME="powerlevel9k/powerlevel9k"
fi
#ZSH_THEME="TheOne"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh
export DOTFILES=$HOME/.dotfiles
export ZSH=$DOTFILES/zsh
# source all .zsh files inside of the zsh/ directory
for config ($ZSH/**/*.zsh) source $config

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

source ~/.profile

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
PATH=/Users/rchint1/Library/Android/sdk/platform-tools:/usr/local/gnat/bin:/Users/rchint1/Documents/jad:/usr/local/bin:$PATH
alias start-eclipse='open /Users/rchint1/Documents/Eclipse.app'
alias start-chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors &> /dev/null &"
alias start-chrome-profile1='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors --profile-directory="Profile 1" &> /dev/null &'
alias start-chrome-profile2='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors --profile-directory="Profile 2" --proxy-server="socks5://localhost:9002" &> /dev/null &'
alias start-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --ignore-certificate-errors &> /dev/null &"
alias start-canary-socks='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --proxy-server="socks5://localhost:9002" &> /dev/null &'
alias start-canary-noproxy='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --no-proxy-server &> /dev/null &'
alias webshare='python -m SimpleHTTPServer'
alias centos='ssh -p 2222 rajashekar@localhost'
# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks='tmux kill-session -t'
alias tnw='tmux new-window -t base -n'
# iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
#load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zplug
source ~/.zplug/init.zsh
zplug "jocelynmallon/zshmarks"
zplug "zsh-users/zsh-autosuggestions"
zplug load --verbose
bindkey '^ ' autosuggest-accept

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
	vi -c Gbrowse -c q README.md
}
# open git url with selected file
function gbro() {
	vi -c Gbrowse -c q $1
}
# open git url with selected lines
function gbros() {
	vi -c $2,$3Gbrowse -c q $1
}
# find file and open with vi
function vf() {
   vi -p `find . -iname "*$1*"`;
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
                --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}
# fstatus_preview - git show diff of status

alias gsStatus='git status -s "$@"'
local _gitStatusLine="echo {} | awk '{print $2}' | head -1"
local _viewGitStatusLine="$_gitStatusLine | xargs -I % sh -c 'git diff --color=always % | diff-so-fancy'"

fstatus_preview() {
    gsStatus | awk '{print $2}' |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview $_viewGitStatusLine \
                --header "enter to view, alt-a to run git add" \
                --bind "enter:execute:$_viewGitStatusLine | less -R" \
                --bind "alt-a:execute:$_gitStatusLine | xargs git add"
}
