#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### SECURITY ----------------------------------------------------------------------------

# (10) From SECURITY to TRUSTED
set firewall name SECURITY-TRUSTED default-action 'drop'
set firewall name SECURITY-TRUSTED description 'From SECURITY to TRUSTED'
set firewall name SECURITY-TRUSTED enable-default-log


# (20) From SECURITY to GUEST
set firewall name SECURITY-GUEST default-action 'drop'
set firewall name SECURITY-GUEST description 'From SECURITY to GUEST'
set firewall name SECURITY-GUEST enable-default-log


# (40) From SECURITY to SERVERS
set firewall name SECURITY-SERVERS default-action 'drop'
set firewall name SECURITY-SERVERS description 'From SECURITY to SERVERS'
set firewall name SECURITY-SERVERS enable-default-log


# (50) From SECURITY to IOT
set firewall name SECURITY-IOT default-action 'drop'
set firewall name SECURITY-IOT description 'From SECURITY to IOT'
set firewall name SECURITY-IOT enable-default-log


# (70) From SECURITY to MGMT
set firewall name SECURITY-MGMT default-action 'drop'
set firewall name SECURITY-MGMT description 'From SECURITY to MGMT'
set firewall name SECURITY-MGMT enable-default-log


# (95) From SECURITY to CONTAINERS
set firewall name SECURITY-CONTAINERS default-action 'drop'
set firewall name SECURITY-CONTAINERS description 'From SECURITY to CONTAINERS'
set firewall name SECURITY-CONTAINERS rule 10 description 'Rule: accept_dns'
set firewall name SECURITY-CONTAINERS rule 10 action 'accept'
set firewall name SECURITY-CONTAINERS rule 10 destination port 'domain,domain-s'
set firewall name SECURITY-CONTAINERS rule 10 protocol 'tcp_udp'
set firewall name SECURITY-CONTAINERS enable-default-log


# (97) From SECURITY to LOCAL
set firewall name SECURITY-LOCAL default-action 'drop'
set firewall name SECURITY-LOCAL description 'From SECURITY to LOCAL'
set firewall name SECURITY-LOCAL rule 10 description 'Rule: accept_ntp'
set firewall name SECURITY-LOCAL rule 10 action 'accept'
set firewall name SECURITY-LOCAL rule 10 destination port 'ntp'
set firewall name SECURITY-LOCAL rule 10 protocol 'udp'
set firewall name SECURITY-LOCAL rule 20 description 'Rule: accept_dhcp'
set firewall name SECURITY-LOCAL rule 20 action 'accept'
set firewall name SECURITY-LOCAL rule 20 destination port 'bootps,bootpc'
set firewall name SECURITY-LOCAL rule 20 protocol 'udp'
set firewall name SECURITY-LOCAL rule 20 source port 'bootps,bootpc'
set firewall name SECURITY-LOCAL enable-default-log


# (99) From SECURITY to WAN
set firewall name SECURITY-WAN default-action 'accept'
set firewall name SECURITY-WAN description 'From SECURITY to WAN'