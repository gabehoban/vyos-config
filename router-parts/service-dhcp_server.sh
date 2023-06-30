#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# (10) Trusted Network
set service dhcp-server shared-network-name TRUSTED authoritative
set service dhcp-server shared-network-name TRUSTED ping-check
set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 default-router '10.32.10.254'
set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 domain-name 'labrats.cc'
set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 lease '86400'
set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 name-server '10.40.0.6'
set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 range 0 start '10.32.10.200'
set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 range 0 stop '10.32.10.250'
set service dhcp-server shared-network-name TRUSTED ntp-server 10.32.10.254

set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 static-mapping baymax ip-address '10.32.10.21'
set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 static-mapping baymax mac-address 'a8:a1:59:93:ac:72'
set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 static-mapping gabes-iphone ip-address '10.32.10.22'
set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 static-mapping gabes-iphone mac-address '54:eb:e9:60:19:b4'
set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 static-mapping gabes-macbook ip-address '10.32.10.23'
set service dhcp-server shared-network-name TRUSTED subnet 10.32.10.0/24 static-mapping gabes-macbook mac-address 'f4:d4:88:5c:31:8f'

# (20) Guest Network
set service dhcp-server shared-network-name GUEST authoritative
set service dhcp-server shared-network-name GUEST ping-check
set service dhcp-server shared-network-name GUEST subnet 10.32.20.0/24 default-router '10.32.20.254'
set service dhcp-server shared-network-name GUEST subnet 10.32.20.0/24 lease '86400'
set service dhcp-server shared-network-name GUEST subnet 10.32.20.0/24 name-server '10.40.0.6'
set service dhcp-server shared-network-name GUEST subnet 10.32.20.0/24 range 0 start '10.32.20.200'
set service dhcp-server shared-network-name GUEST subnet 10.32.20.0/24 range 0 stop '10.32.20.250'
set service dhcp-server shared-network-name GUEST ntp-server 10.32.20.254

set service dhcp-server shared-network-name GUEST subnet 10.32.20.0/24 static-mapping work-laptop ip-address '10.32.20.21'
set service dhcp-server shared-network-name GUEST subnet 10.32.20.0/24 static-mapping work-laptop mac-address '30:24:a9:a7:b8:66'

# (30) Security Network
set service dhcp-server shared-network-name SECURITY authoritative
set service dhcp-server shared-network-name SECURITY ping-check
set service dhcp-server shared-network-name SECURITY subnet 10.32.30.0/24 default-router '10.32.30.254'
set service dhcp-server shared-network-name SECURITY subnet 10.32.30.0/24 lease '86400'
set service dhcp-server shared-network-name SECURITY subnet 10.32.30.0/24 name-server '10.40.0.6'
set service dhcp-server shared-network-name SECURITY subnet 10.32.30.0/24 range 0 start '10.32.30.200'
set service dhcp-server shared-network-name SECURITY subnet 10.32.30.0/24 range 0 stop '10.32.30.250'
set service dhcp-server shared-network-name SECURITY ntp-server 10.32.30.254

# (40) Servers Network
set service dhcp-server shared-network-name SERVERS authoritative
set service dhcp-server shared-network-name SERVERS ping-check
set service dhcp-server shared-network-name SERVERS subnet 10.32.40.0/24 default-router '10.32.40.254'
set service dhcp-server shared-network-name SERVERS subnet 10.32.40.0/24 domain-name 'labrats.cc'
set service dhcp-server shared-network-name SERVERS subnet 10.32.40.0/24 lease '86400'
set service dhcp-server shared-network-name SERVERS subnet 10.32.40.0/24 name-server '10.40.0.6'
set service dhcp-server shared-network-name SERVERS subnet 10.32.40.0/24 range 0 start '10.32.40.200'
set service dhcp-server shared-network-name SERVERS subnet 10.32.40.0/24 range 0 stop '10.32.40.250'
set service dhcp-server shared-network-name SERVERS ntp-server 10.32.40.254

set service dhcp-server shared-network-name SERVERS subnet 10.32.40.0/24 static-mapping titan ip-address '10.32.40.10'
set service dhcp-server shared-network-name SERVERS subnet 10.32.40.0/24 static-mapping titan mac-address '6c:0b:84:e3:18:5c'
set service dhcp-server shared-network-name SERVERS subnet 10.32.40.0/24 static-mapping home-assistant ip-address '10.32.40.11'
set service dhcp-server shared-network-name SERVERS subnet 10.32.40.0/24 static-mapping home-assistant mac-address 'e4:5f:01:28:e3:c1'

# (50) IoT Network
set service dhcp-server shared-network-name IOT authoritative
set service dhcp-server shared-network-name IOT ping-check
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 default-router '10.32.50.254'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 domain-name 'labrats.cc'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 lease '86400'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 name-server '10.40.0.6'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 range 0 start '10.32.50.200'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 range 0 stop '10.32.50.250'
set service dhcp-server shared-network-name IOT ntp-server 10.32.50.254

## -- Amazon Devices (10.32.50.2X)
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping living_room_fire_tv ip-address '10.32.50.21'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping living_room_fire_tv mac-address '58:e4:88:11:51:b7'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping living_room_echo_dot ip-address '10.32.50.22'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping living_room_echo_dot mac-address '58:e4:88:cc:38:71'

## -- Air Quality (10.32.50.3X)
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping levoit-purifier ip-address '10.32.50.31'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping levoit-purifier mac-address '34:86:5d:a0:2d:c4'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping qingping-air-quality ip-address '10.32.50.32'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping qingping-air-quality mac-address '04:cf:8c:28:c4:5e'
## -- Cameras (10.32.50.4X)
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping hallway-cam ip-address '10.32.50.41'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping hallway-cam mac-address '78:8c:b5:6c:41:b4'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping kitchen-cam ip-address '10.32.50.42'
set service dhcp-server shared-network-name IOT subnet 10.32.50.0/24 static-mapping kitchen-cam mac-address '78:8c:b5:6c:46:17'

# (70) Management Network
set service dhcp-server shared-network-name MGMT authoritative
set service dhcp-server shared-network-name MGMT ping-check
set service dhcp-server shared-network-name MGMT subnet 10.32.70.0/24 default-router '10.32.70.254'
set service dhcp-server shared-network-name MGMT subnet 10.32.70.0/24 lease '86400'
set service dhcp-server shared-network-name MGMT subnet 10.32.70.0/24 name-server '10.40.0.6'
set service dhcp-server shared-network-name MGMT subnet 10.32.70.0/24 range 0 start '10.32.70.200'
set service dhcp-server shared-network-name MGMT subnet 10.32.70.0/24 range 0 stop '10.32.70.250'
set service dhcp-server shared-network-name MGMT ntp-server 10.32.0.1

set service dhcp-server shared-network-name MGMT subnet 10.32.70.0/24 static-mapping eap-ap-1 ip-address '10.32.70.41'
set service dhcp-server shared-network-name MGMT subnet 10.32.70.0/24 static-mapping eap-ap-1 mac-address '30:de:4b:9f:80:86'
