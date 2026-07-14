# micro-x1
----------------------------------
## An open-source microcontroller built around the RP2350 Arm variant
1. What is the RP2350?
The RP2350 is a microcontroller chip manufactured by Raspberry Pi. It has an Arm variant and a RISC-V variant. The Arm variant has:
* Dual Arm Cortex-M33 cores with hardware single-precision floating point and DSP instructions at 150MHz.
* Comprehensive security architecture, built around Arm TrustZone for Cortex-M.
* Second-generation PIO subsystem

For more information, see [the datasheet.](https://pip-assets.raspberrypi.com/categories/1214-rp2350/documents/RP-008373-DS-2-rp2350-datasheet.pdf)
2. Isn't the RP2350 already a microcontroller?

It is, but it has certain things it can't exactly do on its own.
For example, the Pico 2 has GPIO (General Purpose Input Output) pin support while the RP2350 can just handle it, but you physically cannot put pins into the microcontroller without a hassle and the determination to break a microcontroller./
3. Why are microcontrollers useful?

They are cheaper than powerful processors like the newest generation, highest tier processor, and they are just enough power to run stuff like trackpads, keyboards, etc. They also take up less power than the amazing processors I previously mentioned, saving massive amounts on electricity bills.
I personally don't recommend them for daily use since microcontrollers like the RP2350 would struggle with doing basic tasks like running Chrome and reading an eBook at the same time. 
(update #1)
