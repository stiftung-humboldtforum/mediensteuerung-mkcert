FROM alpine

RUN apk add wget
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 -O /bin/mkcert
RUN chmod +x /bin/mkcert

WORKDIR /root
