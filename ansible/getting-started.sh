# On RHEL, CentOS and Fedora
sudo yum install ansible

# On RHEL and CentOS, To enable the Ansible Engine repository for RHEL 8, run the following command
# sudo subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms

# sudo yum install epel-release
# sudo yum install python-argcomplete

# Global completion requires bash 4.2.
# sudo activate-global-python-argcomplete

## Getting Started

# edit or create your hosts on /etc/ansible/hosts
vi /etc/ansible/hosts

# create an ssh key
ssh-keygen -t rsa -C "your_email@example.com"

# copy your key to the desired host
ssh-copy-id -i ~/.ssh/mykey user@host

# Use the ping module to ping all the nodes in your inventory:
ansible all -m ping -u <<user>>

# Please, do not proceed before make this simple working properly
# If it's not working check the user permissions, keys, connectivity and so on.
