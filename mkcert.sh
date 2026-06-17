#!/bin/sh

# MKCERT_EXTRA_SANS: site-specific SANs (internal FQDNs, IPs), set via environment
mkcert $HOSTNAME ${HOSTNAME}.local $MKCERT_EXTRA_SANS 127.0.0.1 localhost

# mkcert names the leaf <HOSTNAME>+<N>.pem where N is the SAN count, which made
# the api command hardcode a brittle +5. Symlink to stable names instead.
cert="$(ls -1 ${HOSTNAME}+*.pem 2>/dev/null | grep -v -- '-key.pem' | head -n1)"
key="$(ls -1 ${HOSTNAME}+*-key.pem 2>/dev/null | head -n1)"
if [ -n "$cert" ] && [ -n "$key" ]; then
    ln -sf "$cert" api.pem
    ln -sf "$key" api-key.pem
fi
