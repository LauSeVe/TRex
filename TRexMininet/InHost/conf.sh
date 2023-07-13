#!/bin/bash

## Instalación paquetes basicos
apt-get install -y sudo gcc g++ python zlib1g-dev wget tcpdump pciutils kmod strace net-tools python3 python3-distutils iproute2 iputils-ping nano

## TREX
cp trex_cfg.yaml /etc/trex_cfg.yaml
wget --no-cache --no-check-certificate https://trex-tgn.cisco.com/trex/release/v2.97.tar.gz
tar -xzvf v2.97.tar.gz 

## ONOS
docker run -t -d -p 8181:8181 -p 8101:8101 -p 5005:5005 -p 830:830 --name onos onosproject/onos

ssh-keygen -f "/root/.ssh/known_hosts" -R "[172.17.0.2]:8101"
sleep 10
ssh -p 8101 karaf@172.17.0.2 "app activate org.onosproject.openflow org.onosproject.fwd"

## MININET
mn --custom topo.py --topo mitopologia --controller=remote,ip=172.17.0.2,port=6633