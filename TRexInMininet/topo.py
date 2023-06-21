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
        topo=None,
        controller=RemoteController,
        build=False,
        host=CPULimitedHost,#new
        link=TCLink,#new
        ipBase='10.0.0.0/8')
    net.addController("c0", controller=RemoteController,
                      ip='IP CONTROLLER',
                      protocol='tcp',
                      port=DEFINIRPUERTO)
    net.start()
    dumpNodeConnections(net.hosts)

class MiTopologia(Topo):
    def __init__(self, **opts):
        Topo.__init__(self, **opts)

        info( '*** Add switches\n')
        s1 = self.addSwitch('s1', cls=OVSKernelSwitch, protocols='OpenFlow13')

        info( '*** Add hosts\n')
        trex = self.addHost('trex', cls=Host, ip='10.0.0.1', defaultRoute=None)

        info( '*** Add links\n')
        self.addLink(trex, s1, cls=TCLink, bw=5, params1={'ip':'10.0.0.1/8'})
        self.addLink(trex, s1, cls=TCLink, bw=5, params1={'ip':'10.0.0.2/8'})


def test_untagged(self):
        self.net.pingAll()

    
topos = {'mitopologia': (lambda: MiTopologia())}

if __name__ == '__main__':
    setLogLevel('info')
    myNetwork()
    

