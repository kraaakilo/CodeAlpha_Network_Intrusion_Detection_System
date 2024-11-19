# i setup this vulnerable machine in a proxmox node to test my nids
wget https://sourceforge.net/projects/metasploitable/files/Metasploitable2/metasploitable-linux-2.0.0.zip
unzip metasploitable-linux-2.0.0.zip
cd Metasploitable2-Linux/
qemu-img convert -O qcow2 Metasploitable.vmdk metasploitable.qcow2
qm create 300 --memory 2048 --cores 2 --name Metasploitable2 --net0 virtio,bridge=vmbr1 --boot c --bootdisk ide0
qm importdisk 300 metasploitable.qcow2 local-lvm
qm set 300 --ide0 local-lvm:vm-300-disk-0