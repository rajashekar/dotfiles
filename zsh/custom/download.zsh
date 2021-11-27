function ydl () {
    for url ($*) /usr/bin/python /usr/local/bin/youtube-dl  \
        --continue --literal --console-title --format 22 "$url" || 
            /usr/bin/python /usr/local/bin/youtube-dl --continue \
                --literal --console-title "$url"
}
