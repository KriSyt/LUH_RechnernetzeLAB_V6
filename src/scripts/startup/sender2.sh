#!/bin/bash
ip route add 10.3.0.0/16 via 10.2.0.11
ip route add 10.4.0.0/16 via 10.2.0.11
tc qdisc replace dev eth0 root tbf rate  100mbit latency 1ms burst 1600 
/usr/sbin/sshd -D