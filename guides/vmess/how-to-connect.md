## 1-
Install the appropriate client based on your platform:
| platform | name | link |
| ------ | ------ | ------ |
| Linux/Windows | nekoray | https://github.com/MatsuriDayo/nekoray/releases |
| Android | v2ray | https://play.google.com/store/apps/details?id=com.v2ray.ang |
| iOS   | ShadowLink | https://apps.apple.com/us/app/shadowlink-shadowsocks-vpn/id1439686518 |
| macOS GUI | V2RayX  | https://github.com/Cenmrev/V2RayX/releases |
| macOS | Qv2ray  | https://github.com/v2fly/v2ray-core/releases/ |

## 2-
Use these settings to connect:
```sh
Server IP: Your IR server IP
Port: 80
UUID: Generated UUID V1
Method: chacha20-ietf-poly1305
TLS: off
Websocket: ON
WS Path: /graphql
```

## 3- (optional)
In order to bypass the proxy as a dicret access to domains ending with `.ir`, do the following procedure in your client app:

### NekoRay

Go to <kbd>Program</kbd> --> <kbd>Preferences</kbd> --> <kbd>Routing Settings</kbd> --> <kbd>Custom</kbd>, add the following JSON:

```
{
    "rules": [
        {
            "domain": [
                "regexp:.*\.ir(/.*|$)"
            ],
            "outboundTag": "direct",
            "type": "field"
        }
    ]
}
```

### v2ray-core

Append the above config section into the `config.json` file. 

### v2rayNG

Just append `.ir,` into the <kbd>Settings</kbd> --> Custom rules (Routing) --> <kbd>Direct URL it IP</kbd>

