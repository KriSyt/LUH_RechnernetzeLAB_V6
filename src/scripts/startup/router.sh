#!/bin/bash
iptables -A FORWARD -i eth0 -j ACCEPT
iptables -A FORWARD -i eth1 -j ACCEPT
ip link add name switch_bridge type bridge
ip link set dev switch_bridge up
ip link set eth0 master switch_bridge
ip link set eth1 master switch_bridge
ip route del default
ip route del 10.3.0.0/16
ip route del 10.4.0.0/16
ip route add 10.3.0.0/16 dev switch_bridge src 10.3.0.11
ip route add 10.4.0.0/16 dev switch_bridge src 10.4.0.11
tc qdisc add dev switch_bridge root handle 1: netem rate 50mbit
/usr/sbin/sshd -D
