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
docker create --name=ceos -i -t ceos:4.29.0.2F /sbin/init 
~~~

## Conexión 
Hay que configurar los interfaces dentro del router cEOS, para ello hay que entrar dentro de su interfaz de configuración 
~~~
./conexion.sh
~~~
