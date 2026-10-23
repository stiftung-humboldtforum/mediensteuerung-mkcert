#!/bin/sh

# MKCERT_EXTRA_SANS: site-specific SANs (internal FQDNs, IPs), set via environment
mkcert $HOSTNAME ${HOSTNAME}.local $MKCERT_EXTRA_SANS 127.0.0.1 localhost
