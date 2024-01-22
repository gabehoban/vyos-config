#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### servers ----------------------------------------------------------------------------
# (00) From servers to lan
set firewall ipv4 name servers-lan default-action 'drop'
set firewall ipv4 name servers-lan description 'From servers to lan'
set firewall ipv4 name servers-lan default-log
### --- 999-lan : Drop Invalid Packets
set firewall ipv4 name servers-lan rule 999 action 'drop'
set firewall ipv4 name servers-lan rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name servers-lan rule 999 log
set firewall ipv4 name servers-lan rule 999 state invalid

# (10) From servers to trusted
set firewall ipv4 name servers-trusted default-action 'drop'
set firewall ipv4 name servers-trusted description 'From servers to trusted'
set firewall ipv4 name servers-trusted default-log
### --- 010-trusted : Accept Ping (ICMP)
set firewall ipv4 name servers-trusted rule 10 action 'accept'
set firewall ipv4 name servers-trusted rule 10 description 'Rule: Accept_ICMP'
set firewall ipv4 name servers-trusted rule 10 protocol 'icmp'
### --- 999-trusted : Drop Invalid Packets
set firewall ipv4 name servers-trusted rule 999 action 'drop'
set firewall ipv4 name servers-trusted rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name servers-trusted rule 999 log
set firewall ipv4 name servers-trusted rule 999 state invalid

# (20) From servers to guest
set firewall ipv4 name servers-guest default-action 'drop'
set firewall ipv4 name servers-guest description 'From servers to guest'
set firewall ipv4 name servers-guest default-log
### --- 999-guest : Drop Invalid Packets
set firewall ipv4 name servers-guest rule 999 action 'drop'
set firewall ipv4 name servers-guest rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name servers-guest rule 999 log
set firewall ipv4 name servers-guest rule 999 state invalid

# (30) From servers to iot
set firewall ipv4 name servers-iot default-action 'accept'
set firewall ipv4 name servers-iot description 'From servers to iot'
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name servers-iot rule 999 action 'drop'
set firewall ipv4 name servers-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name servers-iot rule 999 log
set firewall ipv4 name servers-iot rule 999 state invalid

# (50) From servers to video
set firewall ipv4 name servers-video default-action 'drop'
set firewall ipv4 name servers-video description 'From servers to video'
set firewall ipv4 name servers-video default-log
### --- 010-video : Accept RTSP Traffic (rtsp)
set firewall ipv4 name servers-video rule 10 action 'accept'
set firewall ipv4 name servers-video rule 10 description 'Rule: Accept_RTSP'
set firewall ipv4 name servers-video rule 10 destination port 'rtsp'
set firewall ipv4 name servers-video rule 10 protocol 'tcp_udp'
### --- 999-video : Drop Invalid Packets
set firewall ipv4 name servers-video rule 999 action 'drop'
set firewall ipv4 name servers-video rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name servers-video rule 999 log
set firewall ipv4 name servers-video rule 999 state invalid

# (95) From servers to containers
set firewall ipv4 name servers-containers default-action 'accept'
set firewall ipv4 name servers-containers description 'From servers to containers'
### --- 010-containers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name servers-containers rule 10 action 'accept'
set firewall ipv4 name servers-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name servers-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name servers-containers rule 10 protocol 'tcp_udp'
### --- 020-containers : Accept Omada Traffic (src-dst)
set firewall ipv4 name servers-containers rule 20 action 'accept'
set firewall ipv4 name servers-containers rule 20 description 'Rule: Accept_Omada'
set firewall ipv4 name servers-containers rule 20 destination group address-group controller_omada
set firewall ipv4 name servers-containers rule 20 protocol 'tcp_udp'
set firewall ipv4 name servers-containers rule 20 source group address-group omada_portal
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name servers-containers rule 999 action 'drop'
set firewall ipv4 name servers-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name servers-containers rule 999 log
set firewall ipv4 name servers-containers rule 999 state invalid

# (97) From servers to local
set firewall ipv4 name servers-local default-action 'drop'
set firewall ipv4 name servers-local description 'From servers to local'
set firewall ipv4 name servers-local default-log
### --- 010-local : Accept DHCP Traffic (67,68)
set firewall ipv4 name servers-local rule 10 action 'accept'
set firewall ipv4 name servers-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name servers-local rule 10 destination port '67,68'
set firewall ipv4 name servers-local rule 10 protocol 'udp'
set firewall ipv4 name servers-local rule 10 source port '67,68'
### --- 020-local : Accept NTP Traffic (123)
set firewall ipv4 name servers-local rule 20 action 'accept'
set firewall ipv4 name servers-local rule 20 description 'Rule: Accept_NTP'
set firewall ipv4 name servers-local rule 20 destination port 'ntp'
set firewall ipv4 name servers-local rule 20 protocol 'udp'
### --- 050-local : Accept ICMP Ping
set firewall ipv4 name servers-local rule 50 action 'accept'
set firewall ipv4 name servers-local rule 50 description 'Rule: Accept_PING'
set firewall ipv4 name servers-local rule 50 protocol 'icmp'
### --- 060-local : Accept MDNS (5353)
set firewall ipv4 name servers-local rule 60 action 'accept'
set firewall ipv4 name servers-local rule 60 description 'Rule: accept_MDNS'
set firewall ipv4 name servers-local rule 60 destination port 'mdns'
set firewall ipv4 name servers-local rule 60 protocol 'udp'
set firewall ipv4 name servers-local rule 60 source port 'mdns'
### --- 901-local : Drop SMB NetBIOS Traffic (138)
set firewall ipv4 name servers-local rule 901 action 'drop'
set firewall ipv4 name servers-local rule 901 description 'Rule: Drop_SMB_NetBIOS'
set firewall ipv4 name servers-local rule 901 destination port '138'
set firewall ipv4 name servers-local rule 901 protocol 'udp'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name servers-local rule 999 action 'drop'
set firewall ipv4 name servers-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name servers-local rule 999 log
set firewall ipv4 name servers-local rule 999 state invalid

# (99) From servers to wan
set firewall ipv4 name servers-wan default-action 'accept'
set firewall ipv4 name servers-wan description 'From servers to wan'