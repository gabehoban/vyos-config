; Make sure to update the epoch time in the SOA records so coreDNS picks up the changes automatically
; https://www.epochconverter.com/

; SOA Records
$TTL 3600
$ORIGIN labrats.cc.
@ 3600 IN SOA gateway.labrats.cc. gateway.labrats.cc. (
  1711148110         ; serial number (epoch timestamp)
  7200               ; refresh period
  3600               ; retry period
  1209600            ; expire time
  3600               ; minimum ttl
)

; NS Records
@                             IN  NS gateway.labrats.cc.

; LAN
gateway                       IN  A  10.32.0.254

; Trusted
baymax-pc                     IN  A  10.32.10.21
gabes-iphone                  IN  A  10.32.10.22
gabes-macbook                 IN  A  10.32.10.23

; Guest

; IOT
bedroom-echo                  IN  A  10.32.30.31
living-room-echo-show         IN  A  10.32.30.32
living-room-echo-studio       IN  A  10.32.30.33
lg-tv                         IN  A  10.32.30.61
apple-tv                      IN  A  10.32.30.62
levoit-purifier               IN  A  10.32.30.63

; Servers
discovery                     IN  A  10.32.40.10
discovery-idrac               IN  A  10.32.40.11
pve                           IN  A  10.32.40.21
endeavour                     IN  A  10.32.40.23
tars                          IN  A  10.32.40.31

cluster-node-01               IN  A  10.32.40.41
cluster-node-02               IN  A  10.32.40.42
cluster-node-03               IN  A  10.32.40.43
casio                         IN  A  10.32.40.51
seiko                         IN  A  10.32.40.52

; Video
kitchen-cam                   IN  A  10.32.50.51

; Containers
cluster                       IN  A  10.40.0.9

; CNAME records
proxmox                       IN  CNAME pve.labrats.cc.
