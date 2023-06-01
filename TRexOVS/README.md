# TRex con Arista Ceos

## TRex
Se construye la imagen de TRex 3.02 sobre un Ubuntu 20.04. (Este paso no es necesario realizarlo siempre)
~~~
docker build -t trexOVS:20.04 .
~~~

Se monta el contenedor con la imagen generada
~~~
docker run --rm -it --privileged --name trex --cap-add=ALL trexovs:20.04
~~~

## Se despliega un OVS
~~~
sudo ovs-vsctl add-br switch
~~~

## Conexión 
~~~
sudo ovs-docker add-port switch veth0 trexovs --ipaddress=10.0.0.1/24
sudo ovs-docker add-port switch veth1 trexovs --ipaddress=10.0.0.2/24
~~~
