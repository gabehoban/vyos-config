#!/bin/vbash

# BGP configuration
set protocols bgp neighbor 10.32.40.25 address-family ipv4-unicast
set protocols bgp neighbor 10.32.40.25 description 'granite'
set protocols bgp neighbor 10.32.40.25 remote-as '64512'
set protocols bgp neighbor 10.32.40.26 address-family ipv4-unicast
set protocols bgp neighbor 10.32.40.26 description 'genesis'
set protocols bgp neighbor 10.32.40.26 remote-as '64512'
set protocols bgp neighbor 10.32.40.27 address-family ipv4-unicast
set protocols bgp neighbor 10.32.40.27 description 'galileo'
set protocols bgp neighbor 10.32.40.27 remote-as '64512'
set protocols bgp parameters router-id '10.32.40.254'
set protocols bgp system-as '64512'