# TRex con Ubuntu 20.04
Este escenario se ha desplegado para probar la generación de paquetes con TRex con 3 subredes distintas para investigar el funcionamiento de ARP con el generador de trafico TRex de CISCO. 

## TRex

Se construye la imagen de TRex 3.02 sobre un Ubuntu 20.04. (Este paso no es neecesario realizarlo siempre)
~~~
docker build -t trexubuntu:20.04 .
~~~

Se monta el contenedor con la imagen generada
~~~
docker run --rm -it --privileged --name trexubuntu --cap-add=ALL trexubuntu:20.04
~~~
## Ubuntu 20.04

Para desplegar un contenedor con una imagen de ubuntu 20.04.
~~~
docker run -it --name ubuntu ubuntu:20.04
~~~

## Configuración con Ubuntu

Conexiones entre ubuntu y TRex
~~~
./conexion.sh
~~~

Si se quieren utilizar herramientas basicas hay que instalarlas:
~~~
apt update
apt install net-tools
apt install iputils-ping
~~~
Así ya se podrá hacer ifconfig y ping para comprobar los insterfaces creados.  


## Conectar un switch a Ubuntu
Ahora mismo solo se está conectado el contener TRex y el contenedor con la imagen de Ubuntu 20.04, con el siguiente comando se conecta un OVS al contenedor con ubuntu.
~~~
./conexion2.sh
~~~
