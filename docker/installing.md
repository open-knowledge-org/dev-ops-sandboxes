### Docker Installation
```
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
  
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
	
sudo yum install docker-ce
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

#### Docker Compose Installing
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

```

#### Docker Proxy (if applicable)
```
sudo mkdir -p /etc/systemd/system/docker.service.d
```
```
sudo nano /etc/systemd/system/docker.service.d/http-proxy.conf
# http-proxy.conf content
[Service]
Environment="HTTP_PROXY=http://user:password@host:port/"
```
```
sudo nano /etc/systemd/system/docker.service.d/https-proxy.conf
# https-proxy.conf content
[Service]
Environment="HTTPS_PROXY=http://user:password@host:port/"
```
```
sudo nano /etc/systemd/system/docker.service.d/no-proxy.conf
# no-proxy.conf content
[Service]
Environment="NO_PROXY=http://user:password@host:port/"
```
```
# Reload the systemd daemon
sudo systemctl daemon-reload
# Restart Docker
systemctl restart docker
# Show Environment Configs
systemctl show docker --property Environment
```

## IpTables Configuration [Optional]

### IpTables Rules
```
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X
iptables -nvL

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i docker0 -j ACCEPT
iptables -A FORWARD -i docker0 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o docker0 -j ACCEPT

systemctl status firewalld
``` 
