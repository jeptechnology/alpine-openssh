#!/bin/sh

HTTP_INTERNAL_PORT=8080
TELNET_PORT=8023
EFR32UART_DEVICE_NAME=/dev/ttyEFR32

echo "Running WiserHome for Linux in Bridge networking mode"

docker run -it \
   --name WiserLinux \
   --rm \
   -v /home/fio/led:/led \
   -v /home/fio/efr32io:/efr32io \
   -v /sys/class/gpio/gpio119:/gpioSetupButton \
   -v /tmp:/tmp \
   -p 80:${HTTP_INTERNAL_PORT} \
   -p 23:${TELNET_PORT} \
   --device /dev/ttymxc2:${EFR32UART_DEVICE_NAME} \
   wiser/run:1.0 \
   /tmp/WiserLinux -w 8080 -z /dev/ttyEFR32 -c 8023

