#!/bin/bash

# Se el OVS
ovs-vsctl add-br switch

# Conexión 
## Subred switch 10.0.0.0/24
ovs-docker add-port switch veth2 ubuntu --ipaddress=10.0.0.11/24
ovs-docker add-port switch veth3 ubuntu --ipaddress=10.0.0.12/24
