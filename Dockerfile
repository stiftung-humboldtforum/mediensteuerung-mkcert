FROM alpine:3.23

RUN apk add wget
# Pin + verify the mkcert binary. SHA256 was computed and verified independently
# (2026-06-26) — FiloSottile/mkcert publishes no official checksums file. The build
# fails on any mismatch instead of running an unverified executable in the TLS bootstrap.
RUN MKCERT_VERSION=v1.4.4 \
	&& MKCERT_SHA256=6d31c65b03972c6dc4a14ab429f2928300518b26503f58723e532d1b0a3bbb52 \
	&& wget -q "https://github.com/FiloSottile/mkcert/releases/download/${MKCERT_VERSION}/mkcert-${MKCERT_VERSION}-linux-amd64" -O /bin/mkcert \
	&& echo "${MKCERT_SHA256}  /bin/mkcert" | sha256sum -c - \
	&& chmod +x /bin/mkcert

COPY mkcert.sh /mkcert.sh
RUN chmod +x /mkcert.sh

WORKDIR /root
