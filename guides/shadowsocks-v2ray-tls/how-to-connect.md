
<div dir="rtl">

# آیفون و آیپد

1. ابتدا وارد اپ استور شوید. 
2. از اکانت فعلی خود log out کنید.(قبل از این کار مطمئن شوید رمز و اطلاعات آن را دارید) این به این خاطر است برنامه ای که قرار است نصب کنید در iOS پولی است و ما برای شما در این اکانت خریداری کردیم.
3. سپس با اکانت زیر وارد اپ استور شوید.

</div>

> email: lisbontime1@proton.me

> password: 1#Mahsaamini

<div dir="rtl">

4. اگر از شما درخواست ارتقا امنیت کرد آن را نادیده گرفته گزینه other options و سپس don't upgrade را بزنید.
5. اپلیکیشن Shadowrocket را از لیست برنامه های خریداری شده دانلود و نصب کنید.
6. پس از اطمینان از نصب برنامه از اکانت بالا log out کنید.
7. کد زیر را رو کپی کنید.
8. سپس برنامه Shadowrocket را باز کنید. اپلیکیشن به طور خودکار کد را شناسایی کرده و پس از تایید، آن را به لیست اضافه میکند.
9. از قسمت Global Routing گزینه Proxy رو انتخاب کنید.

</div>

1. > ss://YWVzLTI1Ni1nY206WDhDZWN1Y2QyTUZtclJYVGJCcmlAYWlvaGVrbC5tb25zdGVyOjQ0Mw?tfo=1&v2ray-plugin=eyJwYXRoIjoiXC9yZWRpcyIsIm11eCI6dHJ1ZSwidGZvIjp0cnVlLCJob3N0IjoiYWlvaGVrbC5tb25zdGVyIiwibW9kZSI6IndlYnNvY2tldCIsInRscyI6dHJ1ZX0
2. > ss://YWVzLTI1Ni1nY206TWFoc2FBbWluaUBnaW1wbWllLmhhaXI6NDQz?tfo=1&uot=1&v2ray-plugin=eyJwYXRoIjoicmFiYml0bXEiLCJtdXgiOnRydWUsInRmbyI6dHJ1ZSwiaG9zdCI6ImdpbXBtaWUuaGFpciIsIm1vZGUiOiJ3ZWJzb2NrZXQiLCJ0bHMiOnRydWV9

### [لیست تمام سرور ها](CONFIGS.md)

<div dir="rtl">

# اندروید

1. ابتدا دوتا برنامه زیر را نصب کنید.

