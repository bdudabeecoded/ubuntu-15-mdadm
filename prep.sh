#!/bin/env bash

set -e

sed -i 's/\/archive\./\/old-releases\./' /etc/apt/sources.list
sed -i 's/\/security\./\/old-releases\./' /etc/apt/sources.list

apt-get update

apt-get install mdadm lvm2

mdadm -Asf && vgchange -ay

cat /proc/mdstat

set +e

for i in {1..4}; do
  mkdir -p /mnt/volume_${i}
  mount -o ro /dev/vg1/volume_${i} /mnt/volume_${i}
done
