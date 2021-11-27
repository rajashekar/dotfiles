# file manager
file-manager() {
	find . -type f |
	fzf --no-sort --reverse --tiebreak=index \
		--no-multi  --ansi \
		--preview 'bat --style=numbers \
		               --color=always \
					   --line-range :500 {}' \
		--header "
			enter to view, alt-v to open in vim, 
			alt-n to open in nvim, alt-c to open in code 
			alt-p to copy file path, alt-a to copy file contents" \
		--bind "enter:execute:echo {} | xargs bat" \
		--bind "alt-v:execute:echo {} | xargs vim" \
		--bind "alt-n:execute:echo {} | xargs nvim" \
		--bind "alt-c:execute:echo {} | xargs code" \
		--bind "alt-p:execute:echo $PWD/{} | $COPY_CMD" \
		--bind "alt-a:execute:cat {} | $COPY_CMD"
}
zle -N file-manager
bindkey '^x^f' file-manager
