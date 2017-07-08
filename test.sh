#!/usr/bin/env bash

# SetUp
rm -rf venv
python -m pip install virtualenv
python -m virtualenv venv
source venv/bin/activate
python -m pip install -U pip
python -m pip install -Ur requirements.txt
vagrant destroy -f
vagrant up
ansible test --inventory=inventory --user=vagrant --private-key=~/.vagrant.d/insecure_private_key -m ping
# Test
ansible-playbook --inventory=inventory --user=vagrant --private-key=~/.vagrant.d/insecure_private_key bootstrap.yml --tags "configure_admin_user"
ansible-playbook --inventory=inventory --user=admin --private-key=~/.ssh/id_rsa.pub tests/configure_admin_user.yml
ansible-playbook --inventory=inventory --user=vagrant --private-key=~/.vagrant.d/insecure_private_key bootstrap.yml --tags "configure_ssh"
ansible-playbook --inventory=inventory --user=admin --private-key=~/.ssh/id_rsa.pub tests/configure_ssh.yml
# TearDown
vagrant destroy -f
deactivate
ssh-keygen -R 172.16.172.2
ssh-keygen -R 172.16.172.3
ssh-keygen -R 172.16.172.4
rm -f ~/.ssh/known_hosts.old