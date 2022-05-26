#!/usr/bin/env sh

key_file=""
if [ -n "${PRIVATE_KEY_FILE:-}" ] && [ -r "${PRIVATE_KEY_FILE}" ]
then
    key_file="${PRIVATE_KEY_FILE}"
fi

if [ -n "${PRIVATE_KEY}" ]
then
    key_file="$(mktemp)"
    echo "${PRIVATE_KEY}" > "$key_file"
fi

if [ -z "$key_file" ]
then
    echo "No private key supplied!" >&2
    exit 1
fi

echo "Using private key: $key_file"

ssh \
    -i "$key_file" \
    -oPreferredAuthentications=publickey \
    -oPasswordAuthentication=no \
    -oBatchMode=yes \
    -oStrictHostKeyChecking=no \
    -oServerAliveInterval=15 \
    -oExitOnForwardFailure=yes \
    -oTCPKeepAlive=yes \
    -N \
    -L "0.0.0.0:${1?no local port}:${2?no target host}:${3?no target port}" \
    ${SSH_EXTRA_OPTIONS:-} \
    "${4?no ssh target}"

