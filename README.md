virtual-sensor-asm
==================

VirtualSensor Asembler code(emu8086). This program will use virtual device created and packed into exe file from project https://github.com/cody92/virtual-sensor. This program will write Oxigen sensor value to port 2, Noise sensor value to port 3, and Dust sensor value to port 4. Values for sensor have 1 byte length. Assembler code will work with this three ports.

TO DO
-update sensor values only if values gets differs from old values