# vm-creator

This is a Bash script to provision KVM virtual machines using `virt-install` and libvirt. With this script get a VM in some few minutes.

The script automates: 
* VM creation
* Disk Image setup (for storing the OS and persistent storage)
* Network bridge configuration so the VM acts as if it is any regular workstation in your LAN and gets an IP from the router. No need for port forwarding from host.

How to use it: 

