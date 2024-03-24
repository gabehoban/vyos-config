#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# Force DNS
set nat destination rule 80 description 'Force DNS for IoT'
set nat destination rule 80 destination address '!10.40.0.6'
set nat destination rule 80 destination port '53'
set nat destination rule 80 inbound-interface name 'eth0.30'
set nat destination rule 80 protocol 'tcp_udp'
set nat destination rule 80 translation address '10.40.0.6'
set nat destination rule 80 translation port '53'

set nat destination rule 90 description 'Force DNS for Video'
set nat destination rule 90 destination address '!10.40.0.6'
set nat destination rule 90 destination port '53'
set nat destination rule 90 inbound-interface name 'eth0.50'
set nat destination rule 90 protocol 'tcp_udp'
set nat destination rule 90 translation address '10.40.0.6'
set nat destination rule 90 translation port '53'

# LAN -> wan masquerade
set nat source rule 900 description 'LAN -> wan'
set nat source rule 900 destination address '0.0.0.0/0'
set nat source rule 900 outbound-interface name 'eth2'
set nat source rule 900 translation address 'masquerade'
