#!/bin/vbash

# BGP configuration
set protocols bgp neighbor 10.32.40.31 address-family ipv4-unicast
set protocols bgp neighbor 10.32.40.31 description 'tars'
set protocols bgp neighbor 10.32.40.31 remote-as '64520'
set protocols bgp neighbor 10.32.40.32 address-family ipv4-unicast
set protocols bgp neighbor 10.32.40.32 description 'case'
set protocols bgp neighbor 10.32.40.32 remote-as '64520'
set protocols bgp neighbor 10.32.40.33 address-family ipv4-unicast
set protocols bgp neighbor 10.32.40.33 description 'plex'
set protocols bgp neighbor 10.32.40.33 remote-as '64520'
set protocols bgp neighbor 10.32.40.34 address-family ipv4-unicast
set protocols bgp neighbor 10.32.40.34 description 'kipp'
set protocols bgp neighbor 10.32.40.34 remote-as '64520'
set protocols bgp neighbor 10.32.40.35 address-family ipv4-unicast
set protocols bgp neighbor 10.32.40.35 description 'cade'
set protocols bgp neighbor 10.32.40.35 remote-as '64520'
set protocols bgp parameters router-id '10.32.0.254'
set protocols bgp system-as '64521'