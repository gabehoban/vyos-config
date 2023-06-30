#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### MGMT ----------------------------------------------------------------------------

# (10) From MGMT to TRUSTED
set firewall name MGMT-TRUSTED default-action 'drop'
set firewall name MGMT-TRUSTED description 'From MGMT to TRUSTED'
set firewall name MGMT-TRUSTED enable-default-log


# (20) From MGMT to GUEST
set firewall name MGMT-GUEST default-action 'drop'
set firewall name MGMT-GUEST description 'From MGMT to GUEST'
set firewall name MGMT-GUEST enable-default-log


# (30) From MGMT to SECURITY
set firewall name MGMT-SECURITY default-action 'drop'
set firewall name MGMT-SECURITY description 'From MGMT to SECURITY'
set firewall name MGMT-SECURITY enable-default-log


# (40) From MGMT to SERVERS
set firewall name MGMT-SERVERS default-action 'drop'
set firewall name MGMT-SERVERS description 'From MGMT to SERVERS'
set firewall name MGMT-SERVERS enable-default-log


# (50) From MGMT to IOT
set firewall name MGMT-IOT default-action 'drop'
set firewall name MGMT-IOT description 'From MGMT to IOT'
set firewall name MGMT-IOT enable-default-log


# (95) From MGMT to CONTAINERS
set firewall name MGMT-CONTAINERS default-action 'drop'
set firewall name MGMT-CONTAINERS description 'From MGMT to CONTAINERS'
set firewall name MGMT-CONTAINERS rule 10 description 'Rule: accept_dns'
set firewall name MGMT-CONTAINERS rule 10 action 'accept'
set firewall name MGMT-CONTAINERS rule 10 destination port 'domain,domain-s'
set firewall name MGMT-CONTAINERS rule 10 protocol 'tcp_udp'
set firewall name MGMT-CONTAINERS enable-default-log


# (97) From MGMT to LOCAL
set firewall name MGMT-LOCAL default-action 'drop'
set firewall name MGMT-LOCAL description 'From MGMT to LOCAL'
set firewall name MGMT-LOCAL rule 10 description 'Rule: accept_ntp'
set firewall name MGMT-LOCAL rule 10 action 'accept'
set firewall name MGMT-LOCAL rule 10 destination port 'ntp'
set firewall name MGMT-LOCAL rule 10 protocol 'udp'
set firewall name MGMT-LOCAL rule 20 description 'Rule: accept_dhcp'
set firewall name MGMT-LOCAL rule 20 action 'accept'
set firewall name MGMT-LOCAL rule 20 destination port 'bootps,bootpc'
set firewall name MGMT-LOCAL rule 20 protocol 'udp'
set firewall name MGMT-LOCAL rule 20 source port 'bootps,bootpc'
set firewall name MGMT-LOCAL rule 30 description 'Rule: drop_eap_discovery'
set firewall name MGMT-LOCAL rule 30 action 'drop'
set firewall name MGMT-LOCAL rule 30 destination port '29810'
set firewall name MGMT-LOCAL rule 30 protocol 'udp'
set firewall name MGMT-LOCAL enable-default-log


# (99) From MGMT to WAN
set firewall name MGMT-WAN default-action 'accept'
set firewall name MGMT-WAN description 'From MGMT to WAN'