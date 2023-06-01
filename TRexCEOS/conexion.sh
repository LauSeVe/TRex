#!/bin/bash

# Se crean las redes docker
docker network create net1
docker network create net2

# Conexión a los contenedores
## Subred net1
docker network connect net1 ceos
docker network connect net1 trexceos
## Subred net2 
docker network connect net2 ceos
docker network connect net2 trexceos

# Para iniciar el ceos
docker start ceos