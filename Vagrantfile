MEMORY = 24000
# May be more than available on the host PC since libvirt is QEMU based hence is able to emulate cores
CPUS = 8
STORAGE = 100

LIBVIRT_HOST = ENV["LIBVIRT_HOST"]
LIBVIRT_USER = ENV["LIBVIRT_USER"]

Vagrant.configure("2") do |config|
  #  Allows to use SSH Agent. Great for Git Clone operations through 'vagrant ssh'
  config.ssh.forward_agent = true

  config.vm.provider "libvirt" do |v|
    v.memory = MEMORY
    v.cpus = CPUS
    v.machine_virtual_size = STORAGE

    unless LIBVIRT_HOST.nil?
      v.connect_via_ssh = true
      v.host = LIBVIRT_HOST
      v.username = LIBVIRT_USER
    end
  end

  config.vm.hostname = "vmkube"
  config.vm.box = "centos/8"
  config.vm.network "private_network", type: "dhcp"
  config.vm.provision "shell", :inline => "
    sudo yum install python3 cloud-utils-growpart -y
    sudo growpart /dev/vda 1
    sudo xfs_growfs -d /
  "
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.galaxy_role_file = "requirements.yml"
    ansible.extra_vars = {
        ansible_python_interpreter: "/usr/bin/python3",
    }
  end
end