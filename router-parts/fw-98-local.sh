#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### local ----------------------------------------------------------------------------
# (00) From local to lan
set firewall ipv4 name local-lan default-action 'drop'
set firewall ipv4 name local-lan description 'From local to lan'
set firewall ipv4 name local-lan default-log
### --- 010-lan : Accpet MDNS (5353)
set firewall ipv4 name local-lan rule 10 action 'accept'
set firewall ipv4 name local-lan rule 10 description 'Rule: accept_MDNS'
set firewall ipv4 name local-lan rule 10 destination port 'mdns'
set firewall ipv4 name local-lan rule 10 protocol 'udp'
set firewall ipv4 name local-lan rule 10 source port 'mdns'
### --- 999-lan : Drop Invalid Packets
set firewall ipv4 name local-lan rule 999 action 'drop'
set firewall ipv4 name local-lan rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-lan rule 999 log
set firewall ipv4 name local-lan rule 999 state invalid

# (10) From local to trusted
set firewall ipv4 name local-trusted default-action 'drop'
set firewall ipv4 name local-trusted description 'From local to trusted'
set firewall ipv4 name local-trusted default-log
### --- 020-trusted : Accept MDNS (5353)
set firewall ipv4 name local-trusted rule 20 action 'accept'
set firewall ipv4 name local-trusted rule 20 description 'Rule: accept_MDNS'
set firewall ipv4 name local-trusted rule 20 destination port 'mdns'
set firewall ipv4 name local-trusted rule 20 protocol 'udp'
set firewall ipv4 name local-trusted rule 20 source port 'mdns'
### --- 999-trusted : Drop Invalid Packets
set firewall ipv4 name local-trusted rule 999 action 'drop'
set firewall ipv4 name local-trusted rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-trusted rule 999 log
set firewall ipv4 name local-trusted rule 999 state invalid

# (20) From local to guest
set firewall ipv4 name local-guest default-action 'drop'
set firewall ipv4 name local-guest description 'From local to guest'
set firewall ipv4 name local-guest default-log
### --- 999-guest : Drop Invalid Packets
set firewall ipv4 name local-guest rule 999 action 'drop'
set firewall ipv4 name local-guest rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-guest rule 999 log
set firewall ipv4 name local-guest rule 999 state invalid

# (30) From local to iot
set firewall ipv4 name local-iot default-action 'drop'
set firewall ipv4 name local-iot description 'From local to iot'
set firewall ipv4 name local-iot default-log
### --- 050-iot : Accept MDNS (5353)
set firewall ipv4 name local-iot rule 50 action 'accept'
set firewall ipv4 name local-iot rule 50 description 'Rule: accept_MDNS'
set firewall ipv4 name local-iot rule 50 destination port 'mdns'
set firewall ipv4 name local-iot rule 50 protocol 'udp'
set firewall ipv4 name local-iot rule 50 source port 'mdns'
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name local-iot rule 999 action 'drop'
set firewall ipv4 name local-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-iot rule 999 log
set firewall ipv4 name local-iot rule 999 state invalid

# (40) From local to servers
set firewall ipv4 name local-servers default-action 'drop'
set firewall ipv4 name local-servers description 'From local to servers'
set firewall ipv4 name local-servers default-log
### --- 010-servers : Accept NTP Traffic (123)
set firewall ipv4 name local-servers rule 10 action 'accept'
set firewall ipv4 name local-servers rule 10 description 'Rule: Accept_NTP'
set firewall ipv4 name local-servers rule 10 destination port 'ntp'
set firewall ipv4 name local-servers rule 10 protocol 'udp'
### --- 070-servers : Accept BGP Traffic (bgp)
set firewall ipv4 name local-servers rule 70 action 'accept'
set firewall ipv4 name local-servers rule 70 description 'Rule: accept_bgp'
set firewall ipv4 name local-servers rule 70 destination port 'bgp'
set firewall ipv4 name local-servers rule 70 protocol 'tcp'
### --- 080-servers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name local-servers rule 80 action 'accept'
set firewall ipv4 name local-servers rule 80 description 'Rule: Accept_DNS'
set firewall ipv4 name local-servers rule 80 destination port 'domain,domain-s'
set firewall ipv4 name local-servers rule 80 protocol 'tcp_udp'
### --- 100-servers : Accept SYSLOG Traffic (6001)
set firewall ipv4 name local-servers rule 100 action 'accept'
set firewall ipv4 name local-servers rule 100 description 'Rule: Accept_SYSLOG'
set firewall ipv4 name local-servers rule 100 destination port '6001'
set firewall ipv4 name local-servers rule 100 protocol 'tcp'
### --- 110-servers : Accept MDNS (5353)
set firewall ipv4 name local-servers rule 110 action 'accept'
set firewall ipv4 name local-servers rule 110 description 'Rule: accept_MDNS'
set firewall ipv4 name local-servers rule 110 destination port 'mdns'
set firewall ipv4 name local-servers rule 110 protocol 'udp'
set firewall ipv4 name local-servers rule 110 source port 'mdns'
### --- 999-servers : Drop Invalid Packets
set firewall ipv4 name local-servers rule 999 action 'drop'
set firewall ipv4 name local-servers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-servers rule 999 log
set firewall ipv4 name local-servers rule 999 state invalid

# (50) From local to video
set firewall ipv4 name local-video default-action 'drop'
set firewall ipv4 name local-video description 'From local to video'
set firewall ipv4 name local-video default-log
### --- 020-video : Accpet MDNS (5353)
set firewall ipv4 name local-video rule 10 action 'accept'
set firewall ipv4 name local-video rule 10 description 'Rule: accept_MDNS'
set firewall ipv4 name local-video rule 10 destination port 'mdns'
set firewall ipv4 name local-video rule 10 protocol 'udp'
set firewall ipv4 name local-video rule 10 source port 'mdns'
### --- 999-video : Drop Invalid Packets
set firewall ipv4 name local-video rule 999 action 'drop'
set firewall ipv4 name local-video rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-video rule 999 log
set firewall ipv4 name local-video rule 999 state invalid

# (95) From local to containers
set firewall ipv4 name local-containers default-action 'accept'
set firewall ipv4 name local-containers description 'From local to containers'
### --- 010-containers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name local-containers rule 10 action 'accept'
set firewall ipv4 name local-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name local-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name local-containers rule 10 protocol 'tcp_udp'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name local-containers rule 999 action 'drop'
set firewall ipv4 name local-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-containers rule 999 log
set firewall ipv4 name local-containers rule 999 state invalid

# (99) From local to wan
set firewall ipv4 name local-wan default-action 'accept'
set firewall ipv4 name local-wan description 'From local to wan'
