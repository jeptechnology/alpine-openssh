#!/bin/bash
#
# GPIO for setup button is 119 
# 
# LED's are located at: /sys/devices/soc0/pwm_leds/leds/hub\:led\:red/
#
# Run this script as root to prepare sysfs for WiserHome docker app
#

if [ "$EUID" -ne 0 ]
  then echo "Please run as root. i.e. sudo ./prepare.sh"
  exit
fi

echo "Preparing gpio 119 for button input..."

# Set up gpio 119 for button input
echo 119 > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio119/direction
echo "both" > /sys/class/gpio/gpio119/edge

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

