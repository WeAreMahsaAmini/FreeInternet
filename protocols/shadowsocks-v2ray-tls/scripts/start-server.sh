#!/usr/bin/env sh

set -xe

URL_PATH="${URL_PATH:-/${V2RAY_PATH}}"

ARGS="--plugin v2ray-plugin --plugin-opts server;fast-open;path=${URL_PATH} -u"

android_url () {
    encoded_M_P=$(echo -n "$METHOD:$PASSWORD" | base64);
    encoded_M_P=$(echo "$encoded_M_P" | sed -e "s/=//g")
    ANDROID_URL="ss://$encoded_M_P@$DOMAIN:443?plugin=v2ray-plugin%3Bpath%3D%2F${V2RAY_PATH}%3Bmux%3D16%3Bloglevel%3Dnone%3Bhost%3D$DOMAIN%3Btls"
}
ios_url () {
    ios_encoded_M_P=$(echo -n "$METHOD:$PASSWORD@$DOMAIN:443" | base64);
    ios_encoded_M_P=$(echo "$ios_encoded_M_P" | sed -e "s/=//g")
    ios_plugin_opts=$(echo "{\"path\":\"\\$URL_PATH\",\"mux\":true,\"tfo\":true,\"host\":\"$DOMAIN\",\"mode\":\"websocket\",\"tls\":true,\"allowInsecure\":true}" | base64 -w 0);
    ios_plugin_opts=$(echo "$ios_plugin_opts" | sed -e "s/=//g")
    IOS_URL="ss://$ios_encoded_M_P?tfo=1&v2ray-plugin=$ios_plugin_opts"
}

android_url
ios_url

echo
echo "ANDROID_URL: $ANDROID_URL"
echo
echo "IOS_URL: $IOS_URL"
echo

exec ss-server \
    -s 0.0.0.0 \
    -p 8080 \
    -k $PASSWORD \
    -m $METHOD \
    -t $TIMEOUT \
    -d $DNS_ADDRS \
    --reuse-port \
    --no-delay \
    $ARGS

