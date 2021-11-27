# Application specific
# Anaconda
if [[ "${OSTYPE}" == darwin* ]]; then
	CONDA_PATH=$HOME/opt/anaconda3
elif [[ "${OSTYPE}" == linux* ]]; then
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
