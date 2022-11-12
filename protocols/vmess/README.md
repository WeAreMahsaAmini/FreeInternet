# VMess Proxy with an IR server as a router 

In this toturial it's assumed that you already have a server (VPS) in Iran and another one outside of the Iran.

Your server inside Iran will act as a router. It's only job is to route traffic from within the country to the main server (non-IR) which hosts the actual Vmess proxy.

All commands are base on debian-based linux distros. e.g. Ubuntu.

Note that for simplicity, there is no authentication mechanism applied.

### #MahsaAmini

## On your non-IR server:

### 1-
```sh
sudo apt update
```
### 2-
```sh
sudo apt upgrade -y
```
### 3-
```sh
nano docker-compose.yaml
```

Add the following to the `docker-compose.yaml` file and save:
```sh
version: "3"
services:
  v2ray443:
    image: v2fly/v2fly-core:v4.45.2
    restart: always
    network_mode: host
    environment:
      - V2RAY_VMESS_AEAD_FORCED=false
    volumes:
      - ./config.json:/etc/v2ray/config.json:ro
```
### 4-
```sh
nano config.json
```
Add the following to the `config.json` file and save:
```sh
{
  "log": {
    "loglevel": "warning"
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
            "id": "xxx-xxx-xxx",
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

Navigate to `https://www.uuidgenerator.net/version1` and grab a UUID V1, Then replace the `YOUR_NEW_UUID` in the following command with your newly generated UUID and run:

```sh
sed -i 's/xxx-xxx-xxx/YOUR_NEW_UUID/g' ./config.json
```

Note that `docker-compose.yaml` and `config.json` files need to be under the same directory.


### 5-
Install docker and docker-compose:
```sh
sudo apt install docker docker-compose
```
### 6-
Start the Vmess server:
```sh
docker-compose up -d
```
## On your IR server:
### 1-
```sh
sudo apt update
```
### 2-
```sh
sudo apt upgrade -y
```
### 3-
```sh
sudo apt install iptables-persistent
```
```sh
sudo nano /etc/iptables/rules.v4
```
Add the following to the `rules.v4` file and save:
```sh
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A FORWARD -d xx.xx.xx.xx -p tcp -m tcp --dport 80 -j ACCEPT
-A FORWARD -d xx.xx.xx.xx -p udp -m udp --dport 80 -j ACCEPT
COMMIT
*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A PREROUTING -p tcp -m tcp --dport 80 -j DNAT --to-destination xx.xx.xx.xx
-A PREROUTING -p udp -m udp --dport 80 -j DNAT --to-destination xx.xx.xx.xx
-A POSTROUTING -d xx.xx.xx.xx -p tcp -m tcp --dport 80 -j MASQUERADE
-A POSTROUTING -d xx.xx.xx.xx -p udp -m udp --dport 80 -j MASQUERADE
COMMIT
```

Replace `NON_IR_IP` with your non-IR server IP address and run the command:
```sh
sudo sed -i 's/xx.xx.xx.xx/NON_IR_IP/g' /etc/iptables/rules.v4
```
This will replace all occurences of `xx.xx.xx.xx` with the actual IP address of your non-IR server.

### 4-
```sh
sudo nano /etc/sysctl.conf
```
Add the following line to the beginning of the file (or just find it and uncomment it) and save:
```sh
net.ipv4.ip_forward=1
```
### 5-
Run next two commands to make the changes take effect right away:
```sh
sudo sysctl -p
```
```sh
sudo systemctl restart iptables.service
```

Now head over to the guides directory for instructions on how to connect to your server using a Vmess client.
