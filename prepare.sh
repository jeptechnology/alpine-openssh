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

# symbolic link to allow volume to led's to be shared
ln -s /sys/devices/soc0/pwm_leds/leds/hub\:led\:red/ ~/led/red
ln -s /sys/devices/soc0/pwm_leds/leds/hub\:led\:green/ ~/led/green
ln -s /sys/devices/soc0/pwm_leds/leds/hub\:led\:blue/ ~/led/blue