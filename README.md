# TRex con Mininet y ONOS

## Desplegar ONOS y Mininet
Se despliega un contenedor con la imagen de ONOS.
Se activan las aplicaciones para permitir el forwarding de mininet reactivo.
Se genera una topologia con mininet.
~~~
./onos_docker.sh 
~~~

## TRex
Se construye la imagen de TRex 3.02 sobre un Ubuntu 20.04. (Este paso no es neecesario realizarlo siempre)
~~~
docker build -t trex:20.04 .
~~~

Se monta el contenedor con la imagen generada
~~~
docker run --rm -it --privileged --name trex --cap-add=ALL trex:20.04
~~~


## Configurar enlaces
~~~
sudo ovs-docker add-port s1 veth0 trex --ipaddress=10.0.1.1/24
sudo ovs-docker add-port s1 veth1 trex --ipaddress=10.0.2.1/24
~~~

## Servicio TRex
Para cceder al contenedor 
~~~
docker exec -it trex bash
~~~

Se habilita el servicio del TRex para esto hay que ejecutar el siguiente comando dentro del contenedor TRex
~~~
./t-rex-64 -i --astf
~~~

Para acceder a la consula de TRex, en otro terminal realizar el siguiente comando dentro del contenedor
~~~
./trex-console
~~~