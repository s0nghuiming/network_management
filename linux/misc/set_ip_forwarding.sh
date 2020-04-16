#!$(which env) bash

# On server side

echo Current IP Forwarding is $(cat /proc/sys/net/ipv4/ip_forward)

old_ip_fwd=$(cat /proc/sys/net/ipv4/ip_forward)

echo 1 > /proc/sys/net/ipv4/ip_forward

# /etc/sysctl.conf
# net.ipv4.ip_forward = 1 for persistant.


# On server side
ip route add 10.0.0.0/24 via 192.168.0.15 dev enp0s3


# On client side
ip route add 192.168.0.0/24 via 10.0.0.15 dev enp0s3
