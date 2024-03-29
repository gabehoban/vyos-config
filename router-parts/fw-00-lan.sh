#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### lan ----------------------------------------------------------------------------
# (10) From lan to trusted
set firewall ipv4 name lan-trusted default-action 'drop'
set firewall ipv4 name lan-trusted description 'From lan to trusted'
set firewall ipv4 name lan-trusted default-log
### --- 999-trusted : Drop Invalid Packets
set firewall ipv4 name lan-trusted rule 999 action 'drop'
set firewall ipv4 name lan-trusted rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name lan-trusted rule 999 log
set firewall ipv4 name lan-trusted rule 999 state invalid

# (20) From lan to guest
set firewall ipv4 name lan-guest default-action 'drop'
set firewall ipv4 name lan-guest description 'From lan to guest'
set firewall ipv4 name lan-guest default-log
### --- 999-guest : Drop Invalid Packets
set firewall ipv4 name lan-guest rule 999 action 'drop'
set firewall ipv4 name lan-guest rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name lan-guest rule 999 log
set firewall ipv4 name lan-guest rule 999 state invalid

# (30) From lan to iot
set firewall ipv4 name lan-iot default-action 'drop'
set firewall ipv4 name lan-iot description 'From lan to iot'
set firewall ipv4 name lan-iot default-log
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name lan-iot rule 999 action 'drop'
set firewall ipv4 name lan-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name lan-iot rule 999 log
set firewall ipv4 name lan-iot rule 999 state invalid

# (40) From lan to servers
set firewall ipv4 name lan-servers default-action 'drop'
set firewall ipv4 name lan-servers description 'From lan to servers'
set firewall ipv4 name lan-servers default-log
### --- 010-servers : Accept NTP Traffic (123)
set firewall ipv4 name lan-servers rule 10 action 'accept'
set firewall ipv4 name lan-servers rule 10 description 'Rule: Accept_NTP'
set firewall ipv4 name lan-servers rule 10 destination port 'ntp'
set firewall ipv4 name lan-servers rule 10 protocol 'udp'
### --- 999-servers : Drop Invalid Packets
set firewall ipv4 name lan-servers rule 999 action 'drop'
set firewall ipv4 name lan-servers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name lan-servers rule 999 log
set firewall ipv4 name lan-servers rule 999 state invalid

# (50) From lan to video
set firewall ipv4 name lan-video default-action 'drop'
set firewall ipv4 name lan-video description 'From lan to video'
set firewall ipv4 name lan-video default-log
### --- 999-video : Drop Invalid Packets
set firewall ipv4 name lan-video rule 999 action 'drop'
set firewall ipv4 name lan-video rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name lan-video rule 999 log
set firewall ipv4 name lan-video rule 999 state invalid

# (95) From lan to containers
set firewall ipv4 name lan-containers default-action 'drop'
set firewall ipv4 name lan-containers description 'From lan to containers'
### --- 010-containers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name lan-containers rule 10 action 'accept'
set firewall ipv4 name lan-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name lan-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name lan-containers rule 10 protocol 'tcp_udp'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name lan-containers rule 999 action 'drop'
set firewall ipv4 name lan-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name lan-containers rule 999 log
set firewall ipv4 name lan-containers rule 999 state invalid

# (97) From lan to local
set firewall ipv4 name lan-local default-action 'drop'
set firewall ipv4 name lan-local description 'From lan to local'
set firewall ipv4 name lan-local default-log
### --- 010-local : Accept DHCP Traffic (67,68)
set firewall ipv4 name lan-local rule 10 action 'accept'
set firewall ipv4 name lan-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name lan-local rule 10 destination port '67,68'
set firewall ipv4 name lan-local rule 10 protocol 'udp'
set firewall ipv4 name lan-local rule 10 source port '67,68'
### --- 060-local : Accept MDNS (5353)
set firewall ipv4 name lan-local rule 60 action 'accept'
set firewall ipv4 name lan-local rule 60 description 'Rule: accept_MDNS'
set firewall ipv4 name lan-local rule 60 destination port 'mdns'
set firewall ipv4 name lan-local rule 60 protocol 'udp'
set firewall ipv4 name lan-local rule 60 source port 'mdns'
### --- 990-local : Drop Omada Related Packets
set firewall ipv4 name lan-local rule 990 action 'drop'
set firewall ipv4 name lan-local rule 990 description 'Rule: Drop_OMADA'
set firewall ipv4 name lan-local rule 990 destination port '29810'
set firewall ipv4 name lan-local rule 990 protocol 'udp'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name lan-local rule 999 action 'drop'
set firewall ipv4 name lan-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name lan-local rule 999 log
set firewall ipv4 name lan-local rule 999 state invalid

# From lan to wan
set firewall ipv4 name lan-wan default-action 'accept'
set firewall ipv4 name lan-wan description 'From lan to wan'