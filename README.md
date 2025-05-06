# vm-creator

This is a Bash script to provision KVM virtual machines using `virt-install` and libvirt. With this script get a VM in some few minutes.

The script automates: 
* VM creation
* Disk Image setup (for storing the OS and persistent storage)
* Network bridge configuration so the VM acts as if it is any regular workstation in your LAN and gets an IP from the router. No need for port forwarding from host.

### Prerequisites
The script assumes you already have:
* KVM + libvirt installed. Otherwise, use the command to install it:
```
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
```
* Your ISO in /var/lib/libvirt/boot/. Otherwise, get the iso using:
```
wget -v https://releases.ubuntu.com/22.04/ubuntu-22.04-live-server-amd64.iso
```
For this case, we download Ubuntu 22.04 LTS



## How to use it: 

1. Download and save the file as `vm-create.sh` and make it executable:
```
chmod +x vm-create.sh
```
   
2. Run it like this:
 ```
 ./vm-create.sh
 ```
It will default to `vm1` with 2GB RAM, 2CPUs, 10GB disk

3. Or you can customize individual specs with:
```
./vm-create.sh myvm 2048 2 10G /var/lib/libvirt/boot/ubuntu-22.04-live-server-amd64.iso
```

