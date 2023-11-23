#!/bin/bash
ip route add 10.1.0.0/16 via 10.4.0.11 
ip route add 10.2.0.0/16 via 10.4.0.11
/usr/sbin/sshd -D