#!/usr/bin/python
import sys
import json
import base64
import urllib.parse

if len(sys.argv) < 2:
    print ("Please provid android link as input")
    exit (1)

f = open(sys.argv[1], "r")
data = json.load(f)
f.close()

def android_link (data, force_port=True):
    password = data["method"] + ":" + data["password"]
    pass_bytes = password.encode('ascii')
    base64_bytes = base64.b64encode(pass_bytes)
    pass_base64 = base64_bytes.decode('ascii')

    port = 443 if force_port else data["server_port"]

    link = "ss://" + pass_base64.rstrip("=") + "@" + data["server"] + ":" + str(port) + "?" + "plugin=" + data["plugin"] + urllib.parse.quote(";"+ data["plugin_opts"])
    print (f"Android: {link}")

def ios_link (data, force_port=True):
    port = 443 if force_port else data["server_port"]
    message = data["method"] + ":" + data["password"] + "@" + data["server"] + ":" + str(port)
    message_bytes = message.encode('ascii')
    base64_bytes = base64.b64encode(message_bytes)
    base64_message = base64_bytes.decode('ascii')

    plugin_opts = data["plugin_opts"].split(";")
    path = "/"
    host = data["server"]
    for opt in plugin_opts:
        if "host" in opt:
            host = opt.split("=")[1]
        if "path" in opt:
            path = opt.split("=")[1]


    plugin_opts_output = '{"path":"\%s","mux":true,"tfo":true,"host":"%s","mode":"websocket","tls":true}' % (path, host)

    message_bytes = plugin_opts_output.encode('ascii')
    base64_bytes = base64.b64encode(message_bytes)
    base64_opts = base64_bytes.decode('ascii')

    link = "ss://" + base64_message.rstrip("=") + "?tfo=1&v2ray-plugin=" + base64_opts.rstrip("=")

    print (f"IOS: {link}")

android_link(data)
ios_link(data)
