FROM hashicorp/vault

RUN apk add openssl

COPY copy /copy

ENTRYPOINT ["/copy/entrypoint.sh"]

