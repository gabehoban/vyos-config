#!/bin/vbash

# BGP configuration
set protocols bgp neighbor 10.32.40.41 address-family ipv4-unicast
set protocols bgp neighbor 10.32.40.41 description 'cluster-node-01'
set protocols bgp neighbor 10.32.40.41 remote-as '64512'
set protocols bgp neighbor 10.32.40.42 address-family ipv4-unicast
set protocols bgp neighbor 10.32.40.42 description 'cluster-node-02'
set protocols bgp neighbor 10.32.40.42 remote-as '64512'
set protocols bgp neighbor 10.32.40.43 address-family ipv4-unicast
set protocols bgp neighbor 10.32.40.43 description 'cluster-node-03'
set protocols bgp neighbor 10.32.40.43 remote-as '64512'
set protocols bgp parameters router-id '10.32.40.254'
set protocols bgp system-as '64512'