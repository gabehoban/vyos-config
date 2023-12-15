; Make sure to update the epoch time in the SOA records so coreDNS picks up the changes automatically
; https://www.epochconverter.com/

; SOA Records
$TTL 3600
$ORIGIN labrats.cc.
@ 3600 IN SOA gateway.labrats.cc. gateway.labrats.cc. (
    1702609704         ; serial number (epoch timestamp)
    7200               ; refresh period
    3600               ; retry period
    1209600            ; expire time
    3600               ; minimum ttl
)

; NS Records
@                             IN  NS gateway.labrats.cc.

; LAN
gateway                       IN  A  10.32.0.254
tplink-switch                 IN  A  10.32.0.21
tplink-eap                    IN  A  10.32.0.22

; Trusted
baymax-pc                     IN  A  10.32.10.21
gabes-iphone                  IN  A  10.32.10.22
gabes-macbook                 IN  A  10.32.10.23

; IOT
bedroom-echo                  IN  A  10.32.30.31
living-room-echo-show         IN  A  10.32.30.32
living-room-echo-studio       IN  A  10.32.30.33
espresense-bedroom            IN  A  10.32.30.41
espresense-kitchen            IN  A  10.32.30.42
espresense-living-room        IN  A  10.32.30.43
kitchen-cam                   IN  A  10.32.30.51
hallway-cam                   IN  A  10.32.30.52
lg-webos-tv                   IN  A  10.32.30.61
levoit-purifier               IN  A  10.32.30.63
qingping-air-quality          IN  A  10.32.30.64
pura-diffuser                 IN  A  10.32.30.65

; Servers
discovery                     IN  A  10.32.40.10
pve                           IN  A  10.32.40.21
voyager                       IN  A  10.32.40.22
endeavour                     IN  A  10.32.40.23
hubble                        IN  A  10.32.40.25
tars                          IN  A  10.32.40.31
casio                         IN  A  10.32.40.51
sekio                         IN  A  10.32.40.52

; Containers
homelab-cluster0              IN  A  10.40.0.8

; CNAME records
plex                          IN  CNAME  hubble.labrats.cc.
