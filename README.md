# FreeInternet

[![](https://dcbadge.vercel.app/api/server/ggDH3G8ng2?style=plastic)](https://discord.gg/ggDH3G8ng2)

The goal of this project is to provide free internet access to Iranian people by any means. The idea has been raised in [this](https://github.com/WeAreMahsaAmini/Core/discussions/62) discussion.

<div dir="rtl">

# [آموزش اتصال](guides/README.md)

</div>

# How to Connect?
## Shadowocks V2ray
### Android
- Download  [Shadowsocks App](https://play.google.com/store/apps/details?id=com.github.shadowsocks) and [V2ray Plugin App](https://play.google.com/store/apps/details?id=com.github.shadowsocks.plugin.v2ray)  from Play Store.
If you can't access Play Store alternatively you can download APK files from Shadowsocks GitHub [repository](https://github.com/shadowsocks) or the links below.

[Shadowsocks APK](https://github.com/shadowsocks/shadowsocks-android/releases/download/v5.2.6/shadowsocks--universal-v5.2.6.apk)

 [V2ray Plugin APK](https://github.com/shadowsocks/v2ray-plugin-android/releases/download/v1.3.3/v2ray--universal-1.3.3.apk)

- first Copy one of the **Android** config text from the [list of domains](protocols/shadowsocks-v2ray-tls/CONFIGS.md) and open the Shadowsocks app.

`Example Config:
ss://YWVzLTI1Ni1nY206WDhDZWN1Y2QyTUZtclJYVGJCcmk@aiohekl.monster:443?plugin=v2ray-plugin%3Bpath%3D%2Fredis%3Bhost%3Daiohekl.monster%3Btls`

- Tap the plus button from the upper right corner and tab.
<img src="https://user-images.githubusercontent.com/47558577/193402425-7c86138f-fa2b-4087-af95-336215916295.jpg" height="500">

- Then tap the  "Import From Clipboard" item.
<img src="https://user-images.githubusercontent.com/47558577/193402427-275b568c-d159-4dbe-9fee-5a60570e95d9.jpg" height="500">

- Select the newly added server from the list and tab paper plane button.
<img src="https://user-images.githubusercontent.com/47558577/194591127-907be7ae-961b-4902-b376-61b58075c88d.jpg" height="500">

- Done.

### IOS
- Download [Shadowrocket](https://apps.apple.com/us/app/shadowrocket/id932747118) from App Store. If you can't pay a one-time fee for the app then use one of the following methods.
     - Side load the app with tools like [AltServer](https://altstore.io/).
     - Use the following Apple ID to sign in to the **App Store App** (NOT TO ICLOUD), install the app, and then log out.
     > Email: lisbontime1@proton.me

     > Password: #MahsaAmini1
- Copy one of the **IOS** config text from the [list of domains](protocols/shadowsocks-v2ray-tls/CONFIGS.md) and open the Shadowrocket app, the app will detect the config and will open a popup, tab add.

`Example Config:
ss://YWVzLTI1Ni1nY206WDhDZWN1Y2QyTUZtclJYVGJCcmlAYWlvaGVrbC5tb25zdGVyOjQ0Mw?tfo=1&v2ray-plugin=eyJwYXRoIjoiXC9yZWRpcyIsIm11eCI6dHJ1ZSwidGZvIjp0cnVlLCJob3N0IjoiYWlvaGVrbC5tb25zdGVyIiwibW9kZSI6IndlYnNvY2tldCIsInRscyI6dHJ1ZX0`
- From **Global Routing** section select **Proxy**.
- Select the newly added server from the list and toggle the connection.
- Done.
## How to Help?
### By Spinning up servers
If you have the technical ability, please check out each protocol Readme file to set up server and open a pull request to share config.
### Spread the word
Share it with friends and family.

## How to contribute?

Please check out [our contribution guide](https://github.com/WeAreMahsaAmini/FreeInternet/blob/main/CONTRIBUTING.md) to start working on this project.
