#!/bin/sh
# see https://community.openvpn.net/openvpn/wiki/Concepts-PolicyRouting-Linux

ip route add table 42 default via 192.168.1.1
ip rule add from 192.168.1.8/32 table 42
ip rule add from 10.244.0.0/16 table 42
ip rule add from 192.168.1.8/32 to 10.244.0.0/16 table main
ip rule add from 10.244.0.0/16 to 10.244.0.0/16 table main