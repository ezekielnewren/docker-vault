#!/bin/bash

ADDR=$1
. copy/validate.sh

if [[ -n "$(docker ps -a -q -f name=$CONTAINER_NAME)" ]]; then
    echo "a vault container for $FQDN already exists"
    exit 1
fi
if [[ ! -n "$(docker volume ls -q -f name=$VOLUME_NAME)" ]]; then
    echo "preparing volume for $FQDN"
    docker build --no-cache --network=host -t vault_build .
    docker run --rm -it -v $VOLUME_NAME:/vault vault_build $ADDR
else
    echo "a volume already exists for $FQDN"
fi

docker run --name $CONTAINER_NAME -itd --cap-add=IPC_LOCK --restart=always -p $PORT:$PORT \
-v $VOLUME_NAME:/vault hashicorp/vault vault server -config /vault/config/config.hcl

