#!/bin/bash

# Se crean las subredes
sudo ovs-vsctl add-br b1
sudo ovs-vsctl add-br b2

# Conexión a los contenedores
Subred 10.0.1.0/24 b1
~~~
sudo ovs-docker add-port b1 veth0 trexceos --ipaddress=10.0.1.1/24
sudo ovs-docker add-port b1 veth0 ceos --ipaddress=10.0.1.2/24
~~~

Subred 10.0.2.0/24 b2
~~~
sudo ovs-docker add-port b2 veth2 trexceos --ipaddress=10.0.2.1/24
sudo ovs-docker add-port b2 veth1 ceos --ipaddress=10.0.2.2/24
~~~

# Para iniciar el ceos
docker start ceos