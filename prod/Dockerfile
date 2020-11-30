FROM alpine:edge

RUN apk --update add \
      libstdc++ \
      libmicrohttpd \
      mosquitto \
      openssl \
   && rm -rf /var/cache/apk/*

RUN mkdir -p /home/wiser

ADD WiserHomeLinux /usr/bin

WORKDIR /home/wiser
ENTRYPOINT ["/usr/bin/WiserHomeLinux"]
 
