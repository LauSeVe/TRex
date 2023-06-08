FROM ubuntu:20.04

COPY trex_cfg.yaml /etc/trex_cfg.yaml

RUN apt-get update
RUN apt-get install -y sudo gcc g++ python zlib1g-dev wget pciutils kmod strace net-tools python3 tcpdump python3-distutils iproute2 iputils-ping nano
RUN mkdir /trex

WORKDIR /trex
RUN wget --no-cache --no-check-certificate https://trex-tgn.cisco.com/trex/release/v3.02.tar.gz
RUN sudo tar -xzvf v3.02.tar.gz 

WORKDIR /trex/v3.02

CMD ["/bin/bash"]