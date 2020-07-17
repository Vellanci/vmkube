# Installing Kubernetes on VM

### Prerequisites
* Ansible 2.7+
* Vagrant
* QEMU, Libvirt, Vagrant-Libvirt plugin 
    * Follow to install: https://github.com/vagrant-libvirt/vagrant-libvirt
    
### Steps
1. Set up memory, cpu and storage in Vagrantfile
    * CPU can be more than available on the machine
2. `vagrant up --provider libvirt`
3. `cp ~/.vmkube/config ~/.kube/config` (optional, to replace current kube config)
4. (optional) To find dashboard token: `kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')`