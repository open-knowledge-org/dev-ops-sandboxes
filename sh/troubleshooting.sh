### 
tail -f -n 1000 /var/log/messages

###
tail -f -n 1000 /var/log/auth.log

###
tail -f -n 1000 /var/log/secure

### vnStat – A Network Traffic Monitor
yum install vnstat
vnstat --create -i docker0

## Logs
/var/log/messages : General message and system related stuff
/var/log/auth.log : Authenication logs
/var/log/kern.log : Kernel logs
/var/log/cron.log : Crond logs (cron job)
/var/log/maillog : Mail server logs
/var/log/qmail/ : Qmail log directory (more files inside this directory)
/var/log/httpd/ : Apache access and error logs directory
/var/log/lighttpd/ : Lighttpd access and error logs directory
/var/log/boot.log : System boot log
/var/log/mysqld.log : MySQL database server log file
/var/log/secure or /var/log/auth.log : Authentication log
/var/log/utmp or /var/log/wtmp : Login records file
/var/log/yum.log : Yum command log file.