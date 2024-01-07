#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### containers ----------------------------------------------------------------------------
# (00) From containers to lan
set firewall ipv4 name containers-lan default-action 'drop'
set firewall ipv4 name containers-lan description 'From containers to lan'
set firewall ipv4 name containers-lan default-log
### --- 999-lan : Drop Invalid Packets
set firewall ipv4 name containers-lan rule 999 action 'drop'
set firewall ipv4 name containers-lan rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-lan rule 999 log
set firewall ipv4 name containers-lan rule 999 state invalid

# (10) From containers to trusted
set firewall ipv4 name containers-trusted default-action 'drop'
set firewall ipv4 name containers-trusted description 'From containers to trusted'
set firewall ipv4 name containers-trusted default-log
### --- 999-trusted : Drop Invalid Packets
set firewall ipv4 name containers-trusted rule 999 action 'drop'
set firewall ipv4 name containers-trusted rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-trusted rule 999 log
set firewall ipv4 name containers-trusted rule 999 state invalid

# (20) From containers to guest
set firewall ipv4 name containers-guest default-action 'drop'
set firewall ipv4 name containers-guest description 'From containers to guest'
set firewall ipv4 name containers-guest default-log
### --- 999-guest : Drop Invalid Packets
set firewall ipv4 name containers-guest rule 999 action 'drop'
set firewall ipv4 name containers-guest rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-guest rule 999 log
set firewall ipv4 name containers-guest rule 999 state invalid

# (30) From containers to iot
set firewall ipv4 name containers-iot default-action 'drop'
set firewall ipv4 name containers-iot description 'From containers to iot'
set firewall ipv4 name containers-iot default-log
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name containers-iot rule 999 action 'drop'
set firewall ipv4 name containers-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-iot rule 999 log
set firewall ipv4 name containers-iot rule 999 state invalid

# (40) From containers to servers
set firewall ipv4 name containers-servers default-action 'accept'
set firewall ipv4 name containers-servers description 'From containers to servers'
### --- 080-servers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name containers-servers rule 80 action 'accept'
set firewall ipv4 name containers-servers rule 80 description 'Rule: Accept_DNS'
set firewall ipv4 name containers-servers rule 80 destination port 'domain,domain-s'
set firewall ipv4 name containers-servers rule 80 protocol 'tcp_udp'
### --- 999-servers : Drop Invalid Packets
set firewall ipv4 name containers-servers rule 999 action 'drop'
set firewall ipv4 name containers-servers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-servers rule 999 log
set firewall ipv4 name containers-servers rule 999 state invalid

# (97) From containers to local
set firewall ipv4 name containers-local default-action 'drop'
set firewall ipv4 name containers-local description 'From containers to local'
set firewall ipv4 name containers-local default-log
### --- 010-local : Accept DHCP Traffic (67,68)
set firewall ipv4 name containers-local rule 10 action 'accept'
set firewall ipv4 name containers-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name containers-local rule 10 destination port '67,68'
set firewall ipv4 name containers-local rule 10 protocol 'udp'
set firewall ipv4 name containers-local rule 10 source port '67,68'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name containers-local rule 999 action 'drop'
set firewall ipv4 name containers-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-local rule 999 log
set firewall ipv4 name containers-local rule 999 state invalid

# (99) From containers to wan
set firewall ipv4 name containers-wan default-action 'accept'
set firewall ipv4 name containers-wan description 'From containers to wan'
