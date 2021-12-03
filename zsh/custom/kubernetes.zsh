# PODS
kpe() {
  selected=$(k get pods | fzf | awk '{print $1}')
  [[ -n $selected ]] && k exec -it $selected -- sh
}
kpl() {
  selected=$(k get pods | fzf | awk '{print $1}')
  [[ -n $selected ]] && k logs $selected -f | less -i
}
kpt() {
  selected=$(k get pods | fzf | awk '{print $1}')
  [[ -n $selected ]] && k logs $selected --tail=100 | less -i
}
# DEPLOYMENTS
kde() {
  selected=$(k get deployments | fzf | awk '{print $1}')
  [[ -n $selected ]] && k edit deployment $selected
}
