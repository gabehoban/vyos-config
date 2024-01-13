#!/bin/vbash

# Blocklist groups
set firewall group network-group vyos_blocklist description 'Blacklisted IPv4 Sources'

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

# Other devices
set firewall group address-group apple-tv address '10.32.30.62'
set firewall group address-group nas address '10.32.40.10'

# Vyos containers addresses
set firewall group address-group vyos_dnsdist address '10.40.0.6'

# Port groups
set firewall group port-group wireguard port '51820'