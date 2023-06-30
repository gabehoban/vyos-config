#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

set system domain-name 'labrats.cc'
set system host-name 'gateway'
set system login banner post-login 'Welcome to gateway.labrats.cc'

# Disable ipv6 forwarding
set system ipv6 disable-forwarding

# Authentication
set system login user router authentication public-keys cardno:7762856 key 'AAAAB3NzaC1yc2EAAAADAQABAAACAQCsksLQGzfYW/aF+fo9AXZLJgr1ArgVpztkQvrwL/5gpqxF9HQYIDvtmCxlSxzXBBBW4MQbl9XOhcge0onwaxeqPb/YPjfMDpwN6jekIwQYhhV+ltJCec268j9bMnDLQpefI9OzfwJ/hdhFvA+CHFvQxHNuOH5maOgYU+Vkf0Ch9sYDwp+ROLeAqgi0ky6Zj8hNz+cuWxjL5QN2ErAsvuQJ/ueSdpIThBbUzUHBmiNlR4NI/WZY5mwhWOpkos7Rt3rhiU4hTZ7N39pgBoh07tLSnmdQzFqn3lrK/+pEWrooWiUo4AgEjDN+cg7+T+ECHQoZPBnmlh6CldpOpL3U/I7xz8pwwsH7wGItUwjRlc6lQsHkZ9RO4e6S9RQPHg5PPBTX1UHHoOVJn8Nh/eG1uyQM7Y0PUogpL56u4VHex7LinYO4VrV1TTG9j1RiGHSJqWj4tKgT00YXtgSXMm+fAIs699B6mYWR6ymAPOmSCX+MMM1oAKj/32sFGeulFMNZ9u63DUUx5BIcfGVfl+N3EUNhn7B87bgBPTHoTyYzsB3HNVy7rl0vARsCTdnOBcfnM/oSIF7b8hi9a8A0XgP8ujKjau7pmyWItNafuAawYqlsN75Z9C/QS+SCQwOutIo6MZJwm70BQYt9jGUCFBNV9/wj7/0KhRk8mjFIAIEfb1z8hw=='
set system login user router authentication public-keys cardno:7762856 type 'ssh-rsa'

# Router DNS
set system name-server '1.1.1.1'

# System options
set system option reboot-on-panic

# Logging
set system logs logrotate messages

# Sysctl
set system sysctl parameter kernel.pty.max value '24000'

# Syslog
# set system syslog host 10.32.40.10 facility kern level 'info'
# set system syslog host 10.32.40.10 protocol 'udp'
# set system syslog host 10.32.40.10 port '1514'
# set system syslog host 10.32.40.10 format octet-counted

set system sflow interface eth0.10
set system sflow interface eth0.20
set system sflow interface eth0.30
set system sflow interface eth0.40
set system sflow interface eth0.50
set system sflow interface eth0.70
set system sflow interface eth2
set system sflow polling 30
set system sflow sampling-rate 1000
set system sflow server 10.32.40.10 port 9995

# VyOS Time
set system time-zone 'America/New_York'

# Fix messages spamming /var/log/messages
delete system console device ttyS0
