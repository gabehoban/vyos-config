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

# Telegraf Monitoring
set service monitoring telegraf influxdb authentication organization $SECRET_TELEGRAF_ORG
set service monitoring telegraf influxdb authentication token $SECERT_TELEGRAF_TOKEN
set service monitoring telegraf influxdb bucket $SECERT_TELEGRAF_BUCKET
set service monitoring telegraf influxdb port '8086'
set service monitoring telegraf influxdb url $SECRET_TELEGRAF_HOST
set service monitoring telegraf source 'all'

# SSH server
set service ssh disable-password-authentication
set service ssh listen-address '10.32.10.254'
set service ssh port '22'
