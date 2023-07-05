#!/bin/bash

# veth1 (10.0.0.1) -- s1 -- s2 veth2 (10.0.0.2)
ovs-docker add-port s1 veth1 trexcomplex --ipaddress=10.0.0.1/24
ovs-docker add-port s2 veth2 trexcomplex --ipaddress=10.0.0.2/24

# veth3 (10.0.0.3) -- s2 -- s3 veth4 (10.0.0.4)
ovs-docker add-port s2 veth3 trexcomplex --ipaddress=10.0.0.3/24
ovs-docker add-port s3 veth4 trexcomplex --ipaddress=10.0.0.4/24

# veth5 (10.0.0.5) -- s3 -- s4 veth6 (10.0.0.6)
ovs-docker add-port s3 veth5 trexcomplex --ipaddress=10.0.0.5/24
ovs-docker add-port s4 veth6 trexcomplex --ipaddress=10.0.0.6/24

# veth7 (10.0.0.7) -- s4 -- s1 -- veth8 (10.0.0.8)
ovs-docker add-port s4 veth7 trexcomplex --ipaddress=10.0.0.7/24
ovs-docker add-port s1 veth8 trexcomplex --ipaddress=10.0.0.8/24

# veth9 (10.0.0.9) -- s1 -- s3 -- veth10 (10.0.0.10)
ovs-docker add-port s1 veth9 trexcomplex --ipaddress=10.0.0.9/24
ovs-docker add-port s3 veth10 trexcomplex --ipaddress=10.0.0.10/24

# veth11 (10.0.0.11) -- s2 -- s4 -- veth12 (10.0.0.12)
ovs-docker add-port s2 veth11 trexcomplex --ipaddress=10.0.0.11/24
ovs-docker add-port s4 veth12 trexcomplex --ipaddress=10.0.0.12/24