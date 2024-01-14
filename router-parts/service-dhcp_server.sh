#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

set service dhcp-server hostfile-update

# (0) lan Network
set service dhcp-server shared-network-name lan authoritative
set service dhcp-server shared-network-name lan subnet 10.32.0.0/24 default-router '10.32.0.254'
set service dhcp-server shared-network-name lan subnet 10.32.0.0/24 domain-name 'labrats.cc'
set service dhcp-server shared-network-name lan subnet 10.32.0.0/24 lease '86400'
set service dhcp-server shared-network-name lan subnet 10.32.0.0/24 name-server '10.40.0.6'
set service dhcp-server shared-network-name lan subnet 10.32.0.0/24 range 0 start '10.32.0.200'
set service dhcp-server shared-network-name lan subnet 10.32.0.0/24 range 0 stop '10.32.0.253'
set service dhcp-server shared-network-name lan ntp-server 10.32.0.254

set service dhcp-server shared-network-name lan subnet 10.32.0.0/24 static-mapping tplink-switch ip-address '10.32.0.21'
set service dhcp-server shared-network-name lan subnet 10.32.0.0/24 static-mapping tplink-switch mac '54:af:97:0E:80:c9'
set service dhcp-server shared-network-name lan subnet 10.32.0.0/24 static-mapping tplink-eap ip-address '10.32.0.22'
set service dhcp-server shared-network-name lan subnet 10.32.0.0/24 static-mapping tplink-eap mac '30:de:4b:9f:80:86'

# (10) Trusted Network
set service dhcp-server shared-network-name trusted authoritative
set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 default-router '10.32.10.254'
set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 domain-name 'labrats.cc'
set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 lease '86400'
set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 name-server '10.40.0.6'
set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 range 0 start '10.32.10.200'
set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 range 0 stop '10.32.10.253'
set service dhcp-server shared-network-name trusted ntp-server 10.32.10.254

set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 static-mapping baymax-pc ip-address '10.32.10.21'
set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 static-mapping baymax-pc mac '08:bf:b8:13:5d:29'
set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 static-mapping gabes-iphone ip-address '10.32.10.22'
set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 static-mapping gabes-iphone mac '54:eb:e9:60:19:b4'
set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 static-mapping gabes-macbook ip-address '10.32.10.23'
set service dhcp-server shared-network-name trusted subnet 10.32.10.0/24 static-mapping gabes-macbook mac 'f4:d4:88:5c:31:8f'

# (20) Guest Network
set service dhcp-server shared-network-name guest authoritative
set service dhcp-server shared-network-name guest subnet 10.32.20.0/24 default-router '10.32.20.254'
set service dhcp-server shared-network-name guest subnet 10.32.20.0/24 lease '86400'
set service dhcp-server shared-network-name guest subnet 10.32.20.0/24 name-server '10.40.0.6'
set service dhcp-server shared-network-name guest subnet 10.32.20.0/24 range 0 start '10.32.20.200'
set service dhcp-server shared-network-name guest subnet 10.32.20.0/24 range 0 stop '10.32.20.253'

set service dhcp-server shared-network-name guest subnet 10.32.20.0/24 static-mapping work-laptop ip-address '10.32.20.21'
set service dhcp-server shared-network-name guest subnet 10.32.20.0/24 static-mapping work-laptop mac 'ac:19:8e:58:54:21'

# (30) iot Network
set service dhcp-server shared-network-name iot authoritative
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 default-router '10.32.30.254'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 lease '86400'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 name-server '10.40.0.6'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 range 0 start '10.32.30.200'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 range 0 stop '10.32.30.253'
set service dhcp-server shared-network-name iot ntp-server 10.32.30.254
## -- (10.32.30.3x) iot ALEXA ECHO
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping bedroom-echo ip-address '10.32.30.31'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping bedroom-echo mac '58:e4:88:cc:38:71'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping living-room-echo-show ip-address '10.32.30.32'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping living-room-echo-show mac '3c:e4:41:a4:9f:c6'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping living-room-echo-studio ip-address '10.32.30.33'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping living-room-echo-studio mac '58:e4:88:3f:56:c0'
## -- (10.32.30.4x) iot ESPRESENSE
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping espresense-bedroom ip-address '10.32.30.41'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping espresense-bedroom mac 'b0:a7:32:11:ee:34'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping espresense-kitchen ip-address '10.32.30.42'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping espresense-kitchen mac '40:22:d8:fd:77:6c'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping espresense-living-room ip-address '10.32.30.43'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping espresense-living-room mac 'cc:db:a7:d9:81:14'
## -- (10.32.30.5x) iot VIDEO
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping kitchen-cam ip-address '10.32.30.51'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping kitchen-cam mac '78:8c:b5:6c:46:17'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping hallway-cam ip-address '10.32.30.52'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping hallway-cam mac '78:8c:b5:6c:41:b4'
## -- (10.32.30.6x) iot MISC
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping lg-tv ip-address '10.32.30.61'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping lg-tv mac '64:cb:e9:8a:01:be'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping apple-tv ip-address '10.32.30.62'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping apple-tv mac '48:e1:5c:67:53:1e'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping levoit-purifier ip-address '10.32.30.63'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping levoit-purifier mac '34:86:5d:a0:2d:c4'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping qingping-air-quality ip-address '10.32.30.64'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping qingping-air-quality mac '04:cf:8c:28:c4:5e'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping pura-diffuser ip-address '10.32.30.65'
set service dhcp-server shared-network-name iot subnet 10.32.30.0/24 static-mapping pura-diffuser mac 'c8:f0:9e:58:01:0c'

# (40) Servers Network
set service dhcp-server shared-network-name servers authoritative
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 default-router '10.32.40.254'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 domain-name 'labrats.cc'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 lease '86400'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 name-server '10.40.0.6'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 range 0 start '10.32.40.200'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 range 0 stop '10.32.40.253'
set service dhcp-server shared-network-name servers ntp-server 10.32.40.254

# discovery  -- truenas storage host
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping discovery ip-address '10.32.40.10'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping discovery mac '84:2b:2b:45:04:8e'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping discovery-idrac ip-address '10.32.40.11'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping discovery-idrac mac '84:2b:2b:45:04:96'
# pve        -- proxmox hypervisor host
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping pve ip-address '10.32.40.21'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping pve mac '48:4d:7e:d0:10:e5'
# voyager    -- proxmox compute vm
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping voyager ip-address '10.32.40.22'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping voyager mac '46:c2:2c:01:a5:41'
# endeavour  -- proxmox home-assistant vm
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping endeavour ip-address '10.32.40.23'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping endeavour mac '02:70:6c:98:d2:3d'
# titan      -- proxmox compute vm
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping titan ip-address '10.32.40.24'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping titan mac '2a:1e:8e:a4:cf:4c'
# hubble     -- proxmox networking vm
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping hubble ip-address '10.32.40.25'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping hubble mac '3e:3b:46:ab:84:96'
# casio      -- GPS NTP Time Server 1 (rpi)
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping casio ip-address '10.32.40.51'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping casio mac 'd8:3a:dd:68:0b:81'
# sekio      -- GPS NTP Time Server 2 (rpi)
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping seiko ip-address '10.32.40.52'
set service dhcp-server shared-network-name servers subnet 10.32.40.0/24 static-mapping seiko mac 'd8:3a:dd:68:ec:82'
