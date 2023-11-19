#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# NTP Service
delete service ntp allow-client
set service ntp allow-client address '127.0.0.0/8'
set service ntp allow-client address '10.0.0.0/8'
set service ntp allow-client address '172.16.0.0/12'
set service ntp allow-client address '192.168.0.0/16'
delete service ntp server
set service ntp server 10.32.40.51
set service ntp server 10.32.40.52

# SNMP Monitoring
set service snmp community public authorization ro
set service snmp community public network 10.32.40.0/24
set service snmp location "Data Center"
set service snmp contact "sysadmin@labrats.cc"
set service snmp listen-address 10.32.40.254 port 161

# SSH server
set service ssh disable-password-authentication
set service ssh listen-address '10.32.10.254'
set service ssh port '22'
