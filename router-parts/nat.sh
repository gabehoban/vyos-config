#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# Force DNS
set nat destination rule 90 description 'Force DNS for IoT'
set nat destination rule 90 destination address '!10.40.0.6'
set nat destination rule 90 destination port '53'
set nat destination rule 90 inbound-interface name 'eth0.30'
set nat destination rule 90 protocol 'tcp_udp'
set nat destination rule 90 translation address '10.40.0.6'
set nat destination rule 90 translation port '53'

# Force NTP
set nat destination rule 100 description 'Force NTP for lan'
set nat destination rule 100 destination address '!10.32.40.52'
set nat destination rule 100 destination port '123'
set nat destination rule 100 inbound-interface name 'eth0'
set nat destination rule 100 protocol 'udp'
set nat destination rule 100 translation address '10.32.40.52'
set nat destination rule 100 translation port '123'

set nat destination rule 101 description 'Force NTP for Trusted'
set nat destination rule 101 destination address '!10.32.40.52'
set nat destination rule 101 destination port '123'
set nat destination rule 101 inbound-interface name 'eth0.10'
set nat destination rule 101 protocol 'udp'
set nat destination rule 101 translation address '10.32.40.52'
set nat destination rule 101 translation port '123'

set nat destination rule 103 description 'Force NTP for iot'
set nat destination rule 103 destination address '!10.32.40.52'
set nat destination rule 103 destination port '123'
set nat destination rule 103 inbound-interface name 'eth0.30'
set nat destination rule 103 protocol 'udp'
set nat destination rule 103 translation address '10.32.40.52'
set nat destination rule 103 translation port '123'

set nat destination rule 110 description 'Force NTP for Wireguard Trusted'
set nat destination rule 110 destination address '!10.32.40.52'
set nat destination rule 110 destination port '123'
set nat destination rule 110 inbound-interface name 'wg01'
set nat destination rule 110 protocol 'udp'
set nat destination rule 110 translation address '10.32.40.52'
set nat destination rule 110 translation port '123'

# LAN -> wan masquerade
set nat source rule 900 description 'LAN -> wan'
set nat source rule 900 destination address '0.0.0.0/0'
set nat source rule 900 outbound-interface name 'eth2'
set nat source rule 900 translation address 'masquerade'
