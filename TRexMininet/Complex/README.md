# TRex con Mininet y ONOS (Complex)
Este escenario está compuesta por una topología mininet de 4 switches y un contenedor con el generador de tráfico TRex. Este contenedor tiene doce interfaces los cuales están conectados 2 a 2 a los switches de la topología Mininet.
El escenario es el siguiente.
<p align="center">
  <img src="../../img/TREX-MininetComplex.png">
</p>

## Desplegar ONOS y Mininet
El siguiente script despliega un contenedor con la imagen de ONOS, activa las aplicaciones necesarias para permitir el forwarding de mininet reactivo y genera una topologia con mininet.
~~~
sudo ./onos_docker.sh 
~~~
Se preguntará por la contraseña del usuario "karaf" para poder acceder a la consola de configuración de onos para activar las aplicaciones. karaf/karaf.

## TRex
Se construye la imagen de TRex 3.02 sobre un Ubuntu 20.04. (Este paso no es necesario realizarlo siempre).
~~~
docker build -t trexcomplex:20.04 .
~~~

Se despliega el contenedor con la imagen generada.
~~~
docker run --privileged --cap-add=ALL -v /mnt/huge:/mnt/huge -v /lib/modules:/lib/modules:ro -v /sys/bus/pci/devices:/sys/bus/pci/devices -v /sys/devices/system/node:/sys/devices/system/node -v /dev:/dev -it --name trexcomplex trexcomplex:20.04
~~~

## Configurar enlaces
El script "conf.sh" contiene todos los comandos necesarios para configurar los enlaces entre el TRex y la toplogía mininet de modo que el TRex está conectando los switches 2 a 2. 

## Servicio TRex
Para acceder al contenedor.
~~~
docker exec -it trexcomplex bash
~~~

Se habilita el servicio del TRex para esto hay que ejecutar el siguiente comando dentro del contenedor TRex.
~~~
./t-rex-64 -i --astf
~~~

Para acceder a la consula de TRex, en otro terminal realizar el siguiente comando dentro del contenedor.
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
docker cp trexbasic:/var/trex/v3.02/capture.pcap .
wireshark capture.pcap
~~~

## Desconfiguración del escenario 
La atopología mininet se puede eliminar escribiendo "exit" dentro de su terminal.
Para eliminar los contenedores:
~~~
docker rm -f onos trexcomplex 
~~~
