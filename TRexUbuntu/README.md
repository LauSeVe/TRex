# TRex con Arista Ceos

## TRex

Se construye la imagen de TRex 3.02 sobre un Ubuntu 20.04. (Este paso no es neecesario realizarlo siempre)
~~~
docker build -t trexceos:20.04 .
~~~

Se monta el contenedor con la imagen generada
~~~
docker run --rm -it --privileged --name trexceos --cap-add=ALL trexceos:20.04
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
~~~
Así ya se podrá hacer ifconfig para comprobar los insterfaces creados. 


