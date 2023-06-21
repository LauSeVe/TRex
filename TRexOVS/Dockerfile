FROM ubuntu:20.04

COPY trex_cfg.yaml /etc/trex_cfg.yaml

RUN apt-get update
RUN apt-get install -y sudo gcc g++ python zlib1g-dev wget tcpdump pciutils kmod strace net-tools python3 python3-distutils iproute2 iputils-ping nano

WORKDIR /var

RUN mkdir trex
WORKDIR /var/trex
RUN wget --no-cache --no-check-certificate https://trex-tgn.cisco.com/trex/release/v3.02.tar.gz
RUN sudo tar -xzvf v3.02.tar.gz 

WORKDIR /var/trex/v3.02

CMD ["/bin/bash"]