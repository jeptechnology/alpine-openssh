#!/bin/sh

SSHSERVER_PORT=2222
GDBSERVER_PORT=2159
HTTP_INTERNAL_PORT=8080
EFR32UART_DEVICE_NAME=/dev/ttyEFR32

docker run -d \
   -p ${SSHSERVER_PORT}:22 \
   -p ${GDBSERVER_PORT}:${GDBSERVER_PORT} \
   -p 80:${HTTP_INTERNAL_PORT} \
   --device /dev/ttymxc2:${EFR32UART_DEVICE_NAME} \
   wiser/develop:v1.0 \
   fio:fio:1000:1000