
# shadowsocks-v2ray-tls

## Setup guide

### 1. Prepare

1. Buy a simple server (VPS) for 5 dollars outside Iran. [List of cloud server providers.](https://github.com/hiddify/awesome-iran-freedom/blob/main/vps-providers.md)
2. Buy a cheap domain for 2 dollars.
3. Create an Arvancloud account. It only needs an email address and a phone number (both Iranian and international phone numbers accepted)

---

### 2. Arvancloud setup

4. Log in to the Arvancloud account and add your domain.

```
Domain List > Add new domains
```

![Arvancloud dashboard > Add new domain](../media/arvanclound_adddomain.jpg 'Click on Add new domain')

Then:

- Enter your domain name
- Select Free plan
- Skip DNS Records
- Note the nameservers presented on the last step

![Add new domain > Nameservers](../media/arvanclound_nameservers.jpg 'Copy these nameservers')

- Go to your domain registrar (the website where you bought your domain, e.g. Godaddy, Namecheap, ...)
- Update the nameservers to the one you got in Arvancloud (after adding the domain).

After your domain nameservers changed successfully (depending on the registrar, it can take a few hours, but it's usually quite fast), your domain is now using Arvancloud DNS.

5. Connect your domain to your server's IP address using `A` records. Make sure the `Cloud Service` option is enabled for each record.
   ![Add new domain > Nameservers](../media/arvanclound_add_dns.jpg 'Enable cloud services')

6. Go to `HTTPS settings` on the navbar, select `Issue certificate`. It will take around 30 minutes for the certificate to be ready.

7. After the certificate is issued, enable the `Activate HTTPS` option.
   ![HTTPS Settings > Activate HTTPS](../media/arvanclound_https.jpg 'Enable cloud services')

### 3. VPS setup

1. SSH into the server.
2. Install docker and docker-compose. Here's a [tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04) on how to do it for Ubuntu.
3. Open ports 80 TCP ingress and 443 TCP ingress on your server (security group/firewall)

4. Clone the below repo and `cd` inside the folder.

```bash
git clone https://github.com/WeAreMahsaAmini/FreeInternet.git
cd FreeInternet/protocols/shadowsocks-v2ray-tls/
```

5. Edit the `.env` file.

```bash
# Replace your_domain with the domain you bought, without http, or www in front of it, e.g.: google.com
DOMAIN=your-domain.com

# change to a secure password
PASSWORD=some-strong-password
```

6. Build the docker image and run the containers with below commands:

```bash
docker-compose build

docker-compose up -d
```

7. Since the container is running in detached mode, you need to check the logs to see the config for your VPN server. (Android and iOS urls)

```bash
docker-compose logs -f --tail 500
```

### 4. Share

1. Congratulations! Your server is running now. You can share the URLs with your family, friends and people you trust. You can share [this guide](../../guides/shadowsocks-v2ray-tls/how-to-connect.md) for them to start using your VPN server.
2. Alternatively, you can open a pull request to [this file](../../guides/shadowsocks-v2ray-tls/CONFIGS.md) to share your server config on this repository so more people can utilise it.
