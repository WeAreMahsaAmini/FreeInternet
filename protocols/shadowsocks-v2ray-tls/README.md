# shadowsocks-v2ray-tls

## Setup

1. Buy a simple server (VPS) for 5 dollars outside Iran.
2. Buy a cheap domain for 2 dollars.
3. Create an Arvancloud account. It only needs an email address and a phone number (both Iranian and international phone numbers accepted)
4. Log in to the Arvancloud account and connect your domain to your server's IP address.
5. From the "DNS records" section of the Arvancloud panel, activate the "Cloud Service" option.
6. From the "HTTPS settings" section, select the issue certificate.
7. From the "HTTPS settings" section, activate the "Activate HTTPS" option.
8. In the management panel of your domain, set the nameservers of your domsain to those of Arvan (currently `o.ns.arvancdn.co` and `f.ns.arvancdn.org`).
9. On the VPS, install docker and docker-compose.
10. Open ports 80 TCP ingress and 443 TCP ingress on your server (security group/firewall)
11. Clone this repo and edit the .env file.
12. Open a pull request to share your server config.

`docker-compose build`

`docker-compose up -d`


