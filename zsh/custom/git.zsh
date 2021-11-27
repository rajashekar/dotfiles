# browse git show fzf
function gits() {
    git show $(git log --pretty=oneline | fzf | awk '{print $1}')
}

# open git url in browser
# open git url with selected file
function opengit() {
	vim -c Gbrowse -c q $1
}
# open git url with selected lines
function opengitsel() {
	vim -c $2,$3Gbrowse -c q $1
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
                --bind "enter:execute:$_viewGitLogLine   | bat" \
                --bind "alt-y:execute:$_gitLogLineToHash | $COPY_CMD"
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

zle -N fshow_preview
zle -N fstatus_preview

bindkey '^xg' fstatus_preview
bindkey '^xs' fshow_preview
