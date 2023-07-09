# TRex como host de Mininet y ONOS (InHost)
El escenario es el siguiente.
<p align="center">
  <img src="../../img/TREX-MininetInHost.png">
</p>

## Desplegar ONOS y Mininet
Se despliega un contenedor con la imagen de ONOS.
Se activan las aplicaciones para permitir el forwarding de mininet reactivo.
Se genera una topologia con mininet, la cual incluye un host llamado "trex" y un OVS llamado "s1".

~~~
sudo ./conf.sh 
~~~

Se preguntará por la contraseña del usuario "karaf" para poder acceder a la consola de configuración de onos para activar las aplicaciones. karaf/karaf

## TRex
Se va a desplegar el servicio de TRex dentro del host llamado "trex" de la topologia mininet generada con el fichero "topo.py"

Para abrir la consola:
~~~
xterm trex
~~~
El siguiente comando habilita el servicio mininet y empieza a lanzar el trafico definido en el fichero llamado "dns.yaml" disponible en la carpeta cap2.
~~~
cd v3.02
./t-rex-64 -f cap2/dns.yaml 
~~~

Si se quiere probar el modo Advance Stateful
~~~
./t-rex-64 --astf -f astf/http_simple.py
~~~

Si se quiere comprobar el funcionamiento se puede abrir otra consola con el switch s1 y cpomprobar si interfaz
~~~
tcpdump -i s1-eth1
~~~
Aquí se verá el trafico ONOS.Dicovery y el trafico generado por el TRex.

## Desconfigurar el escenario
~~~
sudo ./deconf.sh
~~~


## Referencias 
https://www.cnblogs.com/cscshi/p/16583997.html
(Accessed: 21/7)
