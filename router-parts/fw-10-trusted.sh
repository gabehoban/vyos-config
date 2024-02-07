#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### trusted ----------------------------------------------------------------------------
# (00) From trusted to lan
set firewall ipv4 name trusted-lan default-action 'accept'
set firewall ipv4 name trusted-lan description 'From trusted to lan'
### --- 999-lan : Drop Invalid Packets
set firewall ipv4 name trusted-lan rule 999 action 'drop'
set firewall ipv4 name trusted-lan rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name trusted-lan rule 999 log
set firewall ipv4 name trusted-lan rule 999 state invalid

# (20) From trusted to guest
set firewall ipv4 name trusted-guest default-action 'drop'
set firewall ipv4 name trusted-guest description 'From trusted to guest'
set firewall ipv4 name trusted-guest default-log
### --- 999-guest : Drop Invalid Packets
set firewall ipv4 name trusted-guest rule 999 action 'drop'
set firewall ipv4 name trusted-guest rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name trusted-guest rule 999 log
set firewall ipv4 name trusted-guest rule 999 state invalid

# (30) From trusted to iot
set firewall ipv4 name trusted-iot default-action 'accept'
set firewall ipv4 name trusted-iot description 'From trusted to iot'
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name trusted-iot rule 999 action 'drop'
set firewall ipv4 name trusted-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name trusted-iot rule 999 log
set firewall ipv4 name trusted-iot rule 999 state invalid

# (40) From trusted to servers
set firewall ipv4 name trusted-servers default-action 'accept'
set firewall ipv4 name trusted-servers description 'From trusted to servers'
### --- 999-servers : Drop Invalid Packets
set firewall ipv4 name trusted-servers rule 999 action 'drop'
set firewall ipv4 name trusted-servers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name trusted-servers rule 999 state invalid
set firewall ipv4 name trusted-servers rule 999 log

# (50) From trusted to video
set firewall ipv4 name trusted-video default-action 'drop'
set firewall ipv4 name trusted-video description 'From trusted to video'
set firewall ipv4 name trusted-video default-log
### --- 999-video : Drop Invalid Packets
set firewall ipv4 name trusted-video rule 999 action 'drop'
set firewall ipv4 name trusted-video rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name trusted-video rule 999 log
set firewall ipv4 name trusted-video rule 999 state invalid

# (95) From trusted to containers
set firewall ipv4 name trusted-containers default-action 'accept'
set firewall ipv4 name trusted-containers description 'From trusted to containers'
### --- 010-containers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name trusted-containers rule 10 action 'accept'
set firewall ipv4 name trusted-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name trusted-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name trusted-containers rule 10 protocol 'tcp_udp'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name trusted-containers rule 999 action 'drop'
set firewall ipv4 name trusted-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name trusted-containers rule 999 log
set firewall ipv4 name trusted-containers rule 999 state invalid

# (97) From trusted to local
set firewall ipv4 name trusted-local default-action 'drop'
set firewall ipv4 name trusted-local description 'From trusted to local'
set firewall ipv4 name trusted-local default-log
### --- 010-local : Accept DHCP Traffic (67,68)
set firewall ipv4 name trusted-local rule 10 action 'accept'
set firewall ipv4 name trusted-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name trusted-local rule 10 destination port '67,68'
set firewall ipv4 name trusted-local rule 10 protocol 'udp'
set firewall ipv4 name trusted-local rule 10 source port '67,68'
### --- 020-local : Accept NTP Traffic (123)
set firewall ipv4 name trusted-local rule 20 action 'accept'
set firewall ipv4 name trusted-local rule 20 description 'Rule: Accept_NTP'
set firewall ipv4 name trusted-local rule 20 destination port 'ntp'
set firewall ipv4 name trusted-local rule 20 protocol 'udp'
### --- 030-local : Accept SSH Traffic (22)
set firewall ipv4 name trusted-local rule 30 action 'accept'
set firewall ipv4 name trusted-local rule 30 description 'Rule: Accept_SSH'
set firewall ipv4 name trusted-local rule 30 destination port 'ssh'
set firewall ipv4 name trusted-local rule 30 protocol 'tcp'
### --- 060-local : Accept MDNS (5353)
set firewall ipv4 name trusted-local rule 60 action 'accept'
set firewall ipv4 name trusted-local rule 60 description 'Rule: accept_MDNS'
set firewall ipv4 name trusted-local rule 60 destination port 'mdns'
set firewall ipv4 name trusted-local rule 60 protocol 'udp'
set firewall ipv4 name trusted-local rule 60 source port 'mdns'
### --- 901-local : Drop Spam Plex Traffic (32412)
set firewall ipv4 name trusted-local rule 901 action 'drop'
set firewall ipv4 name trusted-local rule 901 description 'Rule: Drop_Plex_Ports'
set firewall ipv4 name trusted-local rule 901 destination port '32412'
set firewall ipv4 name trusted-local rule 901 protocol 'udp'
### --- 902-local : Drop Spam Plex Traffic (32414)
set firewall ipv4 name trusted-local rule 902 action 'drop'
set firewall ipv4 name trusted-local rule 902 description 'Rule: Drop_Plex_Ports'
set firewall ipv4 name trusted-local rule 902 destination port '32414'
set firewall ipv4 name trusted-local rule 902 protocol 'udp'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name trusted-local rule 999 action 'drop'
set firewall ipv4 name trusted-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name trusted-local rule 999 log
set firewall ipv4 name trusted-local rule 999 state invalid

# From trusted to wan
set firewall ipv4 name trusted-wan default-action 'accept'
set firewall ipv4 name trusted-wan description 'From trusted to wan'
