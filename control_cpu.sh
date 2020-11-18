#!/bin/bash

ECHO="/bin/echo"

initialize () {
    # Turn off the LED Triggering from Disk Activity
    $ECHO none > /sys/class/leds/led0/trigger
}

turn_on_led () {
    $ECHO 1 > /sys/class/leds/led0/brightness
}

turn_off_led () {
    $ECHO 0 > /sys/class/leds/led0/brightness
}

poll_cpu () {
    grep "cpu" /proc/stat | $ECHO $1 
}

initialize
poll_cpu
