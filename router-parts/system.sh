#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

set system host-name 'gateway'
set system domain-name 'labrats.cc'

set system ipv6 disable-forwarding

# Authentication
set system login user router authentication public-keys cardno:7762856 key 'AAAAB3NzaC1yc2EAAAADAQABAAACAQCsksLQGzfYW/aF+fo9AXZLJgr1ArgVpztkQvrwL/5gpqxF9HQYIDvtmCxlSxzXBBBW4MQbl9XOhcge0onwaxeqPb/YPjfMDpwN6jekIwQYhhV+ltJCec268j9bMnDLQpefI9OzfwJ/hdhFvA+CHFvQxHNuOH5maOgYU+Vkf0Ch9sYDwp+ROLeAqgi0ky6Zj8hNz+cuWxjL5QN2ErAsvuQJ/ueSdpIThBbUzUHBmiNlR4NI/WZY5mwhWOpkos7Rt3rhiU4hTZ7N39pgBoh07tLSnmdQzFqn3lrK/+pEWrooWiUo4AgEjDN+cg7+T+ECHQoZPBnmlh6CldpOpL3U/I7xz8pwwsH7wGItUwjRlc6lQsHkZ9RO4e6S9RQPHg5PPBTX1UHHoOVJn8Nh/eG1uyQM7Y0PUogpL56u4VHex7LinYO4VrV1TTG9j1RiGHSJqWj4tKgT00YXtgSXMm+fAIs699B6mYWR6ymAPOmSCX+MMM1oAKj/32sFGeulFMNZ9u63DUUx5BIcfGVfl+N3EUNhn7B87bgBPTHoTyYzsB3HNVy7rl0vARsCTdnOBcfnM/oSIF7b8hi9a8A0XgP8ujKjau7pmyWItNafuAawYqlsN75Z9C/QS+SCQwOutIo6MZJwm70BQYt9jGUCFBNV9/wj7/0KhRk8mjFIAIEfb1z8hw=='
set system login user router authentication public-keys cardno:7762856 type 'ssh-rsa'
set system login user router authentication public-keys cardno:17_077_465 key 'AAAAB3NzaC1yc2EAAAADAQABAAACAQCqFRwe/auSdigp5l+XmgIABl8rIIFuwBh9I2WNRpIfYKYJRyKkLbYZO3Z56lCxqjJkTUIIdw+hsUvR3A71HVRnRlx05pMQ9IMn6XSrx+AQVXs/hBFNijQsmCVUMebop2kW1WZUfIgMg4+5L9VQPL+pX6ARKuXSf8Gv2Qn+rInpY1rYE9DesezjzA2Cljr3Pii1JlmqYDDLS2HnZ10FhJfutqWPUR9RnX4HcVXKcxE9rgHzjGSyNkaFVX2HG8SafePyABacoajNQVORn7PHD9RLUeQ+qM8IIvAVxig2JPt36AnWjakSumwgyf/NjrbjJTMlacN3zqresfcsa3+HdGki86QRbZ2bNRurrBbevxxzgQggjW0506drw49sN/y78BGuYjZJjQW3C7TPHaLpPBKMIEFz64vuwATZiLpSb/mfGqXvpXb9Yl91qYbOy6GdXOO54EMb4zM6pQn1n3h6uaneJ/ZjM2GarbcGE5d/Nxw3AsS7gVUBAXrkbHdmJnXzoZWKO1DGjx7fGnHHvyKZN997BEzGpTMIRbF7g2S0RLVVjVYmLJNpCPGxkWACeJN+CXYof/Yl1adeCmQVLagtO8HwsBQLRO2CJwveUwnNRK3WVOOM8DK+u5ROgg1XJO7ngXnP3HKql6ju0kYRpwlRj/dZNrsJh7tYDgXr/9B8I/9Q4w=='
set system login user router authentication public-keys cardno:17_077_465 type 'ssh-rsa'

# Router DNS
set system name-server '10.40.0.6'
set system name-server '1.1.1.1'

# Sysctl
set system sysctl parameter kernel.pty.max value '24000'

# Logging
set system syslog global facility all level info
set system syslog host 10.32.40.10 facility kern level 'warning'
set system syslog host 10.32.40.10 protocol 'tcp'
set system syslog host 10.32.40.10 port '6001'
set system syslog host 10.32.40.10 format 'octet-counted'

# System options
set system option reboot-on-panic

# VyOS Time
set system time-zone 'America/Detroit'

# Fix messages spamming /var/log/messages
delete system console device ttyS0
