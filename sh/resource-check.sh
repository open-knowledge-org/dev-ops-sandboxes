## PS order by Memory
ps aux  | awk '{print $6/1024 " MB\t\t" $11}'  | sort -n
ps aux  | sort -n
ps aux --sort -rss
ps aux | sort -rn -k 5,6
ps --sort -rss -eo rss,pid,command | head
ps aux | awk '{print $4"\t"$11}' | sort | uniq -c | awk '{print $2" "$1" "$3}' | sort -nr

## Process Tree
pstree -hgcp

## Network Used Ports
sudo netstat -ntl

## Network - Established Connection per port
sudo netstat -anp | grep :80 | grep ESTABLISHED | wc -l

## Hard Disk usage
sudo df -h

## Available RAM Memory
free -m

## cpu, ram stats
vmstat -SM 1 100

## shell alias
alias ducks='du -cks * | sort -rn | head'
ducks