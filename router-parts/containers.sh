#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# Container networks
set container network containers description 'Network for containers'
set container network containers prefix '10.40.0.0/24'

# cloudflare-ddns
set container name cloudflare-ddns allow-host-networks
set container name cloudflare-ddns environment CF_API_TOKEN value "${SECRET_CLOUDFLARE_DYNDNS_TOKEN}"
set container name cloudflare-ddns environment DOMAINS value 'ipv4.labrats.cc'
set container name cloudflare-ddns environment IP6_PROVIDER value "none"
set container name cloudflare-ddns environment TZ value 'America/Detroit'
set container name cloudflare-ddns environment PGID value "1000"
set container name cloudflare-ddns environment PUID value "1000"
set container name cloudflare-ddns image 'docker.io/favonia/cloudflare-ddns:1.11.0'
set container name cloudflare-ddns memory '0'
set container name cloudflare-ddns restart 'on-failure'
set container name cloudflare-ddns shared-memory '0'

# bind
set container name bind cap-add 'net-bind-service'
set container name bind image 'docker.io/internetsystemsconsortium/bind9:9.19'
set container name bind command '/usr/sbin/named -4 -f -c /etc/bind/named.conf -u bind'
set container name bind memory '0'
set container name bind network containers address '10.40.0.4'
set container name bind restart 'on-failure'
set container name bind shared-memory '0'
set container name bind volume config destination '/etc/bind'
set container name bind volume config source '/config/containers/bind/config'
set container name bind volume config mode 'ro'
set container name bind volume cache source '/tmp/bind/cache'
set container name bind volume cache destination '/var/cache/bind'
set container name bind volume cache mode 'rw'

# adguard
set container name adguard cap-add 'net-bind-service'
set container name adguard image 'docker.io/adguard/adguardhome:v0.107.43'
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
