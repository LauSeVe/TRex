#!/usr/bin/env python

from mininet.topo import Topo
from mininet.net import Mininet
from mininet.node import Controller, RemoteController, OVSController
from mininet.node import CPULimitedHost, Host, Node
from mininet.node import OVSKernelSwitch, UserSwitch
from mininet.node import IVSSwitch
from mininet.cli import CLI
from mininet.log import setLogLevel, info
from mininet.link import TCLink, Intf
from subprocess import call

def myNetwork():
    topologia = MiTopologia()
    net = Mininet(
        topo=topologia,
        controller=RemoteController,
        build=False,
        host=CPULimitedHost,
        link=TCLink,
        ipBase='10.0.0.0/24')
    net.addController("c0", controller=RemoteController,
                      ip='IP CONTROLLER',
                      protocol='tcp',
                      port=DEFINIRPUERTO)
    net.start()
    dumpNodeConnections(net.hosts)
   
class MiTopologia(Topo):
    def __init__(self, **opts):
        Topo.__init__(self, **opts)
        info('*** Add switches\n')
        s4 = self.addSwitch('s4', cls=OVSKernelSwitch, protocols='OpenFlow13')
        s3 = self.addSwitch('s3', cls=OVSKernelSwitch, protocols='OpenFlow13')
        s2 = self.addSwitch('s2', cls=OVSKernelSwitch, protocols='OpenFlow13')
        s1 = self.addSwitch('s1', cls=OVSKernelSwitch, protocols='OpenFlow13')

        info('*** Add links\n')
        self.addLink(s1, s2, cls=TCLink, bw=5, max_queue_size=500)
        self.addLink(s1, s3, cls=TCLink, bw=5, max_queue_size=500)
        self.addLink(s1, s4, cls=TCLink, bw=5, max_queue_size=500)
        self.addLink(s3, s2, cls=TCLink, bw=5, max_queue_size=500)
        self.addLink(s3, s4, cls=TCLink, bw=5, max_queue_size=500)
        self.addLink(s2, s4, cls=TCLink, bw=5, max_queue_size=500)

def test_untagged(self):
        self.net.pingAll()

    
topos = {'mitopologia': (lambda: MiTopologia())}

if __name__ == '__main__':
    setLogLevel('info')
    myNetwork()
    
    
    
