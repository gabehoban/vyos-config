#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### TRUSTED ----------------------------------------------------------------------------

# (20) From TRUSTED to GUEST
set firewall name TRUSTED-GUEST default-action 'drop'
set firewall name TRUSTED-GUEST description 'From TRUSTED to GUEST'
set firewall name TRUSTED-GUEST enable-default-log


# (30) From TRUSTED to SECURITY
set firewall name TRUSTED-SECURITY default-action 'drop'
set firewall name TRUSTED-SECURITY description 'From TRUSTED to SECURITY'
set firewall name TRUSTED-SECURITY enable-default-log


# (40) From TRUSTED to SERVERS
set firewall name TRUSTED-SERVERS default-action 'drop'
set firewall name TRUSTED-SERVERS description 'From TRUSTED to SERVERS'
set firewall name TRUSTED-SERVERS rule 10 description 'Rule: accept_ssh'
set firewall name TRUSTED-SERVERS rule 10 action 'accept'
set firewall name TRUSTED-SERVERS rule 10 destination port 'ssh'
set firewall name TRUSTED-SERVERS rule 10 protocol 'tcp'
set firewall name TRUSTED-SERVERS rule 20 description 'Rule: accept_http'
set firewall name TRUSTED-SERVERS rule 20 action 'accept'
set firewall name TRUSTED-SERVERS rule 20 destination port '80'
set firewall name TRUSTED-SERVERS rule 20 protocol 'tcp'
set firewall name TRUSTED-SERVERS rule 30 description 'Rule: accept_https'
set firewall name TRUSTED-SERVERS rule 30 action 'accept'
set firewall name TRUSTED-SERVERS rule 30 destination port '443'
set firewall name TRUSTED-SERVERS rule 30 protocol 'tcp'
set firewall name TRUSTED-SERVERS rule 50 description 'Rule: accept_hass_vscode'
set firewall name TRUSTED-SERVERS rule 50 action 'accept'
set firewall name TRUSTED-SERVERS rule 50 destination port '22000'
set firewall name TRUSTED-SERVERS rule 50 protocol 'tcp'
set firewall name TRUSTED-SERVERS enable-default-log


# (50) From TRUSTED to IOT
set firewall name TRUSTED-IOT default-action 'drop'
set firewall name TRUSTED-IOT description 'From TRUSTED to IOT'
set firewall name TRUSTED-IOT enable-default-log


# (70) From TRUSTED to MGMT
set firewall name TRUSTED-MGMT default-action 'drop'
set firewall name TRUSTED-MGMT description 'From TRUSTED to MGMT'
set firewall name TRUSTED-MGMT enable-default-log


# (95) From TRUSTED to CONTAINERS
set firewall name TRUSTED-CONTAINERS default-action 'drop'
set firewall name TRUSTED-CONTAINERS description 'From TRUSTED to CONTAINERS'
set firewall name TRUSTED-CONTAINERS rule 10 description 'Rule: accept_dns'
set firewall name TRUSTED-CONTAINERS rule 10 action 'accept'
set firewall name TRUSTED-CONTAINERS rule 10 destination port 'domain,domain-s'
set firewall name TRUSTED-CONTAINERS rule 10 protocol 'tcp_udp'
set firewall name TRUSTED-CONTAINERS enable-default-log


# (97) From TRUSTED to LOCAL
set firewall name TRUSTED-LOCAL default-action 'drop'
set firewall name TRUSTED-LOCAL description 'From TRUSTED to LOCAL'
set firewall name TRUSTED-LOCAL rule 10 description 'Rule: accept_ntp'
set firewall name TRUSTED-LOCAL rule 10 action 'accept'
set firewall name TRUSTED-LOCAL rule 10 destination port 'ntp'
set firewall name TRUSTED-LOCAL rule 10 protocol 'udp'
set firewall name TRUSTED-LOCAL rule 20 description 'Rule: accept_dhcp'
set firewall name TRUSTED-LOCAL rule 20 action 'accept'
set firewall name TRUSTED-LOCAL rule 20 destination port 'bootps,bootpc'
set firewall name TRUSTED-LOCAL rule 20 protocol 'udp'
set firewall name TRUSTED-LOCAL rule 20 source port 'bootps,bootpc'
set firewall name TRUSTED-LOCAL rule 30 description 'Rule: accept_mdns'
set firewall name TRUSTED-LOCAL rule 30 action 'accept'
set firewall name TRUSTED-LOCAL rule 30 destination port 'mdns'
set firewall name TRUSTED-LOCAL rule 30 protocol 'udp'
set firewall name TRUSTED-LOCAL rule 40 description 'Rule: accept_ssh'
set firewall name TRUSTED-LOCAL rule 40 action 'accept'
set firewall name TRUSTED-LOCAL rule 40 destination port 'ssh'
set firewall name TRUSTED-LOCAL rule 40 protocol 'tcp'
set firewall name TRUSTED-LOCAL rule 50 description 'Rule: accept_wireguard'
set firewall name TRUSTED-LOCAL rule 50 action 'accept'
set firewall name TRUSTED-LOCAL rule 50 destination port '51820'
set firewall name TRUSTED-LOCAL rule 50 protocol 'udp'
set firewall name TRUSTED-LOCAL enable-default-log


# From TRUSTED to WAN
set firewall name TRUSTED-WAN default-action 'accept'
set firewall name TRUSTED-WAN description 'From TRUSTED to WAN'
