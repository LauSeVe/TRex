# TRex con OVS
El escenario que se va a desplegar es el siguiente.
<p align="center">
  <img src="../img/TREX-OVS.png">
</p>

## TRex
Se construye la imagen de TRex 2.97 sobre un Ubuntu 20.04. (Este paso no es necesario realizarlo siempre)
~~~
docker build -t trexovs:20.04 .
~~~

Se monta el contenedor con la imagen generada anteriormente. 
~~~
docker run --privileged --cap-add=ALL -v /mnt/huge:/mnt/huge -v /lib/modules:/lib/modules:ro -v /sys/bus/pci/devices:/sys/bus/pci/devices -v /sys/devices/system/node:/sys/devices/system/node -v /dev:/dev -it --name trexovs trexovs:20.04
~~~
Es importante ejecutar el comando anterior con todos los parametros, ya que los modulos del kernel configurados son necesarios para el correcto funcionamiento del generador de tráfico. 

## OVS
Con el siguiente comando se genera el OVS.
~~~
sudo ovs-vsctl add-br switch
~~~

## Conexión
Los siguientes comandos anaden un interfaz del OVS dentro del contenedor y le añaden una dirección IP.  
~~~
sudo ovs-docker add-port switch veth0 trexovs --ipaddress=10.0.0.1/24
sudo ovs-docker add-port switch veth1 trexovs --ipaddress=10.0.0.2/24
~~~

## Prueba 
Para acceder al contenedor.
~~~
docker exec -it trexovs bash
~~~

Para habilitar el servicio del TRex en modo interactivo, hay que ejecutar el siguiente comando dentro del contenedor TRex.
~~~
./t-rex-64 -i --astf
~~~
Para acceder a la consola de TRex, en otro terminal realizar el siguiente comando dentro del contenedor.
~~~
./trex-console
~~~
Dentro de la consola se puede lanzar trafico http basico.
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

Si se quiere habilitar el servicio y mandar el tráfico en una sola linea de comandos se puede realizar el siguiente comando.
~~~
./t-rex-64 --astf -f astf/http_simple.py
~~~
Este no emplea el modo interactivo del TRex.
## Comprobación
Si se quiere comprobar el correcto funcionamiento se puede realizar un tcpdump en cualquiera de los interfaces del TRex.
~~~
sudo tcpdump -i veth0 -w capture.pcap &
~~~
Este comando tambien guarda dicha captura de tráfico en un fichero.

El siguiente comando permite observar el tráfico.
~~~
tcpdump -r capture.pcap
~~~

Si se quiere observar el tráfico con Wireshark se puede mandar copiar el fichero en local y desde ahí abrirlo con Wireshark.
~~~
docker cp trexovs:/var/trex/v2.97/capture.pcap .
wireshark capture.pcap
~~~

## Desconfiguración del escenario 
El script llamado "deconf.sh" se encarga borrar el contenedor que contiene el generador de tráfico TRex empleado, así como el bridge OVS generado y sus puertos. 
