FROM alpine:3.14

RUN apk add --update --no-cache openssh

COPY tunnel.sh /tunnel.sh

ENV PRIVATE_KEY_FILE="/run/secrets/private_key"

ENTRYPOINT [ "/tunnel.sh" ]

