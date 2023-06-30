#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# General configuration
set firewall state-policy established action 'accept'
set firewall state-policy invalid action 'drop'
set firewall state-policy related action 'accept'

# (40) SERVERS
set firewall group address-group homelab-titan address '10.32.40.10'
set firewall group address-group homelab-hass  address '10.32.40.11'

# (50) IOT
set firewall group address-group jellyfin_clients address '10.32.50.21'

# (95) Containers
set firewall group address-group vyos_blocky  address '10.40.0.4'
set firewall group address-group vyos_coredns address '10.40.0.5'
set firewall group address-group vyos_dnsdist address '10.40.0.6'

# (WG) Wireguard
set firewall group port-group wireguard port '51820'
