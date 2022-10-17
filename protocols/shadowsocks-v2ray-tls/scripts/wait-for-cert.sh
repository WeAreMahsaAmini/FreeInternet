#!/bin/sh

# this script is expected to be used as an entrypoint for the nginx
# container

CERT_FILE=/etc/nginx/cert/${DOMAIN}.cer

while [ ! -f $CERT_FILE ]; do
    echo "Waiting for certificate $CERT_FILE before starting nginx..."
    sleep 10
done

exec "$@"

