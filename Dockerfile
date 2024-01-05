ARG VAULT_VERSION=latest
FROM hashicorp/vault:$VAULT_VERSION

RUN apk add openssl

COPY copy /copy

ENTRYPOINT ["/copy/entrypoint.sh"]

