#!/bin/bash

declare -a filesystems=("ext4" "btrfs" "zfs")

function print_progress() {
    echo "##########################################"
    echo "Creating $2 VM image $1"
    echo "##########################################"
    echo ""
}

function preform_image_creation() {
if [[ ! -f output-$2.txt ]]; then
   touch output-$2.txt
fi

command="xen-create-image --hostname=U1604-$2-$1 --dir=/vm-images/$2 --size=30G --memory=2048M --swap=1024M --dist=xenial --ip=145.100.111.84 --gateway=145.100.111.81 --netmask=255.255.255.240 --nameserver=145.100.96.11"

print_progress $1 $2

start=$(($(date +%s%N)/1000000))
${command} &> /dev/null
end=$(($(date +%s%N)/1000000))

execution_time=`expr ${end} - ${start}`

echo "$1:$execution_time" >> output-$2.txt

rm /etc/xen/U1604-$2-$1.cfg
rm -r /vm-images/$2/domains/U1604-$2-$1
}

for i in "${filesystems[@]}"; do
    preform_image_creation $1 $i
    sleep 30
done

