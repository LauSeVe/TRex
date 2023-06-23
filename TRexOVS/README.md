# TRex con OVS

## TRex
Se construye la imagen de TRex 3.02 sobre un Ubuntu 20.04. (Este paso no es necesario realizarlo siempre)
~~~
docker build -t trexovs:20.04 .
~~~

Se monta el contenedor con la imagen generada
~~~
docker run --privileged --cap-add=ALL -v /mnt/huge:/mnt/huge -v /lib/modules:/lib/modules:ro -v /sys/bus/pci/devices:/sys/bus/pci/devices -v /sys/devices/system/node:/sys/devices/system/node -v /dev:/dev -it --name trexovs trexovs:20.04
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


## Prueba 
Para acceder al contenedor 
~~~
docker exec -it trexovs bash
~~~

Se habilita el servicio del TRex para esto hay que ejecutar el siguiente comando dentro del contenedor TRex
~~~
./t-rex-64 -i --astf
~~~
Para esto tiene que estar actualizado python3.

Para acceder a la consola de TRex, en otro terminal realizar el siguiente comando dentro del contenedor
~~~
./trex-console
~~~
Dentro de la consola se puede lanzar trafico http basico
~~~
start -f astf/http_simple.py 
~~~
La consola tambien tiene incluido un interfaz que enseña estadisticas
~~~
tui
~~~
Para parar el trafico hay que ejecutar el comando
~~~
stop
~~~

Si se quiere comprobar el correcto funcionamiento se puede realizar un tcpdump en cualquiera de los interfaces del TRex
~~~
tcpdump -i veth0
~~~
