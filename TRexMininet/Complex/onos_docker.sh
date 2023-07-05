#!/bin/bash

docker run -t -d -p 8181:8181 -p 8101:8101 -p 5005:5005 -p 830:830 --name onos onosproject/onos


ssh-keygen -f "/root/.ssh/known_hosts" -R "[172.17.0.2]:8101"

sleep 10

ssh -p 8101 karaf@172.17.0.2 "app activate org.onosproject.openflow org.onosproject.fwd"


sudo mn --custom topo.py --topo mitopologia --controller=remote,ip=172.17.0.2,port=6633