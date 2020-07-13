eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
ansible-playbook \
 -e "ansible_python_interpreter=/usr/bin/python3" \
 -i "./.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory" \
 "$@"