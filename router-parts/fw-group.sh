#!/bin/vbash

# Blocklist groups
set firewall group network-group vyos_blocklist description 'Blacklisted IPv4 Sources'

# Interface groups
set firewall group interface-group IG_wan interface 'eth2'
set firewall group interface-group IG_lan interface 'eth0'
set firewall group interface-group IG_trusted interface 'eth0.10'
set firewall group interface-group IG_trusted interface 'wg01'
set firewall group interface-group IG_guest interface 'eth0.20'
set firewall group interface-group IG_iot interface 'eth0.30' 
set firewall group interface-group IG_servers interface 'eth0.40'
set firewall group interface-group IG_containers interface 'pod-containers'

# Router (VyOS itself)
set firewall group address-group router-addresses address '10.32.0.254'
set firewall group address-group router-addresses address '127.0.0.1'
set firewall group ipv6-address-group router-addresses-ipv6 address 'fe80::223:24ff:fec2:f307'
set firewall group ipv6-address-group router-addresses-ipv6 address '::1'

# TP-Link Omada
set firewall group address-group controller_omada address '10.40.0.7'
set firewall group address-group omada_portal address '10.32.10.21'
set firewall group address-group omada_portal address '10.32.40.23'
set firewall group address-group omada_clients address '10.32.0.21'
set firewall group address-group omada_clients address '10.32.0.22'

# MQTT Devices
set firewall group address-group controller_mqtt address '10.32.40.23'
set firewall group address-group mqtt_clients address '10.32.30.41'
set firewall group address-group mqtt_clients address '10.32.30.42'
set firewall group address-group mqtt_clients address '10.32.30.43'

# IOT HTTPS Devices
set firewall group address-group iot_http_clients address '10.32.30.41'
set firewall group address-group iot_http_clients address '10.32.30.42'
set firewall group address-group iot_http_clients address '10.32.30.43'

# Media Server Clients (IOT)
set firewall group address-group jellyfin_clients address '10.32.30.62'

# Storage devices
set firewall group address-group nas address '10.32.40.10'

# Vyos containers addresses
set firewall group address-group vyos_dnsdist address '10.40.0.6'

# Port groups
set firewall group port-group wireguard port '51820'