#!/bin/bash

ECHO="/bin/echo"
TOP="/usr/bin/top"
GREP="/bin/grep"
AWK="/usr/bin/awk"

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
    USAGE="$TOP -bn1 | $GREP 'Cpu(s)' | $AWK '{print $2/100}'"
}

initialize
while true
do
    poll_cpu
    turn_on_led
    sleep $USAGE
    turn_off_led
done

