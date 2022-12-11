This website provides a simple multi proxy method.
- OneClick even without ssh
- Telegram Proxy (faketls with fallback)
- Shadowsocks+obfs (faketls with fallback)
- Shadowsocks+v2ray (cdn support)
- trojan-go (cdn support)
- vmess (cdn support)
- DNS over HTTPS (cdn support)
- Redirector (cdn support)
- usage report
- Automatic use proxy for non-Iranian sites
- Active probing resistant

What you need is just a VPS with an ip and a subdomain (you can use free subdomains as described in the website)

Just type your subdomain and secret and run the command in the VPS. 

All the information exist in: https://github.com/hiddify/hiddify-config/


![صفحه راهنمای کاربران](https://user-images.githubusercontent.com/114227601/206908372-db1fc206-4c6a-4206-ad39-e6b6b44a55c4.png)


It doesn't need any docker so you can run it in cheap VPS : [lists](https://github.com/hiddify/awesome-iran-freedom/blob/main/vps-providers.md)

To add support for CDN, please follow the instuction in advanced setup in that page.

After setting up your server, you can add a link to it (to its private help page) in the guides/multiproxy/how-to-connect.md file. Open a PR and request for your config to be merged.
