; Make sure to update the epoch time in the SOA records so coreDNS picks up the changes automatically
; https://www.epochconverter.com/

; SOA Records
$TTL 3600
$ORIGIN labrats.cc.
@ 3600 IN SOA gateway.labrats.cc. gateway.labrats.cc. (
  1688149111         ; serial number (epoch timestamp)
  7200               ; refresh period
  3600               ; retry period
  1209600            ; expire time
  3600               ; minimum ttl
)

; NS Records
@                          IN  NS gateway.labrats.cc.

; LAN
gateway                    IN  A  10.32.40.254

; Servers
@                          IN  A  10.32.40.10
titan                      IN  A  10.32.40.10

; IOT

; Containers


; CNAME Records
minio                      IN  CNAME  titan.labrats.cc.
jellyfin                   IN  CNAME  titan.labrats.cc.
anime                      IN  CNAME  titan.labrats.cc.
tv                         IN  CNAME  titan.labrats.cc.
movies                     IN  CNAME  titan.labrats.cc.
prowlarr                   IN  CNAME  titan.labrats.cc.
logs                       IN  CNAME  titan.labrats.cc.
portal                     IN  CNAME  titan.labrats.cc.
auth                       IN  CNAME  titan.labrats.cc.
postgres                   IN  CNAME  titan.labrats.cc.
tdarr                      IN  CNAME  titan.labrats.cc.
accounts                   IN  CNAME  titan.labrats.cc.
alerts                     IN  CNAME  titan.labrats.cc.
backups                    IN  CNAME  titan.labrats.cc.
home                       IN  CNAME  titan.labrats.cc.
cameras                    IN  CNAME  titan.labrats.cc.
