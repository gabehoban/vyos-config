#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### guest ------------------------------------------------------------------------------
# (00) From guest to lan
set firewall ipv4 name guest-lan default-action 'drop'
set firewall ipv4 name guest-lan description 'From guest to lan'
set firewall ipv4 name guest-lan default-log
### --- 999-lan : Drop Invalid Packets
set firewall ipv4 name guest-lan rule 999 action 'drop'
set firewall ipv4 name guest-lan rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name guest-lan rule 999 log
set firewall ipv4 name guest-lan rule 999 state invalid

# (20) From guest to trusted
set firewall ipv4 name guest-trusted default-action 'drop'
set firewall ipv4 name guest-trusted description 'From guest to trusted'
set firewall ipv4 name guest-trusted default-log
### --- 999-guest : Drop Invalid Packets
set firewall ipv4 name guest-trusted rule 999 action 'drop'
set firewall ipv4 name guest-trusted rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name guest-trusted rule 999 log
set firewall ipv4 name guest-trusted rule 999 state invalid

# (30) From guest to iot
set firewall ipv4 name guest-iot default-action 'drop'
set firewall ipv4 name guest-iot description 'From guest to iot'
set firewall ipv4 name guest-iot default-log
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name guest-iot rule 999 action 'drop'
set firewall ipv4 name guest-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name guest-iot rule 999 log
set firewall ipv4 name guest-iot rule 999 state invalid

# (40) From guest to servers
set firewall ipv4 name guest-servers default-action 'drop'
set firewall ipv4 name guest-servers description 'From guest to servers'
set firewall ipv4 name guest-servers default-log
### --- 010-servers : Accept NTP Traffic (123)
set firewall ipv4 name guest-servers rule 10 action 'accept'
set firewall ipv4 name guest-servers rule 10 description 'Rule: Accept_NTP'
set firewall ipv4 name guest-servers rule 10 destination port 'ntp'
set firewall ipv4 name guest-servers rule 10 protocol 'udp'
### --- 999-servers : Drop Invalid Packets
set firewall ipv4 name guest-servers rule 999 action 'drop'
set firewall ipv4 name guest-servers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name guest-servers rule 999 log
set firewall ipv4 name guest-servers rule 999 state invalid

# (50) From guest to video
set firewall ipv4 name guest-video default-action 'drop'
set firewall ipv4 name guest-video description 'From guest to video'
set firewall ipv4 name guest-video default-log
### --- 999-video : Drop Invalid Packets
set firewall ipv4 name guest-video rule 999 action 'drop'
set firewall ipv4 name guest-video rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name guest-video rule 999 log
set firewall ipv4 name guest-video rule 999 state invalid

# (95) From guest to containers
set firewall ipv4 name guest-containers default-action 'drop'
set firewall ipv4 name guest-containers description 'From guest to containers'
set firewall ipv4 name guest-containers default-log
### --- 010-containers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name guest-containers rule 10 action 'accept'
set firewall ipv4 name guest-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name guest-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name guest-containers rule 10 protocol 'tcp_udp'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name guest-containers rule 999 action 'drop'
set firewall ipv4 name guest-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name guest-containers rule 999 log
set firewall ipv4 name guest-containers rule 999 state invalid

# (97) From guest to local
set firewall ipv4 name guest-local default-action 'drop'
set firewall ipv4 name guest-local description 'From guest to local'
set firewall ipv4 name guest-local default-log
### --- 010-local : Accept DHCP Traffic (67,68)
set firewall ipv4 name guest-local rule 10 action 'accept'
set firewall ipv4 name guest-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name guest-local rule 10 destination port '67,68'
set firewall ipv4 name guest-local rule 10 protocol 'udp'
set firewall ipv4 name guest-local rule 10 source port '67,68'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name guest-local rule 999 action 'drop'
set firewall ipv4 name guest-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name guest-local rule 999 log
set firewall ipv4 name guest-local rule 999 state invalid

# From guest to wan
set firewall ipv4 name guest-wan default-action 'accept'
set firewall ipv4 name guest-wan description 'From guest to wan'