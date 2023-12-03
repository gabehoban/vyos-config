#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### local ----------------------------------------------------------------------------
# (00) From local to lan
set firewall ipv4 name local-lan default-action 'drop'
set firewall ipv4 name local-lan description 'From local to lan'
set firewall ipv4 name local-lan enable-default-log
### --- 999-lan : Drop Invalid Packets
set firewall ipv4 name local-lan rule 999 action 'drop'
set firewall ipv4 name local-lan rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-lan rule 999 log
set firewall ipv4 name local-lan rule 999 state invalid

# (10) From local to trusted
set firewall ipv4 name local-trusted default-action 'drop'
set firewall ipv4 name local-trusted description 'From local to trusted'
set firewall ipv4 name local-trusted enable-default-log
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
set firewall ipv4 name local-guest enable-default-log
### --- 999-guest : Drop Invalid Packets
set firewall ipv4 name local-guest rule 999 action 'drop'
set firewall ipv4 name local-guest rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-guest rule 999 log
set firewall ipv4 name local-guest rule 999 state invalid

# (30) From local to iot
set firewall ipv4 name local-iot default-action 'drop'
set firewall ipv4 name local-iot description 'From local to iot'
set firewall ipv4 name local-iot enable-default-log
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
set firewall ipv4 name local-servers enable-default-log
### --- 010-servers : Accept NTP Traffic (123)
set firewall ipv4 name local-servers rule 10 action 'accept'
set firewall ipv4 name local-servers rule 10 description 'Rule: Accept_NTP'
set firewall ipv4 name local-servers rule 10 destination port 'ntp'
set firewall ipv4 name local-servers rule 10 protocol 'udp'
### --- 030-servers : Accept HTTP Traffic (80)
set firewall ipv4 name local-servers rule 30 action 'accept'
set firewall ipv4 name local-servers rule 30 description 'Rule: Accept_HTTP'
set firewall ipv4 name local-servers rule 30 destination port '80'
set firewall ipv4 name local-servers rule 30 protocol 'tcp'
### --- 040-servers : Accept HTTPS Traffic (443)
set firewall ipv4 name local-servers rule 40 action 'accept'
set firewall ipv4 name local-servers rule 40 description 'Rule: Accept_HTTPS'
set firewall ipv4 name local-servers rule 40 destination port '443'
set firewall ipv4 name local-servers rule 40 protocol 'tcp'
### --- 080-servers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name local-servers rule 80 action 'accept'
set firewall ipv4 name local-servers rule 80 description 'Rule: Accept_DNS'
set firewall ipv4 name local-servers rule 80 destination port 'domain,domain-s'
set firewall ipv4 name local-servers rule 80 protocol 'tcp_udp'
### --- 090-servers : Accept DNS Traffic (5053)
set firewall ipv4 name local-servers rule 90 action 'accept'
set firewall ipv4 name local-servers rule 90 description 'Rule: Accept_DNS'
set firewall ipv4 name local-servers rule 90 destination port '5053'
set firewall ipv4 name local-servers rule 90 protocol 'tcp_udp'
### --- 100-servers : Accept InfluxDB Traffic (8086)
set firewall ipv4 name local-servers rule 100 action 'accept'
set firewall ipv4 name local-servers rule 100 description 'Rule: Accept_INFLUX'
set firewall ipv4 name local-servers rule 100 destination port '8086'
set firewall ipv4 name local-servers rule 100 protocol 'tcp_udp'
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
