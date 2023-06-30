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
set service ntp server time.nist.gov

# SSH server
set service ssh disable-password-authentication
set service ssh port '22'

# SNMP Service
set service snmp listen-address 10.32.40.254
set service snmp location 'VyOS Router'
set service snmp v3 engineid '000000000000000000004441'
set service snmp v3 view default oid 1
set service snmp v3 group default mode 'ro'
set service snmp v3 group default view 'default'
set service snmp v3 user elastiflow auth plaintext-password ${SECRET_SNMP_PASS}
set service snmp v3 user elastiflow auth type 'sha'
set service snmp v3 user elastiflow group 'default'
set service snmp v3 user elastiflow privacy plaintext-password ${SECRET_SNMP_PASS}
set service snmp v3 user elastiflow privacy type 'aes'
