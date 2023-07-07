#!/bin/bash

# Conexions
## TRex1 veth1 (10.0.0.1) -- s1 -- s2 -- TRex1 veth2 (10.0.0.2)
ovs-docker add-port s1 veth1 trex1 --ipaddress=10.0.0.1/24
ovs-docker add-port s2 veth2 trex1 --ipaddress=10.0.0.2/24

## TRex2 veth1 (10.0.0.3) -- s2 -- s3 -- TRex2 veth2 (10.0.0.4)
ovs-docker add-port s2 veth1 trex2 --ipaddress=10.0.0.3/24
ovs-docker add-port s3 veth2 trex2 --ipaddress=10.0.0.4/24

## TRex3 veth1 (10.0.0.5) -- s3 -- s4 -- TRex3 veth2 (10.0.0.6)
ovs-docker add-port s3 veth1 trex3 --ipaddress=10.0.0.5/24
ovs-docker add-port s4 veth2 trex3 --ipaddress=10.0.0.6/24

## TRex4 veth1 (10.0.0.7) -- s4 -- s1 -- TRex2 veth8 (10.0.0.8)
ovs-docker add-port s4 veth1 trex4 --ipaddress=10.0.0.7/24
ovs-docker add-port s1 veth2 trex4 --ipaddress=10.0.0.8/24

## TRex5 veth1 (10.0.0.9) -- s1 -- s3 -- TRex2 veth10 (10.0.0.10)
ovs-docker add-port s1 veth1 trex5 --ipaddress=10.0.0.9/24
ovs-docker add-port s3 veth2 trex5 --ipaddress=10.0.0.10/24

## TRex6 veth1 (10.0.0.11) -- s2 -- s4 -- TRex6 veth2 (10.0.0.12)
ovs-docker add-port s2 veth1 trex6 --ipaddress=10.0.0.11/24
ovs-docker add-port s4 veth2 trex6 --ipaddress=10.0.0.12/24