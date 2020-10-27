FROM alpine:edge

RUN apk --update add \
      bash \
      openssh \
      alpine-sdk \
      gdb \
      libmicrohttpd \
      libmicrohttpd-dev \
      mosquitto \
      mosquitto-dev \
      openssl \
      openssl-dev \
   && echo "#include <unistd.h>" > /usr/include/sys/unistd.h \    
   && rm -rf /var/cache/apk/*

COPY src/ .

EXPOSE 22

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
