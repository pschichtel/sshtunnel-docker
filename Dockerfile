FROM alpine:3.15

RUN apk add --update --no-cache openssh autossh

COPY tunnel.sh /tunnel.sh

USER 65534:65534

ENTRYPOINT [ "/tunnel.sh" ]