[Shadowsocks](https://play.google.com/store/apps/details?id=com.github.shadowsocks) 

[V2ray Plugin](https://play.google.com/store/apps/details?id=com.github.shadowsocks.plugin.v2ray)

کاربرانی که نمیتوانند به Play Store متصل شن، فایل های نصبی رو از لینک های زیر میتوانند دانلود کنند.


[Shadowsocks APK](https://github.com/shadowsocks/shadowsocks-android/releases/download/v5.2.6/shadowsocks--universal-v5.2.6.apk)

 [V2ray Plugin APK](https://github.com/shadowsocks/v2ray-plugin-android/releases/download/v1.3.3/v2ray--universal-1.3.3.apk)

2. یکی از کدهای زیر را کپی کنید.
3. وارد برنامه shadowsocks بشید.
4. بر روی دکمه (کاغذ با علامت +) کلیک کنید. گزینه ی Import From Clipboard رو بزنید.
5. سپس پس از این کار سرور جدیدی به نمایش میاد. روی اون سرور کلیک کنید و در انتها علامت موشک کاغذی در پایین صفحه رو بزنید. 

</div>


1. > ss://YWVzLTI1Ni1nY206WDhDZWN1Y2QyTUZtclJYVGJCcmk@aiohekl.monster:443?plugin=v2ray-plugin%3Bpath%3D%2Fredis%3Bhost%3Daiohekl.monster%3Btls

2. > ss://YWVzLTI1Ni1nY206TWFoc2FBbWluaQ@gimpmie.hair:443?plugin=v2ray-plugin%3Bpath%3Drabbitmq%3Bhost%3Dgimpmie.hair%3Btls

### [لیست تمام سرور ها](CONFIGS.md)

# لینوکس

۱. نرم‌افزار shadowsocks-libev را نصب کنید. برای نصب این برنامه می‌توانید از پکج منجنر استفاده کنید. مثلاً در اوبونتو با `sudo apt install shadowsocks-libev`. همچنین می‌توانید آخرین ورژن برنامه را از [این محل](https://github.com/shadowsocks/shadowsocks-libev/releases) دریافت کنید. برای چک کردن این که آیا نرم‌افزار نصب است، دستور `ss-local` را در ترمینال امتحان کنید.

۲. آخرین ورژن پلاگین v2ray را از [این محل](https://github.com/shadowsocks/v2ray-plugin/releases) دانلود کنید. داخل فایل دانلود شده یک فایل اجرایی وجود دارد. با فرض این که شما ورژن amd64 پلاگین را دانلود کرده باشید نام این فایل v2ray-plugin_linux_amd64 است. اگر در ترمینال، در دایرکتوری جاری این فایل وجود داشته باشد، می‌توانید آن را با اجرای این دستور در محل مناسب نصب کنید: `sudo install v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin`.

۳. یک فایل جیسون با نام shadowsocks.json در دایرکتوری home خود ایجاد کنید و محتوای زیر را در آن کپی کنید:

```
{
    "server":["DOMAIN_NAME"],
    "mode":"tcp_and_udp",
    "server_port":443,
    "password":"PASSWORD",
    "method":"aes-256-gcm",

    "local_port": 1080,
    "local_address": "127.0.0.1",

    "plugin": "/usr/local/bin/v2ray-plugin",
    "plugin_opts": "path=rabbitmq;host=DOMAIN_NAME;tls"
}
```

در این تنظیمات باید موارد زیر را اصلاح کنید:

 - نام دامنه را در فیلدهای server و plugin_opts با مقدار موردنظر خود جایگزین کنید.
 - کلمه عبور را در فیلد password اصلاح کنید.

برای استخراج این جزئیات از URLهای موجود در [لیست سرورها](CONFIGS.md) می‌توانید از اسکریپت ss-link-to-json.py استفاده کنید.

۴. شدوساکس را با این دستور اجرا کنید: ‍`ss-local -c ~/shadowsocks.json`.

بعد از این باید شدوساکس به صورت یک پروکسی SOCKS روی پورت 1080 در دسترس باشد. برای استفاده از این پروکسی در مرورگر می‌توانید از افزونه FoxyProxy در کروم و فایرفاکس استفاده کنید.

۵. در صورتی که نیاز به پروکسی http دارد می‌توانید از برنامه privoxy استفاده کنید. ابتدا privoxy را نصب کنید. در اوبونتو می‌توانید از دستور `sudo apt install privoxy` استفاده کنید. سپس خطوط زیر را در فایل /etc/privoxy/config اضافه کنید (اگر فایل وجود ندارد، آن را ایجاد کنید):

```
listen-address  127.0.0.1:8118
forward-socks5t     /               127.0.0.1:1080 .
```

بعد privoxy را ریستارت کنید (`sudo systemctl restart privoxy`). پس از این پروکسی http روی پورت ۸۱۱۸ در دسترس خواهد بود. برای استفاده از این پروکسی (یا پروکسی socks) در ترمینال، environment variableهای مربوطه را تنظیم کنید:

```
export HTTPS_PROXY=http://127.0.0.1:8118/
export HTTP_PROXY=http://127.0.0.1:8181/
export https_proxy=http://127.0.0.1:8118/
export http_proxy=http://127.0.0.1:8181/
export ALL_PROXY=socks://127.0.0.1:1080/
export all_proxy=socks://127.0.0.1:1080/
```

### [لیست تمام سرور ها](CONFIGS.md)
