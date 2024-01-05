#!/bin/ash

ADDR=$1
. /copy/validate.sh

cd /vault
openssl ecparam -name prime256v1 -genkey -noout -out vault.key
openssl req -new -nodes -key vault.key -x509 -days 1 -subj "/CN=$FQDN" -out vault.cer
cat vault.key vault.cer > vault.pem
rm vault.key vault.cer

mkdir -p /vault/config
cat /copy/config.hcl | sed -e "s/ADDR_API/$ADDR/g" -e "s/ADDR_CLUSTER/$FQDN:$(($PORT+1))/g" -e "s/PORT/$PORT/g" > /vault/config/config.hcl

chown $(stat -c "%u" .):$(stat -c "%g" .) -R /vault

echo
ls -alF /vault
echo
echo "/vault/config/config.hcl"
cat /vault/config/config.hcl

