#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### SERVERS ----------------------------------------------------------------------------

# (10) From SERVERS to TRUSTED
set firewall name SERVERS-TRUSTED default-action 'drop'
set firewall name SERVERS-TRUSTED description 'From SERVERS to TRUSTED'
set firewall name SERVERS-TRUSTED rule 10 description 'Rule: accept_icmp'
set firewall name SERVERS-TRUSTED rule 10 action 'accept'
set firewall name SERVERS-TRUSTED rule 10 protocol 'icmp'
set firewall name SERVERS-TRUSTED rule 20 description 'Rule: accept_iperf'
set firewall name SERVERS-TRUSTED rule 20 action 'accept'
set firewall name SERVERS-TRUSTED rule 20 destination port '5001'
set firewall name SERVERS-TRUSTED rule 20 protocol 'tcp'
set firewall name SERVERS-TRUSTED enable-default-log


# (20) From SERVERS to GUEST
set firewall name SERVERS-GUEST default-action 'drop'
set firewall name SERVERS-GUEST description 'From SERVERS to GUEST'
set firewall name SERVERS-GUEST rule 10 description 'Rule: accept_icmp'
set firewall name SERVERS-GUEST rule 10 action 'accept'
set firewall name SERVERS-GUEST rule 10 protocol 'icmp'
set firewall name SERVERS-GUEST enable-default-log


# (30) From SERVERS to SECURITY
set firewall name SERVERS-SECURITY default-action 'drop'
set firewall name SERVERS-SECURITY description 'From SERVERS to SECURITY'
set firewall name SERVERS-SECURITY rule 10 description 'Rule: accept_icmp'
set firewall name SERVERS-SECURITY rule 10 action 'accept'
set firewall name SERVERS-SECURITY rule 10 protocol 'icmp'
set firewall name SERVERS-SECURITY enable-default-log


# (50) From SERVERS to IOT
set firewall name SERVERS-IOT default-action 'drop'
set firewall name SERVERS-IOT description 'From SERVERS to IOT'
set firewall name SERVERS-IOT rule 10 description 'Rule: accept_icmp'
set firewall name SERVERS-IOT rule 10 action 'accept'
set firewall name SERVERS-IOT rule 10 protocol 'icmp'
set firewall name SERVERS-IOT rule 20 description 'Rule: accept_rtsp'
set firewall name SERVERS-IOT rule 20 action 'accept'
set firewall name SERVERS-IOT rule 20 destination port 'rtsp'
set firewall name SERVERS-IOT rule 20 protocol 'tcp'
set firewall name SERVERS-IOT enable-default-log


# (70) From SERVERS to MGMT
set firewall name SERVERS-MGMT default-action 'drop'
set firewall name SERVERS-MGMT description 'From SERVERS to MGMT'
set firewall name SERVERS-MGMT rule 10 description 'Rule: accept_icmp'
set firewall name SERVERS-MGMT rule 10 action 'accept'
set firewall name SERVERS-MGMT rule 10 protocol 'icmp'
set firewall name SERVERS-MGMT enable-default-log


# (95) From SERVERS to CONTAINERS
set firewall name SERVERS-CONTAINERS default-action 'drop'
set firewall name SERVERS-CONTAINERS description 'From SERVERS to CONTAINERS'
set firewall name SERVERS-CONTAINERS rule 10 description 'Rule: accept_dns'
set firewall name SERVERS-CONTAINERS rule 10 action 'accept'
set firewall name SERVERS-CONTAINERS rule 10 destination port 'domain,domain-s'
set firewall name SERVERS-CONTAINERS rule 10 protocol 'tcp_udp'
set firewall name SERVERS-CONTAINERS enable-default-log


# (97) From SERVERS to LOCAL
set firewall name SERVERS-LOCAL default-action 'drop'
set firewall name SERVERS-LOCAL description 'From SERVERS to LOCAL'
set firewall name SERVERS-LOCAL rule 10 description 'Rule: accept_ntp'
set firewall name SERVERS-LOCAL rule 10 action 'accept'
set firewall name SERVERS-LOCAL rule 10 destination port 'ntp'
set firewall name SERVERS-LOCAL rule 10 protocol 'udp'
set firewall name SERVERS-LOCAL rule 20 description 'Rule: accept_dhcp'
set firewall name SERVERS-LOCAL rule 20 action 'accept'
set firewall name SERVERS-LOCAL rule 20 destination port 'bootps,bootpc'
set firewall name SERVERS-LOCAL rule 20 protocol 'udp'
set firewall name SERVERS-LOCAL rule 20 source port 'bootps,bootpc'
set firewall name SERVERS-LOCAL rule 30 description 'Rule: accept_icmp'
set firewall name SERVERS-LOCAL rule 30 action 'accept'
set firewall name SERVERS-LOCAL rule 30 protocol 'icmp'
set firewall name SERVERS-LOCAL rule 40 description 'Rule: accept_mdns'
set firewall name SERVERS-LOCAL rule 40 action 'accept'
set firewall name SERVERS-LOCAL rule 40 destination port 'mdns'
set firewall name SERVERS-LOCAL rule 40 protocol 'udp'
set firewall name SERVERS-LOCAL rule 50 description 'Rule: accept_iperf'
set firewall name SERVERS-LOCAL rule 50 action 'accept'
set firewall name SERVERS-LOCAL rule 50 destination port '5001'
set firewall name SERVERS-LOCAL rule 50 protocol 'tcp'
set firewall name SERVERS-LOCAL rule 60 description 'Rule: accept_snmp'
set firewall name SERVERS-LOCAL rule 60 action 'accept'
set firewall name SERVERS-LOCAL rule 60 destination port '161'
set firewall name SERVERS-LOCAL rule 60 protocol 'udp'
set firewall name SERVERS-LOCAL rule 70 description 'Rule: accept_upnp'
set firewall name SERVERS-LOCAL rule 70 action 'accept'
set firewall name SERVERS-LOCAL rule 70 destination port '1900'
set firewall name SERVERS-LOCAL rule 70 protocol 'udp'
set firewall name SERVERS-LOCAL enable-default-log


# (99) From SERVERS to WAN
set firewall name SERVERS-WAN default-action 'accept'
set firewall name SERVERS-WAN description 'From SERVERS to WAN'
