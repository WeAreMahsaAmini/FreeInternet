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

