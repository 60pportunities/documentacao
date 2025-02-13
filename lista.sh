

find . -type f | awk -F. 'NF>1 {print $NF} NF==1 {print "(sem extensão)"}' | sort -u

find . -type f -exec du -h {} + | sort -rh | head -n 10
