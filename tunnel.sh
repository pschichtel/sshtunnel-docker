#!/usr/bin/env sh

ssh \
    -i "${PRIVATE_KEY_FILE?no private key}" \
    -oStrictHostKeyChecking=no \
    -N \
    -L "0.0.0.0:${1?no local port}:${2?no target host}:${3?no target port}" \
    "${4?no ssh target}"

