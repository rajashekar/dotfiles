case "$OSTYPE" in
        (darwin*) OPEN_CMD='open'  ;;
        (cygwin*) OPEN_CMD='cygstart'  ;;
        (linux*) [[ "$(uname -r)" != *icrosoft* ]] && OPEN_CMD='nohup xdg-open'  || {
                        OPEN_CMD='cmd.exe /c start ""'
                        [[ -e "$1" ]] && {
                                1="$(wslpath -w "${1:a}")"  || return 1
                        }
                } ;;
        (msys*) OPEN_CMD='start ""'  ;;
        (*) echo "Platform $OSTYPE not supported"
                return 1 ;;
esac

export OPEN_CMD

if [[ "${OSTYPE}" == darwin* ]] && (( ${+commands[pbcopy]} )) && (( ${+commands[pbpaste]} )); then
    COPY_CMD=pbcopy
    PASTE_CMD=pbpaste
elif [ -n "${DISPLAY:-}" ] && (( ${+commands[xclip]} )); then
    COPY_CMD='xclip -in -selection clipboard'
    PASTE_CMD='xclip -out -selection clipboard'
elif [ -n "${DISPLAY:-}" ] && (( ${+commands[xsel]} )); then
    COPY_CMD='xsel --clipboard --input'
    PASTE_CMD='xsel --clipboard --output'
fi

export COPY_CMD
export PASTE_CMD
