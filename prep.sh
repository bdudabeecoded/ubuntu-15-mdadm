#!/bin/env bash

set -e

sed -i 's/active/old-releases/' /etc/apt/sources.list
sed -i 's/security/old-releases/' /etc/apt/sources.list

apt-get update

apt-get install mdadm lvm2

mdadm -Asf && vgchange -ay

cat /proc/mdstat
