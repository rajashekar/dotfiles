# history manager
local _commandContent="echo -n {} | sed 's/^ [^ ]* //g;s/\\\\n/\\\\\\n/g'"
function history-manager() {
	(fc -l 1 || history) | fzf +s --tac --reverse \
		--tiebreak=index --no-multi --ansi \
		--preview "$_commandContent | bat --style=numbers --color=always" \
		--header "enter to copy to clipboard, alt-v to view" \
		--bind "enter:execute[$_commandContent | $COPY_CMD]+abort" \
		--bind "alt-v:execute:$_commandContent | less -RiN"
}
zle -N history-manager
bindkey '^x^r' history-manager
