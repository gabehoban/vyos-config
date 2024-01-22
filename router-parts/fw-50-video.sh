#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### video ----------------------------------------------------------------------------
# (00) From video to lan
set firewall ipv4 name video-lan default-action 'drop'
set firewall ipv4 name video-lan description 'From video to lan'
set firewall ipv4 name video-lan default-log
### --- 999-lan : Drop Invalid Packets
set firewall ipv4 name video-lan rule 999 action 'drop'
set firewall ipv4 name video-lan rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name video-lan rule 999 log
set firewall ipv4 name video-lan rule 999 state invalid

# (10) From video to trusted
set firewall ipv4 name video-trusted default-action 'drop'
set firewall ipv4 name video-trusted description 'From video to trusted'
set firewall ipv4 name video-trusted default-log
### --- 999-trusted : Drop Invalid Packets
set firewall ipv4 name video-trusted rule 999 action 'drop'
set firewall ipv4 name video-trusted rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name video-trusted rule 999 log
set firewall ipv4 name video-trusted rule 999 state invalid

# (20) From video to guest
set firewall ipv4 name video-guest default-action 'drop'
set firewall ipv4 name video-guest description 'From video to guest'
set firewall ipv4 name video-guest default-log
### --- 999-guest : Drop Invalid Packets
set firewall ipv4 name video-guest rule 999 action 'drop'
set firewall ipv4 name video-guest rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name video-guest rule 999 log
set firewall ipv4 name video-guest rule 999 state invalid

# (30) From video to iot
set firewall ipv4 name video-iot default-action 'drop'
set firewall ipv4 name video-iot description 'From video to iot'
set firewall ipv4 name video-iot default-log
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name video-iot rule 999 action 'drop'
set firewall ipv4 name video-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name video-iot rule 999 log
set firewall ipv4 name video-iot rule 999 state invalid

# (40) From video to servers
set firewall ipv4 name video-servers default-action 'drop'
set firewall ipv4 name video-servers description 'From video to servers'
set firewall ipv4 name video-servers default-log
### --- 999-servers : Drop Invalid Packets
set firewall ipv4 name video-servers rule 999 action 'drop'
set firewall ipv4 name video-servers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name video-servers rule 999 log
set firewall ipv4 name video-servers rule 999 state invalid

# (95) From video to containers
set firewall ipv4 name video-containers default-action 'drop'
set firewall ipv4 name video-containers description 'From video to containers'
set firewall ipv4 name video-containers default-log
### --- 010-containers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name video-containers rule 10 action 'accept'
set firewall ipv4 name video-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name video-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name video-containers rule 10 protocol 'tcp_udp'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name video-containers rule 999 action 'drop'
set firewall ipv4 name video-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name video-containers rule 999 log
set firewall ipv4 name video-containers rule 999 state invalid

# (97) From video to local
set firewall ipv4 name video-local default-action 'drop'
set firewall ipv4 name video-local description 'From video to local'
set firewall ipv4 name video-local default-log
### --- 010-local : Accept DHCP Traffic (67,68)
set firewall ipv4 name video-local rule 10 action 'accept'
set firewall ipv4 name video-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name video-local rule 10 destination port '67,68'
set firewall ipv4 name video-local rule 10 protocol 'udp'
set firewall ipv4 name video-local rule 10 source port '67,68'
### --- 020-local : Accept NTP Traffic (123)
set firewall ipv4 name video-local rule 20 action 'accept'
set firewall ipv4 name video-local rule 20 description 'Rule: Accept_NTP'
set firewall ipv4 name video-local rule 20 destination port 'ntp'
set firewall ipv4 name video-local rule 20 protocol 'udp'
### --- 050-local : Accept ICMP Ping
set firewall ipv4 name video-local rule 50 action 'accept'
set firewall ipv4 name video-local rule 50 description 'Rule: Accept_PING'
set firewall ipv4 name video-local rule 50 protocol 'icmp'
### --- 060-local : Accept MDNS (5353)
set firewall ipv4 name video-local rule 60 action 'accept'
set firewall ipv4 name video-local rule 60 description 'Rule: accept_MDNS'
set firewall ipv4 name video-local rule 60 destination port 'mdns'
set firewall ipv4 name video-local rule 60 protocol 'udp'
set firewall ipv4 name video-local rule 60 source port 'mdns'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name video-local rule 999 action 'drop'
set firewall ipv4 name video-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name video-local rule 999 log
set firewall ipv4 name video-local rule 999 state invalid

# (99) From video to wan
set firewall ipv4 name video-wan default-action 'drop'
set firewall ipv4 name video-wan description 'From video to wan'