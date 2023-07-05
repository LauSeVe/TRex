#!/bin/bash

## TREX and Ubuntu
docker rm -f ubuntu trexubuntu

## Bridges
sudo ovs-vsctl del-br net1 
sudo ovs-vsctl del-br net2