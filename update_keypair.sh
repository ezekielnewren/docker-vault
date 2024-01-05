#!/bin/bash

ADDR=$1
. copy/validate.sh

metal_cloud hsm --export-vault | docker run --rm -i -v $VOLUME_NAME:/vault alpine ash -c "cat > /vault/vault.pem"

