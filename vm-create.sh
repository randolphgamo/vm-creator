#!/bin/bash

# === CONFIGURABLE VARIABLES ===
VM_NAME=${1:-vm1}
VM_RAM=${2:-2048}
VM_CPUS=${3:-2}
VM_DISK_SIZE=${4:-10G}
VM_ISO=${5:-/var/lib/libvirt/boot/ubuntu-22.04-live-server-amd64.iso}
VM_DISK_PATH="/var/lib/libvirt/images/${VM_NAME}.qcow2"
VM_NETWORK="bridge=br0"  # or use 'default' for NAT

# === CHECKS ===
if [ ! -f "$VM_ISO" ]; then
  echo "❌ ISO not found at $VM_ISO"
  exit 1
fi

if virsh list --all | grep -q "^.* ${VM_NAME} "; then
  echo "❌ VM '$VM_NAME' already exists."
  exit 1
fi

# === CREATE DISK IMAGE ===
echo "📁 Creating disk image: $VM_DISK_PATH ($VM_DISK_SIZE)"
qemu-img create -f qcow2 "$VM_DISK_PATH" "$VM_DISK_SIZE"

# === INSTALL VM ===
echo "🚀 Installing VM '$VM_NAME'..."
virt-install \
  --name "$VM_NAME" \
  --ram "$VM_RAM" \
  --vcpus "$VM_CPUS" \
  --os-type linux \
  --os-variant ubuntu22.04 \
  --disk path="$VM_DISK_PATH",format=qcow2 \
  --network "$VM_NETWORK" \
  --graphics none \
  --console pty,target_type=serial \
  --cdrom "$VM_ISO" \
  --boot useserial=on

# === DONE ===
echo "✅ VM '$VM_NAME' created successfully."
echo "💡 You can connect with: virsh console $VM_NAME"
