#!/bin/bash
#
# GPIO for setup button is 119 
# 
# LED's are located at: /sys/devices/soc0/pwm_leds/leds/*
#
# Run this script as root to prepare sysfs for WiserHome docker app
#

if [ "$EUID" -ne 0 ]
  then echo "Please run as root. i.e. sudo ./prepare.sh"
  exit
fi

echo "Preparing gpio 119 for button input..."
echo 119 > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio119/direction
echo "both" > /sys/class/gpio/gpio119/edge

echo "Preparing gpio 34 for zigbee reset line..."
echo 34 > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio34/direction
EFR32_GPIO_PATH=/home/fio/efr32io
mkdir -p ${EFR32_GPIO_PATH}
chmod 755 ${EFR32_GPIO_PATH}
mount --bind /sys/devices/soc0/soc/2000000.aips-bus/20a0000.gpio/gpiochip1/gpio/gpio34 ${EFR32_GPIO_PATH}

echo "Preparing LEDs for output..."
# permit user operations on LED brightness
chmod 777 /sys/devices/soc0/pwm_leds/leds/hub\:led\:red/brightness
chmod 777 /sys/devices/soc0/pwm_leds/leds/hub\:led\:green/brightness
chmod 777 /sys/devices/soc0/pwm_leds/leds/hub\:led\:blue/brightness

# mount led's in a way that can be shared to docker containers
GREEN_LED_PATH=/home/fio/led/green
mkdir -p ${GREEN_LED_PATH}
chmod 755 ${GREEN_LED_PATH}
sudo mount --bind /sys/devices/soc0/pwm_leds/leds/hub\:led\:green ${GREEN_LED_PATH}

RED_LED_PATH=/home/fio/led/red
mkdir -p ${RED_LED_PATH}
chmod 755 ${RED_LED_PATH}
sudo mount --bind /sys/devices/soc0/pwm_leds/leds/hub\:led\:red ${RED_LED_PATH}

BLUE_LED_PATH=/home/fio/led/blue
mkdir -p ${BLUE_LED_PATH}
chmod 755 ${BLUE_LED_PATH}
sudo mount --bind /sys/devices/soc0/pwm_leds/leds/hub\:led\:blue ${BLUE_LED_PATH}

