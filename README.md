# vm-creator

This is a Bash script to provision KVM virtual machines using `virt-install` and libvirt. With this script get a VM in some few minutes.

The script automates: 
* VM creation
* Disk Image setup (for storing the OS and persistent storage)
* Network bridge configuration so the VM acts as if it is any regular workstation in your LAN and gets an IP from the router. No need for port forwarding from host.

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

