#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### WAN --------------------------------------------------------------------------------

# (10) From WAN to TRUSTED
set firewall name WAN-TRUSTED default-action 'drop'
set firewall name WAN-TRUSTED description 'From WAN to TRUSTED'
set firewall name WAN-TRUSTED enable-default-log


# (20) From WAN to GUEST
set firewall name WAN-GUEST default-action 'drop'
set firewall name WAN-GUEST description 'From WAN to GUEST'
set firewall name WAN-GUEST enable-default-log


# (30) From WAN to SECURITY
set firewall name WAN-SECURITY default-action 'drop'
set firewall name WAN-SECURITY description 'From WAN to SECURITY'
set firewall name WAN-SECURITY enable-default-log


# (40) From WAN to SERVERS
set firewall name WAN-SERVERS default-action 'drop'
set firewall name WAN-SERVERS description 'From WAN to SERVERS'
set firewall name WAN-SERVERS enable-default-log


# (50) From WAN to IOT
set firewall name WAN-IOT default-action 'drop'
set firewall name WAN-IOT description 'From WAN to IOT'
set firewall name WAN-IOT enable-default-log


# (70) From WAN to MGMT
set firewall name WAN-MGMT default-action 'drop'
set firewall name WAN-MGMT description 'From WAN to MGMT'
set firewall name WAN-MGMT enable-default-log


# (95) From WAN to CONTAINERS
set firewall name WAN-CONTAINERS default-action 'drop'
set firewall name WAN-CONTAINERS description 'From WAN to CONTAINERS'
set firewall name WAN-CONTAINERS enable-default-log


# (97) From WAN to LOCAL
set firewall name WAN-LOCAL default-action 'drop'
set firewall name WAN-LOCAL description 'From WAN to LOCAL'
set firewall name WAN-LOCAL rule 10 action 'accept'
set firewall name WAN-LOCAL rule 10 description 'Rule: accept_wireguard'
set firewall name WAN-LOCAL rule 10 destination port '51820'
set firewall name WAN-LOCAL rule 10 protocol 'udp'
set firewall name WAN-LOCAL enable-default-log
