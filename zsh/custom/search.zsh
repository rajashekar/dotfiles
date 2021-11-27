alias agf='ag --nobreak --nonumbers --noheading . | fzf'
alias rgf='rg --column --line-number --no-heading --smart-case . | fzf'

find-in-file() {
    #!/bin/bash
    [[ -n $1 ]] && cd $1 # go to provided folder or noop
    RG_DEFAULT_COMMAND="rg -i -l --hidden --no-ignore-vcs"

    selected=$(
    FZF_DEFAULT_COMMAND="rg --files" fzf \
      -m \
      -e \
      --ansi \
      --phony \
      --reverse \
      --bind "ctrl-a:select-all" \
      --bind "change:reload:$RG_DEFAULT_COMMAND {q} || true" \
      --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2
    )

    [[ -n $selected ]] && vim $selected # open multiple files in editor
}
zle -N find-in-file
bindkey '^xf' find-in-file
