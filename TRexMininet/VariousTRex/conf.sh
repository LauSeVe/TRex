#!/bin/bash

# Docker TRex generations
docker run --privileged --cap-add=ALL -v /mnt/huge:/mnt/huge -v /lib/modules:/lib/modules:ro -v /sys/bus/pci/devices:/sys/bus/pci/devices -v /sys/devices/system/node:/sys/devices/system/node -v /dev:/dev -it --name trex1 trexbasic:20.04

# Conexions

## TRex1 veth0 (10.0.0.1) -- s1 -- s2 -- TRex1 veth1 (10.0.0.2)
ovs-docker add-port s1 veth1 trex1 --ipaddress=10.0.0.1/24
ovs-docker add-port s2 veth2 trex1 --ipaddress=10.0.0.2/24

## TRex2 veth3 (10.0.0.3) -- s2 -- s3 -- TRex2 veth4 (10.0.0.4)
ovs-docker add-port s2 veth3 trex2 --ipaddress=10.0.0.3/24
ovs-docker add-port s3 veth4 trex2 --ipaddress=10.0.0.4/24

## TRex3 veth5 (10.0.0.5) -- s3 -- s4 -- TRex3 veth6 (10.0.0.6)
ovs-docker add-port s3 veth5 trex3 --ipaddress=10.0.0.5/24
ovs-docker add-port s4 veth6 trex3 --ipaddress=10.0.0.6/24

## TRex4 veth7 (10.0.0.7) -- s4 -- s1 -- TRex4 veth8 (10.0.0.8)
ovs-docker add-port s4 veth7 trex4 --ipaddress=10.0.0.7/24
ovs-docker add-port s1 veth8 trex4 --ipaddress=10.0.0.8/24

## TRex5 veth9 (10.0.0.9) -- s1 -- s3 -- TRex5 veth10 (10.0.0.10)
ovs-docker add-port s1 veth9 trex5 --ipaddress=10.0.0.9/24
ovs-docker add-port s3 veth10 trex5 --ipaddress=10.0.0.10/24

## TRex6 veth11 (10.0.0.11) -- s2 -- s4 -- TRex6 veth12 (10.0.0.12)
ovs-docker add-port s2 veth11 trex6 --ipaddress=10.0.0.11/24
ovs-docker add-port s4 veth12 trex6 --ipaddress=10.0.0.12/24