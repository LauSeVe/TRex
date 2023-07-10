#!/usr/bin/env python
import os 

IP1 = os.getenv("IPveth1")
IP2 = os.getenv("IPveth2")
archivo = "/etc/trex_cfg.yaml"
contenido = f'- port_limit    : 2 \n  version       : 2 \n  low_end       : true \n  interfaces    : ["veth1", "veth2"]   \n  port_info     :  \n                 - ip         : {IP1} \n                   default_gw : {IP2} \n                 - ip         : {IP2} \n                   default_gw : {IP1}'

with open(archivo, "w") as file:
    file.write(contenido)

