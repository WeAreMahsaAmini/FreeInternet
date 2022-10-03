# VMess proxy and Traffic transfer (from Iranian server to servers outside Iran)
# #مهسا_امینی   #MahsaAmini

## Non-Iranian server commands:
## 1-
```sh
sudo apt update
```
## 2-
```sh
sudo apt upgrade -y
```
## 3-
```sh
sudo apt install neofetch
```
## 4-
```sh
neofetch
```
## 5-
```sh
nano docker-compose.yaml
```

Add the following commands to the `docker-compose.yaml` file and save it
```sh
version: '3'
services:
  v2ray:
    image: v2fly/v2fly-core
    restart: always
    network_mode: host
    environment:
      - V2RAY_VMESS_AEAD_FORCED=false
    volumes:
        - ./config.json:/etc/v2ray/config.json:ro
```
## 6-
```sh
nano config.json
```
go to `https://www.uuidgenerator.net/version1` and make random id After that, replace the same ID with `PASTE YOUR ID HERE` in the following commands, then put them in the `config.json` file and save it.
```sh
{
  "log": {
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 80,
      "protocol": "vmess",
      "allocate": {
        "strategy": "always"
      },
      "settings": {
        "clients": [
          {
            "id": "PASTE YOUR ID HERE",
            "level": 1,
            "alterId": 0,
            "email": "client@example.com"
          }
        ],
        "disableInsecureEncryption": true
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "connectionReuse": true,
          "path": "/graphql"
        },
        "security": "none",
        "tcpSettings": {
          "header": {
            "type": "http",
            "response": {
              "version": "1.1",
              "status": "200",
              "reason": "OK",
              "headers": {
                "Content-Type": [
                  "application/octet-stream",
                  "application/x-msdownload",
                  "text/html",
                  "application/x-shockwave-flash"
                ],
                "Transfer-Encoding": ["chunked"],
                "Connection": ["keep-alive"],
                "Pragma": "no-cache"
              }
            }
          }
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    }
  ]
}
```
## 7-
```sh
curl https://get.docker.com | sh
```
## 8-
```sh
sudo apt install docker-compose
```
## 9-
```sh
docker-compose up -d
```
## Iran server commands:
## 1-
```sh
sudo apt update
```
## 2-
```sh
sudo apt upgrade -y
```
## 3-
```sh
sudo apt install iptables-persistent
```
```sh
nano /etc/iptables/rules.v4
```
Replace IP server outside Iran with `XX.XX.XX.XX` in the following commands, then save the file
```sh
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A FORWARD -d XX.XX.XX.XX -p tcp -m tcp --dport 80 -j ACCEPT
-A FORWARD -d XX.XX.XX.XX -p udp -m udp --dport 80 -j ACCEPT
COMMIT
*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A PREROUTING -p tcp -m tcp --dport 80 -j DNAT --to-destination XX.XX.XX.XX
-A PREROUTING -p udp -m udp --dport 80 -j DNAT --to-destination XX.XX.XX.XX
-A POSTROUTING -d XX.XX.XX.XX -p tcp -m tcp --dport 80 -j MASQUERADE
-A POSTROUTING -d XX.XX.XX.XX -p udp -m udp --dport 80 -j MASQUERADE
COMMIT
```
## 4-
```sh
nano /etc/sysctl.conf
```
Add the following command to the beginning of the file and save
```sh
net.ipv4.ip_forward=1
```
## 5-
```sh
sysctl -p
```
## 6-
```sh
sysctl --system
```
## 7-
```sh
sudo reboot
```
