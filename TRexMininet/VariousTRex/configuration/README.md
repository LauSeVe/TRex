# Ficheros de configuración
En estas carpetas se encuentran los ficheros de configuración de cada uno de los contenedores. 
Hay dos archivos en cada carpeta:
- Dockerfile: En este fichero se encuentra la configuración de la imagen con la que se desplegará el contenedor. 
- trex_cfg.yaml: Este fichero es necesario para el correcto funcionamiento del generador de tráfico. En el se definen los interfaces empleados, así como las direcciones IPs y las pasarela correspondientes. 

El docker-compose llama a cada uno de los Dockerfiles para crear las imagenes en las que se ha incluido sus respectivos trex_cfg.yaml. 