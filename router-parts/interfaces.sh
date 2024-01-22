#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### -- Interface Descriptions
set interfaces ethernet eth0 address '10.32.0.254/24'
set interfaces ethernet eth0 description 'lan'
set interfaces ethernet eth0 vif 10 address '10.32.10.254/24'
set interfaces ethernet eth0 vif 10 description 'trusted'
set interfaces ethernet eth0 vif 20 address '10.32.20.254/24'
set interfaces ethernet eth0 vif 20 description 'guest'
set interfaces ethernet eth0 vif 30 address '10.32.30.254/24'
set interfaces ethernet eth0 vif 30 description 'iot'
set interfaces ethernet eth0 vif 40 address '10.32.40.254/24'
set interfaces ethernet eth0 vif 40 description 'servers'
set interfaces ethernet eth0 vif 50 address '10.32.50.254/24'
set interfaces ethernet eth0 vif 50 description 'video'
set interfaces ethernet eth0 hw-id '00:23:24:c2:f3:07'

set interfaces ethernet eth2 address 'dhcp'
set interfaces ethernet eth2 description 'wan'
set interfaces ethernet eth2 hw-id '00:05:1b:96:9d:0b'

set interfaces wireless wlan0 physical-device 'phy0'
set interfaces wireless wlan0 hw-id 'e4:a7:a0:2e:14:68'

set interfaces wireguard wg01 address '10.20.0.254/24'
set interfaces wireguard wg01 description 'WIREGUARD'
set interfaces wireguard wg01 peer iphone-gabe allowed-ips '10.20.0.21/32'
set interfaces wireguard wg01 peer iphone-gabe persistent-keepalive '15'
set interfaces wireguard wg01 peer iphone-gabe public-key "${SECRET_WIREGUARD_CLIENT_0_PUBKEY}"
set interfaces wireguard wg01 peer macbook-gabe allowed-ips '10.20.0.22/32'
set interfaces wireguard wg01 peer macbook-gabe persistent-keepalive '15'
set interfaces wireguard wg01 peer macbook-gabe public-key "${SECRET_WIREGUARD_CLIENT_1_PUBKEY}"
set interfaces wireguard wg01 port '51820'
set interfaces wireguard wg01 private-key "${SECRET_WIREGUARD_PRIVKEY}"
