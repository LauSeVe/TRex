FROM ubuntu:20.04

COPY trex_cfg.yaml /etc/trex_cfg.yaml

RUN apt-get update
RUN apt-get install -y sudo gcc g++ python tcpdump zlib1g-dev wget pciutils kmod strace net-tools python3 python3-distutils iproute2 iputils-ping nano dnsutils

WORKDIR /var

RUN mkdir trex
WORKDIR /var/trex
RUN wget --no-cache --no-check-certificate https://trex-tgn.cisco.com/trex/release/v2.97.tar.gz
RUN sudo tar -xzvf v2.97.tar.gz 

RUN echo 'PS1="\u@$(dig -x `ifconfig eth0 | grep '\''inet'\'' | awk '\''{print $2}'\''` +short | cut -d'\''.'\'' -f1):~\w\$ "' >> /root/.bashrc

WORKDIR /var/trex/v2.97

CMD tail -f /dev/null
