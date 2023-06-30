#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# Force DNS
set nat destination rule 100 description 'Force DNS for IoT'
set nat destination rule 100 destination address '!10.40.0.6'
set nat destination rule 100 destination port '53'
set nat destination rule 100 inbound-interface 'eth0.50'
set nat destination rule 100 protocol 'tcp_udp'
set nat destination rule 100 translation address '10.40.0.6'
set nat destination rule 100 translation port '53'

# Force NTP
set nat destination rule 101 description 'Force NTP for Trusted'
set nat destination rule 101 destination address '!10.32.10.254'
set nat destination rule 101 destination port '123'
set nat destination rule 101 inbound-interface 'eth0.10'
set nat destination rule 101 protocol 'udp'
set nat destination rule 101 translation address '10.32.10.254'
set nat destination rule 101 translation port '123'

set nat destination rule 103 description 'Force NTP for Security'
set nat destination rule 103 destination address '!10.32.30.254'
set nat destination rule 103 destination port '123'
set nat destination rule 103 inbound-interface 'eth0.30'
set nat destination rule 103 protocol 'udp'
set nat destination rule 103 translation address '10.32.30.254'
set nat destination rule 103 translation port '123'

set nat destination rule 104 description 'Force NTP for Servers'
set nat destination rule 104 destination address '!10.32.40.254'
set nat destination rule 104 destination port '123'
set nat destination rule 104 inbound-interface 'eth0.40'
set nat destination rule 104 protocol 'udp'
set nat destination rule 104 translation address '10.32.40.254'
set nat destination rule 104 translation port '123'

set nat destination rule 105 description 'Force NTP for IOT'
set nat destination rule 105 destination address '!10.32.50.254'
set nat destination rule 105 destination port '123'
set nat destination rule 105 inbound-interface 'eth0.50'
set nat destination rule 105 protocol 'udp'
set nat destination rule 105 translation address '10.32.50.254'
set nat destination rule 105 translation port '123'

set nat destination rule 107 description 'Force NTP for Management'
set nat destination rule 107 destination address '!10.32.70.254'
set nat destination rule 107 destination port '123'
set nat destination rule 107 inbound-interface 'eth0.70'
set nat destination rule 107 protocol 'udp'
set nat destination rule 107 translation address '10.32.70.254'
set nat destination rule 107 translation port '123'

set nat destination rule 110 description 'Force NTP for Wireguard Trusted'
set nat destination rule 110 destination address '!10.20.0.254'
set nat destination rule 110 destination port '123'
set nat destination rule 110 inbound-interface 'wg01'
set nat destination rule 110 protocol 'udp'
set nat destination rule 110 translation address '10.20.0.254'
set nat destination rule 110 translation port '123'

# LAN -> WAN masquerade
set nat source rule 100 description 'LAN -> WAN'
set nat source rule 100 destination address '0.0.0.0/0'
set nat source rule 100 outbound-interface 'eth2'
set nat source rule 100 translation address 'masquerade'
