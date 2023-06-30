#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### GUEST ------------------------------------------------------------------------------

# (10) From GUEST to TRUSTED
set firewall name GUEST-TRUSTED default-action 'drop'
set firewall name GUEST-TRUSTED description 'From GUEST to TRUSTED'
set firewall name GUEST-TRUSTED enable-default-log


# (30) From GUEST to SECURITY
set firewall name GUEST-SECURITY default-action 'drop'
set firewall name GUEST-SECURITY description 'From GUEST to SECURITY'
set firewall name GUEST-SECURITY enable-default-log


# (40) From GUEST to SERVERS
set firewall name GUEST-SERVERS default-action 'drop'
set firewall name GUEST-SERVERS description 'From GUEST to SERVERS'
set firewall name GUEST-SERVERS enable-default-log


# (50) From GUEST to IOT
set firewall name GUEST-IOT default-action 'drop'
set firewall name GUEST-IOT description 'From GUEST to IOT'
set firewall name GUEST-IOT enable-default-log


# (70) From GUEST to MGMT
set firewall name GUEST-MGMT default-action 'drop'
set firewall name GUEST-MGMT description 'From GUEST to MGMT'
set firewall name GUEST-MGMT enable-default-log


# (95) From GUEST to CONTAINERS
set firewall name GUEST-CONTAINERS default-action 'drop'
set firewall name GUEST-CONTAINERS description 'From GUEST to CONTAINERS'
set firewall name GUEST-CONTAINERS rule 10 description 'Rule: accept_dns'
set firewall name GUEST-CONTAINERS rule 10 action 'accept'
set firewall name GUEST-CONTAINERS rule 10 destination port 'domain,domain-s'
set firewall name GUEST-CONTAINERS rule 10 protocol 'tcp_udp'
set firewall name GUEST-CONTAINERS enable-default-log


# (97) From GUEST to LOCAL
set firewall name GUEST-LOCAL default-action 'drop'
set firewall name GUEST-LOCAL description 'From GUEST to LOCAL'
set firewall name GUEST-LOCAL rule 10 description 'Rule: accept_dhcp'
set firewall name GUEST-LOCAL rule 10 action 'accept'
set firewall name GUEST-LOCAL rule 10 destination port 'bootps,bootpc'
set firewall name GUEST-LOCAL rule 10 protocol 'udp'
set firewall name GUEST-LOCAL rule 10 source port 'bootps,bootpc'
set firewall name GUEST-LOCAL enable-default-log


# (99) From GUEST to WAN
set firewall name GUEST-WAN default-action 'accept'
set firewall name GUEST-WAN description 'From GUEST to WAN'