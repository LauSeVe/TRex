FROM ubuntu:20.04

COPY trex_cfg.yaml /etc/trex_cfg.yaml

RUN apt-get update
RUN apt-get install -y sudo gcc g++ python python3 python3-distutils zlib1g-dev wget pciutils kmod strace net-tools tcpdump iproute2 iputils-ping nano
WORKDIR /var

RUN mkdir trex
WORKDIR /var/trex
RUN wget --no-cache --no-check-certificate https://trex-tgn.cisco.com/trex/release/v2.97.tar.gz
RUN sudo tar -xzvf v2.97.tar.gz 

WORKDIR /trex/v2.97

CMD ["/bin/bash"]