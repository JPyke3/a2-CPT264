# a2-CPT264
This is a set of scripts for Assignment 2 of UNIX system administration and Programming

## Author
All of the contents of this repository are authored by: Jacob Pyke <s3755145@student.rmit.edu.au>

## Relevant Files

- `README.md`
   - link: [README.md](./README.md)
   - This file, it is used to describe the project in a short summary
- `build_kernel`
   - link: [build_kernel](./build_kernel)
   - This file is a bash script that is responsible for taking the Raspberry Pi repo, applying a custom configuration to it, compiling it, and installing it. This script is also responsible for triggering `control_cpu`
- `build_kernel.md`
   - link: [build_kernel.md](./build_kernel.md)
   - This file is the manpage for [build_kernel](./build_kernel)
- `control_cpu`
   - link: [control_cpu](./control_cpu)
   - This file is responsible for taking control of the Green LED on a raspberry Pi, the script will then poll the CPU for it's current usage, and light up the LED according to the current CPU usage
- `control_cpu.md`
   - link: [control_cpu.md](./control_cpu.md)
   - This file is the manpage for [control_cpu](./control_cpu)
- `report.md`
   - link: [report.md](./report.md)
   - This file is the performance report for the Assignment

## Resources Used
 - Official Manpages:
    - Grep
    - Awk
    - Sed
    - Git
    - Man
    - Apt
 - [Kernel Building Raspberry Pi Foundation](https://www.raspberrypi.org/documentation/linux/kernel/building.md)
 - [Raspberry Pi Forum Thread Discussing the LED's](https://www.raspberrypi.org/forums/viewtopic.php?t=12530)
- UNIX System Administration Course Material

