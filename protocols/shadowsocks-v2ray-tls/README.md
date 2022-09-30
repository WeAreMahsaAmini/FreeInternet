# shadowsocks-v2ray-tls

## Setup

1. Buy a simple server (VPS) for 5 dollars outside Iran.
2. Buy a cheap domain for 2 dollars.
3. Create an Arvancloud account. It only needs an email address and a phone number (both Iranian and international phone numbers accepted)
4. Log in to the Arvancloud account and connect your domain to your server's IP address.
5. From the "DNS records" section of the Arvancloud panel, activate the "Cloud Service" option.
6. From the "HTTPS settings" section, select the issue certificate.
7. From the "HTTPS settings" section, activate the "Activate HTTPS" option.
8. On the VPS, install docker and docker-compose.
9. Clone this repo and edit the .env file.
10. Open a pull request to share your server config.

`docker-compose build`

`docker-compose up -d`



