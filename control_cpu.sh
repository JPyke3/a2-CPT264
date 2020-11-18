#!/bin/bash

# Binary Variables
ECHO="/bin/echo"
TOP="/usr/bin/top"
GREP="/bin/grep"
AWK="/usr/bin/awk"

# Used to stop the LED Triggering
initialize () {
    # Turn off the LED Triggering from Disk Activity
    sudo su "${ECHO} none > /sys/class/leds/led0/trigger"
}

# Used to turn on the LED
turn_on_led () {
    sudo su "${ECHO} 1 > /sys/class/leds/led0/brightness"
}

# Used to turn off the LED
turn_off_led () {
    sudo su "${ECHO} 0 > /sys/class/leds/led0/brightness"
}

# Polls the CPU and writes the usage to $USAGE and the remainder of $USAGE to $NONUSAGE
poll_cpu () {
    USAGE=`${TOP} -bn1 | ${GREP} 'Cpu(s)' | ${AWK} '{printf "%.0f\n", \$2}' | ${AWK} '{ print $1 / 100}'`
    NONUSAGE=`${TOP} -bn1 | ${GREP} 'Cpu(s)' | ${AWK} '{printf "%.0f\n", 100 - \$2}' | ${AWK} '{ print $1 / 100}'`
}

initialize
turn_off_led
while true
do
    poll_cpu
    turn_on_led
    sleep $USAGE
    turn_off_led
    sleep $NONUSAGE
done


