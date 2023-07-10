# TRex con Mininet y ONOS (Various TRex)
Este escenario está compuesta por una topología mininet de 4 switches y seis contenedores con el generador de tráfico TRex. Estos contenedores tiene dos interfaces los cuales están conectados a los switches de la topología. 
El escenario es el siguiente.
<p align="center">
  <img src="../../img/TREX-VariousTRex.png" >
</p>

## Desplegar ONOS y Mininet
El siguiente script despliega un contenedor con la imagen de ONOS, activa las aplicaciones necesarias para permitir el forwarding de mininet reactivo y genera una topologia con mininet.
~~~
sudo ./onos_docker.sh 
~~~
Se preguntará por la contraseña del usuario "karaf" para poder acceder a la consola de configuración de onos para activar las aplicaciones. karaf/karaf.

## TRex
Se construyen los seis contenedores con TRex con ayuda de docker-compose.
~~~
docker-compose up --build 
~~~
La imagen que construye los contenedores es igual que la empleada en el escenario "Basic" pero con un cambio en el CMD el cual es necesario para que se deplieguen todos los contenedores. Y tambien incluye un comando para modificar el prompt del contenedor para que aparezca su nombre en vez de su identificador. 

El siguiente script despliegan los contenedores TRex con la imagen generada y configura los enlaces necesarios. (DOCKER COMPOSE) 
~~~
sudo ./conf.sh
~~~

## Servicio TRex
Para acceder al contenedor trex1 el comando necesario sería el siguiente.
~~~
docker exec -it trex1 bash
~~~

Para que funcione correctamente el generador de tráfico TRex tiene que tener un fichero de configuración /etc/trex_cfg.yaml en el que se definen las direcciones IPs de cada interfaz y del gateway. Para generar este fichero, en cada uno de los contenedores hay que ejecutar el siguiente comando.
~~~
python3 cfgcreator.py
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
docker cp trex1:/var/trex/v3.02/capture.pcap .
wireshark capture.pcap
~~~

## Desconfiguración del escenario 
La atopología mininet se puede eliminar escribiendo "exit" dentro de su terminal.
Para eliminar el contenedor con ONOS:
~~~
docker rm -f onos 
~~~
Para eliminar los contenedores con TRex se puede emplear también docker compose.
~~~
docker-compose down 
~~~
