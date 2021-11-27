if [[ "${OSTYPE}" == darwin* ]]; then
    CHROME_HISTORY=~/Library/Application\ Support/Google/Chrome/Default/History
    CHROME_BOOKMARKS=~/Library/Application\ Support/Google/Chrome/Default/Bookmarks
elif [[ "${OSTYPE}" == linux* ]]; then
    CHROME_HISTORY=~/.config/google-chrome/Default/History
    CHROME_BOOKMARKS=~/.config/google-chrome/Default/Bookmarks
fi

# Browse chrome history
function chrome_search_history() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'


  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f $CHROME_HISTORY /tmp/temph

  sqlite3 -separator $sep /tmp/temph \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $OPEN_CMD
}

# Browse chrome bookmarks
function chrome_search_bookmarks() {
  grep 'url.:' $CHROME_BOOKMARKS | 
      awk '{print $2}' | 
      sed 's/"//g' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $OPEN_CMD
}

zle -N chrome_search_history
zle -N chrome_search_bookmarks 

bindkey '^xa' chrome_search_history
bindkey '^xb' chrome_search_bookmarks
