declare -a filesystems=("ext4" "btrfs" "zfs")

function print_progress() {
    echo "##########################################"
    echo "Creating $2 VM image $1"
    echo "##########################################"
    echo ""

}

function preform_image_creation() {
   if [[ ! -f output-kvm-$2.txt ]]; then
      touch output-kvm-$2.txt
   fi

   if [[ ! -d /vm-images/$2/kvm ]]; then
      mkdir /vm-images/$2/kvm
   fi

   command="virt-install --name U1604-$2-$1 --ram 4096 \
 --disk path=/vm-images/$2/kvm/U1604-$2-$1.img,size=30,format=raw \
 --vcpus 4 --os-type linux --os-variant generic \
 --graphics vnc --network bridge=xenbr0 \
 --location 'http://nl.archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/' \
 --extra-args="ks=file:/root/preseed.cfg" --initrd-inject=/root/preseed.cfg"

   print_progress $1 $2

   start=$(($(date +%s%N)/1000000))
   ${command} &> /dev/null
   end=$(($(date +%s%N)/1000000))

   execution_time=`expr ${end} - ${start}`

   echo "$1:$execution_time" >> output-kvm-$2.txt

   virsh destroy U1604-$2-$1
   virsh undefine U1604-$2-$1 --remove-all-storage

}

for i in "${filesystems[@]}"; do
    preform_image_creation $1 $i
    sleep 300
done
