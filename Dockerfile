FROM alpine:3.15

RUN apk add --update --no-cache openssh

COPY tunnel.sh /tunnel.sh

ENTRYPOINT [ "/tunnel.sh" ]

