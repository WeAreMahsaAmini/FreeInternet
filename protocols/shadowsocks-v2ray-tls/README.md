# shadowsocks-v2ray-tls

## Pre requirements

1. Buy a simple server (VPS) for 5 dollars outside Iran.
2. Buy a cheap domain for 2 dollars.
3. Create a free Arvancloud account. It only needs an email address and a phone number. **make sure to use non-iranian number for more security**.

## Domain panel setup
1. In the management panel of your domain, set the nameservers of your domsain to those of Arvan (currently `o.ns.arvancdn.co` and `f.ns.arvancdn.org`).
<img width="1040" alt="Screen Shot 2022-10-04 at 2 46 12 PM" src="https://user-images.githubusercontent.com/25032492/193805287-3f4b472e-c2ce-430e-94ba-a8f19d945bd1.png">



## Arvancloud setup
1. Log in to the Arvancloud account.
2. From left panel, Go to **CDN** then **Domains** then **Add new domains**
3. Enter the bought domain(e.g. myDomain.me) and click **Accept the rules and continue**
4. On **select plan** step, just click continue.
5. on next step, click on **Add new record**, then fill fields as below and click save.
<img width="722" alt="Screen Shot 2022-10-04 at 3 29 50 PM" src="https://user-images.githubusercontent.com/25032492/193814446-5830fa8b-35bc-4493-a0e2-0cfc5815c418.png">

6. Click **finish** on next step. your changes would apply in couple minutes. meanwhile, do next steps.
7. From left panel **CDN**, Go to **HTTPS settings** section, then activate the **Activate HTTPS** option.
8. Then select **Issue certificate** and make sure **Set HTTPS as Default** options is off.

## VPS setup
1. On the VPS, install docker and docker-compose.
2. Clone this repo and cd to `FreeInternet/protocols/shadowsocks-v2ray-tls/`
3. Edit .env file and change `DOMAIN` variable to your bought domain(e.g. DOMAIN=myDomain.me)
4. Run these commands:
```
docker-compose build

docker-compose up -d
```

5. All done.

**Note**: You can use `docker-compose logs -f` to see if there is any error.


*Fell free to open a pull request to share your server config.*



