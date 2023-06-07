#!/usr/bin/env python

##########################################################################
# DEVELOPED BY: MARIA BELEN JIMENEZ AMOROSO
# DATE: 23/03/2023
# EMAIL: mb.jimenez@alumnos.upm.es 
##########################################################################

# Controlador externo: sudo mn --custom Topology3.py --topo mitopologia --controller=remote,ip=IPCONTROLADOR,port=PUERTOAUSAR


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
        host=CPULimitedHost,#new
        link=TCLink,#new
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

        info('*** Add hosts\n')
        
        h1 = self.addHost('h1', cls=Host, ip='10.0.0.1', defaultRoute=None)
        h2 = self.addHost('h2', cls=Host, ip='10.0.0.2', defaultRoute=None)
        h3 = self.addHost('h3', cls=Host, ip='10.0.0.3', defaultRoute=None)
        h4 = self.addHost('h4', cls=Host, ip='10.0.0.4', defaultRoute=None)
        h5 = self.addHost('h5', cls=Host, ip='10.0.0.5', defaultRoute=None)
        h6 = self.addHost('h6', cls=Host, ip='10.0.0.6', defaultRoute=None)
        h7 = self.addHost('h7', cls=Host, ip='10.0.0.7', defaultRoute=None)
        h8 = self.addHost('h8', cls=Host, ip='10.0.0.8', defaultRoute=None)
        h9 = self.addHost('h9', cls=Host, ip='10.0.0.9', defaultRoute=None)
        h10 = self.addHost('h10', cls=Host, ip='10.0.0.10', defaultRoute=None)
        
        info('*** Add links\n')
        self.addLink(h1, s1, cls=TCLink, bw=5)
        self.addLink(h2, s1, cls=TCLink, bw=5)
        self.addLink(h3, s2, cls=TCLink, bw=5)
        self.addLink(h4, s2, cls=TCLink, bw=5)
        self.addLink(h5, s2, cls=TCLink, bw=5)
        self.addLink(h6, s3, cls=TCLink, bw=5)
        self.addLink(h7, s3, cls=TCLink, bw=5)
        self.addLink(h8, s4, cls=TCLink, bw=5)
        self.addLink(h9, s4, cls=TCLink, bw=5)
        self.addLink(h10, s4, cls=TCLink, bw=5)
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
    
    
    
