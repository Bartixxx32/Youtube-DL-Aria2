youtube-dl -ciw $1 -f bestvideo+bestaudio -o "Downloads/%(title)s.%(ext)s" --external-downloader aria2c --external-downloader-args '-c -j 10 -x 3 -s 3 -k 1M'
