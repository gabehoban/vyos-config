#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# Container networks
set container network containers description 'Network for containers'
set container network containers prefix '10.40.0.0/24'

# gandi-ddns
set container name gandi-ddns allow-host-networks
set container name gandi-ddns environment GANDI_DOMAIN value 'labrats.cc'
set container name gandi-ddns environment GANDI_PAT value "${SECRET_GANDI_DDNS_KEY}"
set container name gandi-ddns environment GANDI_RECORD value 'ipv4'
set container name gandi-ddns environment PGID value "1000"
set container name gandi-ddns environment PUID value "1000"
set container name gandi-ddns environment TZ value 'America/Detroit'
set container name gandi-ddns image 'gitea.labrats.cc/labrats/gandi-ddns:latest'
set container name gandi-ddns memory '0'
set container name gandi-ddns restart 'on-failure'
set container name gandi-ddns shared-memory '0'

# adguard
set container name adguard cap-add 'net-bind-service'
set container name adguard image 'docker.io/adguard/adguardhome:v0.107.39'
set container name adguard memory '0'
set container name adguard network containers address '10.40.0.5'
set container name adguard restart 'on-failure'
set container name adguard shared-memory '0'
set container name adguard volume config destination '/opt/adguardhome/conf'
set container name adguard volume config mode 'rw'
set container name adguard volume config source '/config/containers/adguard/config'
set container name adguard volume work destination '/opt/adguardhome/work'
set container name adguard volume work mode 'rw'
set container name adguard volume work source '/config/containers/adguard/work'

# dnsdist
set container name dnsdist arguments '--log-timestamps'
set container name dnsdist cap-add 'net-bind-service'
set container name dnsdist environment TZ value 'America/Detroit'
set container name dnsdist image 'docker.io/powerdns/dnsdist-18:1.8.3'
set container name dnsdist memory '0'
set container name dnsdist network containers address '10.40.0.6'
set container name dnsdist restart 'on-failure'
set container name dnsdist shared-memory '0'
set container name dnsdist volume config destination '/etc/dnsdist/dnsdist.conf'
set container name dnsdist volume config mode 'ro'
set container name dnsdist volume config source '/config/containers/dnsdist/config/dnsdist.conf'

# omada
set container name omada-controller environment PGID value '102'
set container name omada-controller environment PUID value '1002'
set container name omada-controller environment TZ value 'America/Detroit'
set container name omada-controller image 'gitea.labrats.cc/labrats/docker-omada-controller:latest'
set container name omada-controller memory '0'
set container name omada-controller network containers address '10.40.0.7'
set container name omada-controller restart 'on-failure'
set container name omada-controller shared-memory '0'
set container name omada-controller volume data destination '/opt/tplink/EAPController/data'
set container name omada-controller volume data mode 'rw'
set container name omada-controller volume data source '/config/containers/omada/data'
set container name omada-controller volume logs destination '/opt/tplink/EAPController/logs'
set container name omada-controller volume logs mode 'rw'
set container name omada-controller volume logs source '/config/containers/omada/logs'
