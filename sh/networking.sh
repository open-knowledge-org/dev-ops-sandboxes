## Copy ssh keys

ssh-copy-id -i ~/.ssh/mykey user@host

## restart network interfaces
sudo ip addr flush interface-name
sudo systemctl restart networking

## Sharing Folder
mount -t cifs -o username=<change it> <network-folder> <local-folder

## Check Firewalld Status
systemctl status firewalld.service
sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --reload

## Check Iptables Status
sudo iptables -L
sudo iptables -L --line-numbers
sudo iptables -A FORWARD -i docker0 -o eth0 -j ACCEPT
sudo iptables -A FORWARD -i eth0 -o docker0 -j ACCEPT
sudo iptables -I INPUT -j ACCEPT

sudo journalctl -fu NetworkManager

## TCP Null Scan to fool a firewall to generate a response ##
## Does not set any bits (TCP flag header is 0) ##
nmap -sN 192.168.253.44

## TCP Fin scan to check firewall ##
## Sets just the TCP FIN bit ##
nmap -sF 192.168.253.44

## TCP Xmas scan to check firewall ##
## Sets the FIN, PSH, and URG flags, lighting the packet up like a Christmas tree ##
nmap -sX 192.168.253.44

# Complete check
nmap -v -sS -A -T4 192.168.253.44