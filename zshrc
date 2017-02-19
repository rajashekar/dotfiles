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
ZSH_THEME="powerlevel9k/powerlevel9k"
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
PATH=/Users/rchint1/Documents/jad:/usr/local/bin:$PATH
alias start-eclipse='open /Users/rchint1/Documents/Eclipse.app'
alias start-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --ignore-certificate-errors &> /dev/null &"
alias start-chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors &> /dev/null &"
alias webshare='python -m SimpleHTTPServer'
# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks='tmux kill-session -t'
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
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward
