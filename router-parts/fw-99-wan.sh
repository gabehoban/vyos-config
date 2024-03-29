#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### wan --------------------------------------------------------------------------------
# (00) From wan to lan
set firewall ipv4 name wan-lan default-action 'drop'
set firewall ipv4 name wan-lan description 'From wan to lan'
set firewall ipv4 name wan-lan default-log
### --- 999-lan : Drop Invalid Packets
set firewall ipv4 name wan-lan rule 999 action 'drop'
set firewall ipv4 name wan-lan rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-lan rule 999 log
set firewall ipv4 name wan-lan rule 999 state invalid

# (10) From wan to trusted
set firewall ipv4 name wan-trusted default-action 'drop'
set firewall ipv4 name wan-trusted description 'From wan to trusted'
set firewall ipv4 name wan-trusted default-log
### --- 999-trusted : Drop Invalid Packets
set firewall ipv4 name wan-trusted rule 999 action 'drop'
set firewall ipv4 name wan-trusted rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-trusted rule 999 log
set firewall ipv4 name wan-trusted rule 999 state invalid

# (20) From wan to guest
set firewall ipv4 name wan-guest default-action 'drop'
set firewall ipv4 name wan-guest description 'From wan to guest'
set firewall ipv4 name wan-guest default-log
### --- 999-guest : Drop Invalid Packets
set firewall ipv4 name wan-guest rule 999 action 'drop'
set firewall ipv4 name wan-guest rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-guest rule 999 log
set firewall ipv4 name wan-guest rule 999 state invalid

# (30) From wan to iot
set firewall ipv4 name wan-iot default-action 'drop'
set firewall ipv4 name wan-iot description 'From wan to iot'
set firewall ipv4 name wan-iot default-log
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name wan-iot rule 999 action 'drop'
set firewall ipv4 name wan-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-iot rule 999 log
set firewall ipv4 name wan-iot rule 999 state invalid

# (40) From wan to servers
set firewall ipv4 name wan-servers default-action 'drop'
set firewall ipv4 name wan-servers description 'From wan to servers'
set firewall ipv4 name wan-servers default-log
### --- 999-servers : Drop Invalid Packets
set firewall ipv4 name wan-servers rule 999 action 'drop'
set firewall ipv4 name wan-servers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-servers rule 999 log
set firewall ipv4 name wan-servers rule 999 state invalid

# (50) From wan to video
set firewall ipv4 name wan-video default-action 'drop'
set firewall ipv4 name wan-video description 'From wan to video'
set firewall ipv4 name wan-video default-log
### --- 999-video : Drop Invalid Packets
set firewall ipv4 name wan-video rule 999 action 'drop'
set firewall ipv4 name wan-video rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-video rule 999 log
set firewall ipv4 name wan-video rule 999 state invalid


# (95) From wan to containers
set firewall ipv4 name wan-containers default-action 'drop'
set firewall ipv4 name wan-containers description 'From wan to containers'
set firewall ipv4 name wan-containers default-log
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name wan-containers rule 999 action 'drop'
set firewall ipv4 name wan-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-containers rule 999 log
set firewall ipv4 name wan-containers rule 999 state invalid

# (97) From wan to local
set firewall ipv4 name wan-local default-action 'drop'
set firewall ipv4 name wan-local description 'From wan to local'
### --- 030-local : Accept WIREGUARD Traffic (51820)
set firewall ipv4 name wan-local rule 30 action 'accept'
set firewall ipv4 name wan-local rule 30 description 'Rule: Accept_wireguard'
set firewall ipv4 name wan-local rule 30 destination port '51820'
set firewall ipv4 name wan-local rule 30 protocol 'udp'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name wan-local rule 999 action 'drop'
set firewall ipv4 name wan-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-local rule 999 log
set firewall ipv4 name wan-local rule 999 state invalid
