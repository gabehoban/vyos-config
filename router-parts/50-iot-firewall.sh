#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### IOT ----------------------------------------------------------------------------

# (10) From IOT to TRUSTED
set firewall name IOT-TRUSTED default-action 'drop'
set firewall name IOT-TRUSTED description 'From IOT to TRUSTED'
set firewall name IOT-TRUSTED enable-default-log


# (20) From IOT to GUEST
set firewall name IOT-GUEST default-action 'drop'
set firewall name IOT-GUEST description 'From IOT to GUEST'
set firewall name IOT-GUEST enable-default-log


# (30) From IOT to SECURITY
set firewall name IOT-SECURITY default-action 'drop'
set firewall name IOT-SECURITY description 'From IOT to SECURITY'
set firewall name IOT-SECURITY enable-default-log


# (40) From IOT to SERVERS
set firewall name IOT-SERVERS default-action 'drop'
set firewall name IOT-SERVERS description 'From IOT to SERVERS'
set firewall name IOT-SERVERS rule 10 description 'Rule: accept_jellyfin_from_jellyfin_clients'
set firewall name IOT-SERVERS rule 10 action 'accept'
set firewall name IOT-SERVERS rule 10 destination port '8096'
set firewall name IOT-SERVERS rule 10 protocol 'tcp'
set firewall name IOT-SERVERS rule 10 source group address-group 'jellyfin_clients'
set firewall name IOT-SERVERS rule 20 description 'Rule: accept_home_assistant'
set firewall name IOT-SERVERS rule 20 action 'accept'
set firewall name IOT-SERVERS rule 20 destination group address-group 'homelab-hass'
set firewall name IOT-SERVERS rule 20 destination port '8123'
set firewall name IOT-SERVERS rule 20 protocol 'tcp'
set firewall name IOT-SERVERS enable-default-log


# (70) From IOT to MGMT
set firewall name IOT-MGMT default-action 'drop'
set firewall name IOT-MGMT description 'From IOT to MGMT'
set firewall name IOT-MGMT enable-default-log


# (95) From IOT to CONTAINERS
set firewall name IOT-CONTAINERS default-action 'drop'
set firewall name IOT-CONTAINERS description 'From IOT to CONTAINERS'
set firewall name IOT-CONTAINERS rule 10 description 'Rule: accept_dns'
set firewall name IOT-CONTAINERS rule 10 action 'accept'
set firewall name IOT-CONTAINERS rule 10 destination port 'domain,domain-s'
set firewall name IOT-CONTAINERS rule 10 protocol 'tcp_udp'
set firewall name IOT-CONTAINERS rule 20 description 'Rule: accept_icmp'
set firewall name IOT-CONTAINERS rule 20 action 'accept'
set firewall name IOT-CONTAINERS rule 20 protocol 'icmp'
set firewall name IOT-CONTAINERS enable-default-log


# (97) From IOT to LOCAL
set firewall name IOT-LOCAL default-action 'drop'
set firewall name IOT-LOCAL description 'From IOT to LOCAL'
set firewall name IOT-LOCAL rule 10 description 'Rule: accept_ntp'
set firewall name IOT-LOCAL rule 10 action 'accept'
set firewall name IOT-LOCAL rule 10 destination port 'ntp'
set firewall name IOT-LOCAL rule 10 protocol 'udp'
set firewall name IOT-LOCAL rule 20 description 'Rule: accept_dhcp'
set firewall name IOT-LOCAL rule 20 action 'accept'
set firewall name IOT-LOCAL rule 20 destination port 'bootps,bootpc'
set firewall name IOT-LOCAL rule 20 protocol 'udp'
set firewall name IOT-LOCAL rule 20 source port 'bootps,bootpc'
set firewall name IOT-LOCAL rule 30 description 'Rule: accept_mdns'
set firewall name IOT-LOCAL rule 30 action 'accept'
set firewall name IOT-LOCAL rule 30 destination port 'mdns'
set firewall name IOT-LOCAL rule 30 protocol 'udp'
set firewall name IOT-LOCAL rule 40 description 'Rule: accept_icmp'
set firewall name IOT-LOCAL rule 40 action 'accept'
set firewall name IOT-LOCAL rule 40 protocol 'icmp'
set firewall name IOT-LOCAL rule 50 description 'Rule: drop port 26343 (no log)'
set firewall name IOT-LOCAL rule 50 action 'drop'
set firewall name IOT-LOCAL rule 50 destination port '26343'
set firewall name IOT-LOCAL rule 50 protocol 'udp'
set firewall name IOT-LOCAL enable-default-log


# (99) From IOT to WAN
set firewall name IOT-WAN default-action 'accept'
set firewall name IOT-WAN description 'From IOT to WAN'
