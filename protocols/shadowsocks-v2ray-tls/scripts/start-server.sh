#!/usr/bin/env sh

set -xe

CERT_PATH="${CERT_DIR}/${DOMAIN}.cer"
KEY_PATH="${CERT_DIR}/${DOMAIN}.key"
URL_PATH="${URL_PATH:-/${V2RAY_PATH}}"

if [ ! -f "${CERT_PATH}" ] || [ ! -f "${KEY_PATH}" ]; then
    echo "No cert or key file exist"
    exit 0
fi

ARGS="--plugin v2ray-plugin --plugin-opts server;tls;fast-open;host=$DOMAIN;path=${URL_PATH};cert=$CERT_PATH;key=$KEY_PATH -u"

android_url () {
    encoded_M_P=$(echo "$METHOD:$PASSWORD" | base64);
    encoded_M_P=$(echo "$encoded_M_P" | sed -e "s/=//g")
    android_plugin_opts=$(printf %s ";tls;host=$DOMAIN;path=${URL_PATH};loglevel=none"|jq -sRr @uri)
    ANDROID_URL="ss://$encoded_M_P@$DOMAIN:443?plugin=v2ray-plugin$android_plugin_opts"
}
ios_url () {
    ios_encoded_M_P=$(echo "$METHOD:$PASSWORD@$DOMAIN:443" | base64);
    ios_encoded_M_P=$(echo "$ios_encoded_M_P" | sed -e "s/=//g")
    ios_plugin_opts=$(echo "{\"path\":\"\\$URL_PATH\",\"mux\":true,\"tfo\":true,\"host\":\"$DOMAIN\",\"mode\":\"websocket\",\"tls\":true}" | base64 -w 0);
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
    -p $SERVER_PORT \
    -k $PASSWORD \
    -m $METHOD \
    -t $TIMEOUT \
    -d $DNS_ADDRS \
    --reuse-port \
    --no-delay \
    $ARGS

