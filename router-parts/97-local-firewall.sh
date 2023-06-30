#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### LOCAL ----------------------------------------------------------------------------

# (10) From LOCAL to TRUSTED
set firewall name LOCAL-TRUSTED default-action 'drop'
set firewall name LOCAL-TRUSTED description 'From LOCAL to TRUSTED'
set firewall name LOCAL-TRUSTED rule 10 description 'Rule: accept_mdns'
set firewall name LOCAL-TRUSTED rule 10 action 'accept'
set firewall name LOCAL-TRUSTED rule 10 destination port 'mdns'
set firewall name LOCAL-TRUSTED rule 10 protocol 'udp'
set firewall name LOCAL-TRUSTED rule 20 description 'Rule: accept_icmp'
set firewall name LOCAL-TRUSTED rule 20 action 'accept'
set firewall name LOCAL-TRUSTED rule 20 protocol 'icmp'
set firewall name LOCAL-TRUSTED rule 30 description 'Rule: accept_igmp'
set firewall name LOCAL-TRUSTED rule 30 action 'accept'
set firewall name LOCAL-TRUSTED rule 30 protocol '2'
set firewall name LOCAL-TRUSTED rule 40 description 'Rule: accept_wireguard'
set firewall name LOCAL-TRUSTED rule 40 action 'accept'
set firewall name LOCAL-TRUSTED rule 40 destination port '51820'
set firewall name LOCAL-TRUSTED rule 40 protocol 'udp'
set firewall name LOCAL-TRUSTED enable-default-log


# (20) From LOCAL to GUEST
set firewall name LOCAL-GUEST default-action 'drop'
set firewall name LOCAL-GUEST description 'From LOCAL to GUEST'
set firewall name LOCAL-GUEST rule 10 description 'Rule: accept_mdns'
set firewall name LOCAL-GUEST rule 10 action 'accept'
set firewall name LOCAL-GUEST rule 10 destination port 'mdns'
set firewall name LOCAL-GUEST rule 10 protocol 'udp'
set firewall name LOCAL-GUEST rule 20 description 'Rule: accept_igmp'
set firewall name LOCAL-GUEST rule 20 action 'accept'
set firewall name LOCAL-GUEST rule 20 protocol '2'
set firewall name LOCAL-GUEST enable-default-log


# (30) From LOCAL to SECURITY
set firewall name LOCAL-SECURITY default-action 'drop'
set firewall name LOCAL-SECURITY description 'From LOCAL to SECURITY'
set firewall name LOCAL-SECURITY rule 10 description 'Rule: accept_mdns'
set firewall name LOCAL-SECURITY rule 10 action 'accept'
set firewall name LOCAL-SECURITY rule 10 destination port 'mdns'
set firewall name LOCAL-SECURITY rule 10 protocol 'udp'
set firewall name LOCAL-SECURITY enable-default-log


# (40) From LOCAL to SERVERS
set firewall name LOCAL-SERVERS default-action 'drop'
set firewall name LOCAL-SERVERS description 'From LOCAL to SERVERS'
set firewall name LOCAL-SERVERS rule 10 description 'Rule: accept_ssh'
set firewall name LOCAL-SERVERS rule 10 action 'accept'
set firewall name LOCAL-SERVERS rule 10 destination port 'ssh'
set firewall name LOCAL-SERVERS rule 10 protocol 'tcp'
set firewall name LOCAL-SERVERS rule 20 description 'Rule: accept_influxdb'
set firewall name LOCAL-SERVERS rule 20 action 'accept'
set firewall name LOCAL-SERVERS rule 20 destination port '8086'
set firewall name LOCAL-SERVERS rule 20 protocol 'tcp'
set firewall name LOCAL-SERVERS rule 30 description 'Rule: accept_syslog'
set firewall name LOCAL-SERVERS rule 30 action 'accept'
set firewall name LOCAL-SERVERS rule 30 destination port '10514'
set firewall name LOCAL-SERVERS rule 30 protocol 'udp'
set firewall name LOCAL-SERVERS rule 40 description 'Rule: accept_netflow'
set firewall name LOCAL-SERVERS rule 40 action 'accept'
set firewall name LOCAL-SERVERS rule 40 destination port '9995'
set firewall name LOCAL-SERVERS rule 40 protocol 'udp'
set firewall name LOCAL-SERVERS rule 50 description 'Rule: accept_mdns'
set firewall name LOCAL-SERVERS rule 50 action 'accept'
set firewall name LOCAL-SERVERS rule 50 destination port 'mdns'
set firewall name LOCAL-SERVERS rule 50 protocol 'udp'
set firewall name LOCAL-SERVERS enable-default-log


# (50) From LOCAL to IOT
set firewall name LOCAL-IOT default-action 'drop'
set firewall name LOCAL-IOT description 'From LOCAL to IOT'
set firewall name LOCAL-IOT rule 10 description 'Rule: accept_mdns'
set firewall name LOCAL-IOT rule 10 action 'accept'
set firewall name LOCAL-IOT rule 10 destination port 'mdns'
set firewall name LOCAL-IOT rule 10 protocol 'udp'
set firewall name LOCAL-IOT rule 20 description 'Rule: accept_igmp'
set firewall name LOCAL-IOT rule 20 action 'accept'
set firewall name LOCAL-IOT rule 20 protocol '2'
set firewall name LOCAL-IOT enable-default-log


# (70) From LOCAL to MGMT
set firewall name LOCAL-MGMT default-action 'drop'
set firewall name LOCAL-MGMT description 'From LOCAL to MGMT'
set firewall name LOCAL-MGMT enable-default-log


# (95) From LOCAL to CONTAINERS
set firewall name LOCAL-CONTAINERS default-action 'drop'
set firewall name LOCAL-CONTAINERS description 'From LOCAL to CONTAINERS'
set firewall name LOCAL-CONTAINERS rule 10 description 'Rule: accept_dns'
set firewall name LOCAL-CONTAINERS rule 10 action 'accept'
set firewall name LOCAL-CONTAINERS rule 10 destination port 'domain,domain-s'
set firewall name LOCAL-CONTAINERS rule 10 protocol 'tcp_udp'
set firewall name LOCAL-CONTAINERS enable-default-log


# (99) From LOCAL to WAN
set firewall name LOCAL-WAN default-action 'accept'
set firewall name LOCAL-WAN description 'From LOCAL to WAN'
