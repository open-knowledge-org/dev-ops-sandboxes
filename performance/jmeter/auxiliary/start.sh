sudo setenforce 0
sudo iptables -A INPUT -m state --state NEW -p tcp --dport 8100 -j ACCEPT
sudo service iptables save
sudo firewall-cmd --zone=public --permanent --add-port=8100/tcp
sudo firewall-cmd --reload
sudo node server.js
