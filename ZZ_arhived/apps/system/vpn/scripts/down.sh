#!/bin/sh
# see https://community.openvpn.net/openvpn/wiki/Concepts-PolicyRouting-Linux

sudo ip rule delete from 192.168.1.8/32 table 42
sudo ip rule delete from 10.244.0.0/16 table 42
sudo ip rule delete from 192.168.1.8/32 to 10.244.0.0/16 table main
sudo ip rule delete from 10.244.0.0/16 to 10.244.0.0/16 table main
sudo ip route flush table 42

