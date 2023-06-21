# TRex con Arista Ceos

## TRex
Se construye la imagen de TRex 3.02 sobre un Ubuntu 20.04. (Este paso no es necesario realizarlo siempre)
~~~
docker build -t trexovs:20.04 .
~~~

Se monta el contenedor con la imagen generada
~~~
docker run --rm -it --privileged --name trexovs --cap-add=ALL trexovs:20.04
~~~

## Se despliega un OVS
~~~
sudo ovs-vsctl add-br switch
~~~

## Conexión 
~~~
sudo ovs-docker add-port switch veth0 trexovs --ipaddress=1.1.1.1/24
sudo ovs-docker add-port switch veth1 trexovs --ipaddress=2.2.2.2/24
~~~
