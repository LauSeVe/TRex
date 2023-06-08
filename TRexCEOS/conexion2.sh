#!/bin/bash 
# brctl show 

# Se crean las redes docker
docker network create --subnet 10.0.1.0/24 net1
docker network create --subnet 10.0.2.0/24 net2

# Conexión a los contenedores
## Subred net1
docker network connect --ip 10.0.1.1 net1 trexceos
docker network connect --ip 10.0.1.2 net1 ceos

## Subred net2 
docker network connect --ip 10.0.2.1 net2 trexceos
docker network connect --ip 10.0.2.2 net2 ceos

