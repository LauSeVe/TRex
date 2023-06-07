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
## Se despliega un Router Arista cEOS

Para descargarse la imagen de Arista cEOS es necesario tener una cuenta en https://www.arista.com.
Ahí hay que aceptar el vEOS / cEOS License Agreement para que te permitan descargarla. 

ContainerLab Arista cEOS:
https://containerlab.dev/manual/kinds/ceos/

Para descargar la imagen: 
https://www.arista.com/en/support/software-download

Las pruebas se han hecho con la imagen cEOS64-lab-4.29.0.2F, ya que a 20/1/2023 es la última versión.
Para importar el archivo con docker:
~~~
docker import cEOS64-lab-4.29.0.2F.tar.tar ceos:4.29.0.2F
~~~

Una vez se tiene la imagen, para desplegar el contenedor:
~~~
docker create --name=ceos --privileged -e INTFTYPE=eth -e ETBA=1 -e SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 -e CEOS=1 -e EOS_PLATFORM=ceoslab -e container=docker -i -t ceos:4.29.0.2F /sbin/init systemd.setenv=INTFTYPE=eth systemd.setenv=ETBA=1 systemd.setenv=SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 systemd.setenv=CEOS=1 systemd.setenv=EOS_PLATFORM=ceoslab systemd.setenv=container=docker
~~~

## Conexión 
Hay que configurar los interfaces dentro del router cEOS, para ello hay que entrar dentro de su interfaz de configuración 
~~~
./conexion.sh
~~~

## Configuración cEOS
Para entrar en el Cli
~~~
docker exec -it ceos Cli
~~~

Dentro del ceos hay que configurar lo siguiente
~~~
en
configure
hostn ceos
ip routing
interface Ethernet1
no switchport
ip addr 10.0.1.2/30
do wr
exit
interface Ethernet2
no switchport
ip addr 10.0.2.2/30
do wr
exit
~~~


## Configuración TRex

