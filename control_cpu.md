# NAME 
control_cpu - Script for polling the cpu, and enabling the green light on a Raspberry Pi
# SYNOPSIS
control_cpu
# DESCRIPTION
control_cpu is responsible for taking control of the green LED on a Raspberry Pi, once the script has taken control of the green light the script will then poll the CPU usage of the Raspberry Pi across all cores, the script will then blink the status light for the Raspberry Pi's CPU usage in relation to a Second. For e.g, If the cpu is at 50%, then the light will be enabled for half of a second.
# OPTIONS
control_cpu does not take any options.
# SEE ALSO
build_kernel(1)
# BUGS
No known bugs.
# AUTHOR
Jacob Pyke (s3755145@student.rmit.edu.au)