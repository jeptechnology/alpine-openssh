#!/bin/sh

echo "Running WiserDebugEngine in Host networking mode"

EFR32UART_DEVICE_NAME=/dev/ttyEFR32

docker run -d \
   --name WiserDebugEngine \
   --rm \
   -v /home/fio/led:/led \
   -v /home/fio/efr32io:/efr32io \
   -v /sys/class/gpio/gpio119:/gpioSetupButton \
   -v /tmp:/tmp \
   --device /dev/ttymxc2:${EFR32UART_DEVICE_NAME} \
   wiser/develop:v1.0 \
   fio:fio:1000:1000
