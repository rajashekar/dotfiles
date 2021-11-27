# ALIASES
if [[ "${OSTYPE}" == darwin* ]]; then
	alias vim='/usr/local/bin/vi'
	alias vi='/usr/local/bin/vi'
	alias start-chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors &> /dev/null &"
	alias start-chrome-profile1='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors --profile-directory="Profile 1" &> /dev/null &'
	alias start-chrome-profile2='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors --profile-directory="Profile 2" --proxy-server="socks5://localhost:9002" &> /dev/null &'
	alias start-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --ignore-certificate-errors &> /dev/null &"
	alias start-canary-socks='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --proxy-server="socks5://localhost:9002" &> /dev/null &'
	alias start-canary-noproxy='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --no-proxy-server &> /dev/null &'
	alias apinfo='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I'
elif [[ "${OSTYPE}" == linux* ]]; then
	alias vi='/usr/bin/vim'
fi
alias webshare='python -m SimpleHTTPServer'
alias centos='ssh -p 2222 raj@localhost'
alias gtw='~/totp --totp wmt | clipcopy'
alias cpwd='pwd|xargs echo -n| clipcopy'
# Show current airport status:
alias httpdump='sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'
alias gitc='git branch | cat | grep "*" | awk "{print $2}"'
alias v='f -e vim' # quick opening files with vim
