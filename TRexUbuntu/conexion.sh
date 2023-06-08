#!/bin/bash

# Se crean las redes 
ovs-vsctl add-br net1
ovs-vsctl add-br net2

# Conexión 
## Subred net1 10.0.1.0/24
sudo ovs-docker add-port net1 veth0 trexceos --ipaddress=10.0.1.1/24
sudo ovs-docker add-port net1 veth0 ubuntu --ipaddress=10.0.1.2/24

## Subred net2 10.0.2.0/24
sudo ovs-docker add-port net2 veth1 trexceos --ipaddress=10.0.2.1/24
sudo ovs-docker add-port net2 veth1 ubuntu --ipaddress=10.0.2.2/24
