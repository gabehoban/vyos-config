#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

set system host-name 'gateway'
set system domain-name 'labrats.cc'

set system ipv6 disable-forwarding

# Authentication
set system login user router authentication public-keys cardno:7762856 key 'AAAAB3NzaC1yc2EAAAADAQABAAACAQCsksLQGzfYW/aF+fo9AXZLJgr1ArgVpztkQvrwL/5gpqxF9HQYIDvtmCxlSxzXBBBW4MQbl9XOhcge0onwaxeqPb/YPjfMDpwN6jekIwQYhhV+ltJCec268j9bMnDLQpefI9OzfwJ/hdhFvA+CHFvQxHNuOH5maOgYU+Vkf0Ch9sYDwp+ROLeAqgi0ky6Zj8hNz+cuWxjL5QN2ErAsvuQJ/ueSdpIThBbUzUHBmiNlR4NI/WZY5mwhWOpkos7Rt3rhiU4hTZ7N39pgBoh07tLSnmdQzFqn3lrK/+pEWrooWiUo4AgEjDN+cg7+T+ECHQoZPBnmlh6CldpOpL3U/I7xz8pwwsH7wGItUwjRlc6lQsHkZ9RO4e6S9RQPHg5PPBTX1UHHoOVJn8Nh/eG1uyQM7Y0PUogpL56u4VHex7LinYO4VrV1TTG9j1RiGHSJqWj4tKgT00YXtgSXMm+fAIs699B6mYWR6ymAPOmSCX+MMM1oAKj/32sFGeulFMNZ9u63DUUx5BIcfGVfl+N3EUNhn7B87bgBPTHoTyYzsB3HNVy7rl0vARsCTdnOBcfnM/oSIF7b8hi9a8A0XgP8ujKjau7pmyWItNafuAawYqlsN75Z9C/QS+SCQwOutIo6MZJwm70BQYt9jGUCFBNV9/wj7/0KhRk8mjFIAIEfb1z8hw=='
set system login user router authentication public-keys cardno:7762856 type 'ssh-rsa'

# Router DNS
set system name-server '1.1.1.1'

# Sysctl
set system sysctl parameter kernel.pty.max value '24000'

# System options
set system option reboot-on-panic

# VyOS Time
set system time-zone 'America/Detroit'

# Fix messages spamming /var/log/messages
delete system console device ttyS0
