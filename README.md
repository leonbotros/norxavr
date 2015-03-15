# norxavr
NORXAVR
==============
This is an optimized version of NORX, an authenticated encryption algorithm (see https://norx.io/), for AVR microcontrollers. This implementation is specifically optimized for the ATmega family.

How to compile & run on Atmega2560 for Debian/Ubuntu
--------------

- To clone the repository:

```$ git clone https://github.com/leonbotros/norxavr.git```

- The packages avr-gcc, avr-libc, avrdude and binutils-avr are required:

```$ sudo apt-get install gcc-avr avr-libc avrdude binutils-avr```

- Make sure the development board is plugged in through USB and seen by the OS as /dev/ttyACM0. Otherwise either unplug the other device(s) or change the DEVICE variable in the makefile. You can list devices by running the command:

```$ ls -l /dev/ttyACM*```

- Access to this file is restricted to users in the group dialout. You can add a user to this group by running:

```$ sudo useradd -G dialout <user>```

- Go to the directory norxavr3241 or norxref3241, depending on which you want to run. To recreate the encryption results listed on page 55 (NORX32-4-1) of the NORX specification (https://norx.io/data/norx.pdf), run:

```$ make norxtest```

- To run a speedtest, run:

```$ make speedtest```

The number of rounds can be changed to (6 for NORX32-6-1, for example) by editing the variable NORX_R in norx/norx_config.h.
