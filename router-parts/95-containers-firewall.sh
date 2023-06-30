#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### CONTAINERS ----------------------------------------------------------------------------

# (10) From CONTAINERS to TRUSTED
set firewall name CONTAINERS-TRUSTED default-action 'drop'
set firewall name CONTAINERS-TRUSTED description 'From CONTAINERS to TRUSTED'
set firewall name CONTAINERS-TRUSTED enable-default-log


# (20) From CONTAINERS to GUEST
set firewall name CONTAINERS-GUEST default-action 'drop'
set firewall name CONTAINERS-GUEST description 'From CONTAINERS to GUEST'
set firewall name CONTAINERS-GUEST enable-default-log


# (30) From CONTAINERS to SECURITY
set firewall name CONTAINERS-SECURITY default-action 'drop'
set firewall name CONTAINERS-SECURITY description 'From CONTAINERS to SECURITY'
set firewall name CONTAINERS-SECURITY enable-default-log


# (40) From CONTAINERS to SERVERS
set firewall name CONTAINERS-SERVERS default-action 'drop'
set firewall name CONTAINERS-SERVERS description 'From CONTAINERS to SERVERS'
set firewall name CONTAINERS-SERVERS enable-default-log


# (50) From CONTAINERS to IOT
set firewall name CONTAINERS-IOT default-action 'drop'
set firewall name CONTAINERS-IOT description 'From CONTAINERS to IOT'
set firewall name CONTAINERS-IOT enable-default-log


# (70) From CONTAINERS to MGMT
set firewall name CONTAINERS-MGMT default-action 'drop'
set firewall name CONTAINERS-MGMT description 'From CONTAINERS to MGMT'
set firewall name CONTAINERS-MGMT enable-default-log


# (97) From CONTAINERS to LOCAL
set firewall name CONTAINERS-LOCAL default-action 'drop'
set firewall name CONTAINERS-LOCAL description 'From CONTAINERS to LOCAL'
set firewall name CONTAINERS-LOCAL rule 10 action 'accept'
set firewall name CONTAINERS-LOCAL rule 10 description 'Rule: accept_ntp'
set firewall name CONTAINERS-LOCAL rule 10 destination port 'ntp'
set firewall name CONTAINERS-LOCAL rule 10 protocol 'udp'
set firewall name CONTAINERS-LOCAL rule 20 action 'accept'
set firewall name CONTAINERS-LOCAL rule 20 description 'Rule: accept_dhcp'
set firewall name CONTAINERS-LOCAL rule 20 destination port 'bootps,bootpc'
set firewall name CONTAINERS-LOCAL rule 20 protocol 'udp'
set firewall name CONTAINERS-LOCAL rule 20 source port 'bootps,bootpc'
set firewall name CONTAINERS-LOCAL rule 30 description 'Rule: accept_dns'
set firewall name CONTAINERS-LOCAL rule 30 action 'accept'
set firewall name CONTAINERS-LOCAL rule 30 destination port 'domain,domain-s'
set firewall name CONTAINERS-LOCAL rule 30 protocol 'tcp_udp'
set firewall name CONTAINERS-LOCAL enable-default-log


# (99) From CONTAINERS to WAN
set firewall name CONTAINERS-WAN default-action 'accept'
set firewall name CONTAINERS-WAN description 'From CONTAINERS to WAN'
