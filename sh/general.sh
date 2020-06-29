# Convert all files recursively
find . -type f -print0 | xargs -0 dos2unix

## Clear and Edit File
cat /dev/null > interactive.sh && nano interactive.sh

## Locate File
sudo find . -type f -name "*.crt"
sudo find . -type f -name "FileName"

### SO UPDATES
sudo sysctl -a | grep overco

sudo sysctl -w vm.overcommit_memory=1
sudo sysctl -w vm.swappiness=1

* - nofile 16384

#more than 150 = too many open files
/etc/security/limit.conf

#Edit the /etc/security/limit.conf file.
#Change the statement that specifies the value of nofiles to 8000.
#If you want the change to take effect in the current session, type ulimit -n 8000.

## Get value on a base array
# yum install jq
cat example.json | jq '.[] | .HostsPath'


