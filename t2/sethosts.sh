#!/bin/sh

ip=$(curl ipinfo.io/ip)

cat <<__EOT__ >/etc/hosts
127.0.1.1 chef.streambox.com chef
127.0.0.1 localhost
$ip chef.streambox.com chef

# The following lines are desirable for IPv6 capable hosts
::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
__EOT__
