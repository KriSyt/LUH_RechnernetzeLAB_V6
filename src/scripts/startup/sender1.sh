#!/bin/bash
ip route add 10.3.0.0/16 via 10.1.0.11
ip route add 10.4.0.0/16 via 10.1.0.11
tc qdisc replace dev eth0 root handle 1: netem rate 100mbit
/usr/sbin/sshd -D