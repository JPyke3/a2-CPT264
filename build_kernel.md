# NAME 
build_kernel - Bash Script for Compiling the RaspberryPiOS Kernel
# SYNOPSIS
build_kernel
# DESCRIPTION
build_kernel serves two purposes, first it will trigger control_cpu(1). Then it will automatically compile the RaspberryPiOS Kernel by checking out the official latest repository. The script will then apply a custom configuration to remove Camera support. Finally it will apply a custom kernel version, in order to distinguish it from the original kernel.
# OPTIONS
build_kerenl does not take any options.
# SEE ALSO
control_cpu(1)
# BUGS
No known bugs.
# AUTHOR
Jacob Pyke (s3755145@student.rmit.edu.au)