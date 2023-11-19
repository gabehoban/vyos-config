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
set firewall ipv4 name local-lan rule 999 log 'enable'
set firewall ipv4 name local-lan rule 999 state invalid 'enable'

# (10) From local to trusted
set firewall ipv4 name local-trusted default-action 'drop'
set firewall ipv4 name local-trusted description 'From local to trusted'
set firewall ipv4 name local-trusted enable-default-log
### --- 999-trusted : Drop Invalid Packets
set firewall ipv4 name local-trusted rule 999 action 'drop'
set firewall ipv4 name local-trusted rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-trusted rule 999 log 'enable'
set firewall ipv4 name local-trusted rule 999 state invalid 'enable'

# (20) From local to guest
set firewall ipv4 name local-guest default-action 'drop'
set firewall ipv4 name local-guest description 'From local to guest'
set firewall ipv4 name local-guest enable-default-log
### --- 999-guest : Drop Invalid Packets
set firewall ipv4 name local-guest rule 999 action 'drop'
set firewall ipv4 name local-guest rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-guest rule 999 log 'enable'
set firewall ipv4 name local-guest rule 999 state invalid 'enable'

# (30) From local to iot
set firewall ipv4 name local-iot default-action 'drop'
set firewall ipv4 name local-iot description 'From local to iot'
set firewall ipv4 name local-iot enable-default-log
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name local-iot rule 999 action 'drop'
set firewall ipv4 name local-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-iot rule 999 log 'enable'
set firewall ipv4 name local-iot rule 999 state invalid 'enable'

# (40) From local to servers
set firewall ipv4 name local-servers default-action 'drop'
set firewall ipv4 name local-servers description 'From local to servers'
set firewall ipv4 name local-servers enable-default-log
### --- 010-servers : Accept NTP Traffic (123)
set firewall ipv4 name local-servers rule 10 action 'accept'
set firewall ipv4 name local-servers rule 10 description 'Rule: Accept_NTP'
set firewall ipv4 name local-servers rule 10 destination port 'ntp'
set firewall ipv4 name local-servers rule 10 protocol 'udp'
### --- 080-servers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name local-servers rule 80 action 'accept'
set firewall ipv4 name local-servers rule 80 description 'Rule: Accept_DNS'
set firewall ipv4 name local-servers rule 80 destination port 'domain,domain-s'
set firewall ipv4 name local-servers rule 80 protocol 'tcp_udp'
### --- 999-servers : Drop Invalid Packets
set firewall ipv4 name local-servers rule 999 action 'drop'
set firewall ipv4 name local-servers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-servers rule 999 log 'enable'
set firewall ipv4 name local-servers rule 999 state invalid 'enable'

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
set firewall ipv4 name local-containers rule 999 log 'enable'
set firewall ipv4 name local-containers rule 999 state invalid 'enable'

# (99) From local to wan
set firewall ipv4 name local-wan default-action 'accept'
set firewall ipv4 name local-wan description 'From local to wan'
