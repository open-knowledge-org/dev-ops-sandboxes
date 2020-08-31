

### Installing

1) On RHEL, CentOS and Fedora
```
sudo yum install ansible
```

2) On RHEL and CentOS, To enable the Ansible Engine repository for RHEL 8, run the following command
```
sudo subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms
sudo yum install epel-release
sudo yum install python-argcomplete

# Global completion requires bash 4.2.
sudo activate-global-python-argcomplete
```

### Getting Started

1) edit or create your hosts on /etc/ansible/hosts
vi /etc/ansible/hosts

2) create an ssh key
ssh-keygen -t rsa -C "your_email@example.com"

3) copy your key to the desired host
ssh-copy-id -i ~/.ssh/mykey user@host

4) Use the ping module to ping all the nodes in your inventory:
ansible all -m ping -u <<user>>

5) Do not proceed before make this simple example working properly. If it's not working check the user permissions, keys, connectivity and so on.

### Validating

- You can use ansible-lint to run a detail check of your playbooks before you execute them.
```
ansible-lint verify-apache.yml
```

## References
- https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html