#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### iot ----------------------------------------------------------------------------
# (00) From iot to lan
set firewall ipv4 name iot-lan default-action 'drop'
set firewall ipv4 name iot-lan description 'From iot to lan'
set firewall ipv4 name iot-lan default-log
### --- 999-lan : Drop Invalid Packets
set firewall ipv4 name iot-lan rule 999 action 'drop'
set firewall ipv4 name iot-lan rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-lan rule 999 log
set firewall ipv4 name iot-lan rule 999 state invalid

# (10) From iot to trusted
set firewall ipv4 name iot-trusted default-action 'drop'
set firewall ipv4 name iot-trusted description 'From iot to trusted'
set firewall ipv4 name iot-trusted default-log
### --- 999-trusted : Drop Invalid Packets
set firewall ipv4 name iot-trusted rule 999 action 'drop'
set firewall ipv4 name iot-trusted rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-trusted rule 999 log
set firewall ipv4 name iot-trusted rule 999 state invalid

# (20) From iot to guest
set firewall ipv4 name iot-guest default-action 'drop'
set firewall ipv4 name iot-guest description 'From iot to guest'
set firewall ipv4 name iot-guest default-log
### --- 999-guest : Drop Invalid Packets
set firewall ipv4 name iot-guest rule 999 action 'drop'
set firewall ipv4 name iot-guest rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-guest rule 999 log
set firewall ipv4 name iot-guest rule 999 state invalid

# (40) From iot to servers
set firewall ipv4 name iot-servers default-action 'drop'
set firewall ipv4 name iot-servers description 'From iot to servers'
set firewall ipv4 name iot-servers default-log
### --- 040-servers : Accept HTTPS Traffic (443)
set firewall ipv4 name iot-servers rule 40 action 'accept'
set firewall ipv4 name iot-servers rule 40 description 'Rule: Accept_HTTPS'
set firewall ipv4 name iot-servers rule 40 destination port '443'
set firewall ipv4 name iot-servers rule 40 protocol 'tcp'
### --- 070-servers : Accept MQTT Traffic (1883)
set firewall ipv4 name iot-servers rule 70 action 'accept'
set firewall ipv4 name iot-servers rule 70 description 'Rule: Accept_mqtt_from_mqtt_clients'
set firewall ipv4 name iot-servers rule 70 destination group address-group 'controller_mqtt'
set firewall ipv4 name iot-servers rule 70 destination port '1883'
set firewall ipv4 name iot-servers rule 70 protocol 'tcp'
set firewall ipv4 name iot-servers rule 70 source group address-group 'mqtt_clients'
### --- 120-servers : Accept Jellyfin Traffic (30013) (JellyfinClients->NAS)
set firewall ipv4 name iot-servers rule 120 action 'accept'
set firewall ipv4 name iot-servers rule 120 description 'Rule: Accept_Jellyfin'
set firewall ipv4 name iot-servers rule 120 destination group address-group 'nas'
set firewall ipv4 name iot-servers rule 120 destination port '30013'
set firewall ipv4 name iot-servers rule 120 protocol 'tcp'
set firewall ipv4 name iot-servers rule 120 source group address-group 'jellyfin_clients'
### --- 999-servers : Drop Invalid Packets
set firewall ipv4 name iot-servers rule 999 action 'drop'
set firewall ipv4 name iot-servers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-servers rule 999 log
set firewall ipv4 name iot-servers rule 999 state invalid

# (95) From iot to containers
set firewall ipv4 name iot-containers default-action 'accept'
set firewall ipv4 name iot-containers description 'From iot to containers'
### --- 010-containers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name iot-containers rule 40 action 'accept'
set firewall ipv4 name iot-containers rule 40 description 'Rule: Accept_DNS'
set firewall ipv4 name iot-containers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name iot-containers rule 40 protocol 'tcp_udp'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name iot-containers rule 999 action 'drop'
set firewall ipv4 name iot-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-containers rule 999 log
set firewall ipv4 name iot-containers rule 999 state invalid

# (97) From iot to local
set firewall ipv4 name iot-local default-action 'drop'
set firewall ipv4 name iot-local description 'From iot to local'
set firewall ipv4 name iot-local default-log
### --- 010-local : Accept DHCP Traffic (67,68)
set firewall ipv4 name iot-local rule 10 action 'accept'
set firewall ipv4 name iot-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name iot-local rule 10 destination port '67,68'
set firewall ipv4 name iot-local rule 10 protocol 'udp'
set firewall ipv4 name iot-local rule 10 source port '67,68'
### --- 020-local : Accept NTP Traffic (123)
set firewall ipv4 name iot-local rule 20 action 'accept'
set firewall ipv4 name iot-local rule 20 description 'Rule: Accept_NTP'
set firewall ipv4 name iot-local rule 20 destination port 'ntp'
set firewall ipv4 name iot-local rule 20 protocol 'udp'
### --- 030-local : Accept SSH Traffic (22)
set firewall ipv4 name iot-local rule 30 action 'accept'
set firewall ipv4 name iot-local rule 30 description 'Rule: Accept_MDNS'
set firewall ipv4 name iot-local rule 30 destination port 'mdns'
set firewall ipv4 name iot-local rule 30 protocol 'udp'
set firewall ipv4 name iot-local rule 30 source port 'mdns'
### --- 050-local : Accept Ping (ICMP)
set firewall ipv4 name iot-local rule 50 action 'accept'
set firewall ipv4 name iot-local rule 50 description 'Rule: Accept_PING'
set firewall ipv4 name iot-local rule 50 protocol 'icmp'
### --- 060-local : Accept MDNS (5353)
set firewall ipv4 name iot-local rule 60 action 'accept'
set firewall ipv4 name iot-local rule 60 description 'Rule: accept_MDNS'
set firewall ipv4 name iot-local rule 60 destination port 'mdns'
set firewall ipv4 name iot-local rule 60 protocol 'udp'
set firewall ipv4 name iot-local rule 60 source port 'mdns'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name iot-local rule 999 action 'drop'
set firewall ipv4 name iot-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-local rule 999 log
set firewall ipv4 name iot-local rule 999 state invalid

# (99) From iot to wan
set firewall ipv4 name iot-wan default-action 'accept'
set firewall ipv4 name iot-wan description 'From iot to wan'