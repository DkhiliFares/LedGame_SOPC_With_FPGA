# FPGA LED Game Controlled by Switches

## Overview

This project demonstrates a **dynamic LED game** implemented on an FPGA (using Nios II processor) where the speed of a LED "running light" increases according to the number of switches turned ON. The project uses **Qsys/Platform Designer**, **VHDL top-level integration**, and a **C custom program** running on the Nios II processor.

---

## Features

* Reads the state of 8 physical switches on the FPGA board.
* Displays a **running light (LED chaser)** on 8 LEDs.
* The **toggle speed increases with the number of switches ON**.
* Fully implemented using **Nios II processor**, **PIO peripherals**, and **C code**.

---

## Hardware Implementation

* **FPGA Board:** [Specify your board, e.g., DE10-Lite, DE10-Nano, etc.]
* **Peripherals:**

  * 8 Switches (input)
  * 8 LEDs (output)
* **Qsys/Platform Designer Setup:**

  * Nios II Processor
  * On-chip memory
  * PIO for switches
  * PIO for LEDs
  * JTAG UART for debugging

![Qsys Implementation](./758b0bf0-02fb-405d-a859-83a222d049d8.png)

---

## Software Implementation

* **Language:** C
* **IDE:** Eclipse for Nios II
* **Libraries:** `altera_avalon_pio_regs.h`, `alt_types.h`

### Main Features

* Reads the switch states using `IORD_ALTERA_AVALON_PIO_DATA`.
* Counts active switches using `__builtin_popcount`.
* Adjusts LED running light speed according to the number of switches ON.
* Uses `IOWR_ALTERA_AVALON_PIO_DATA` to drive LEDs.

### Example Code Snippet

```c
sw = IORD_ALTERA_AVALON_PIO_DATA(SWITCHES_BASE) & 0xFF;
int speed_factor = __builtin_popcount(sw);
int delay_us = (speed_factor > 0) ? (500000 / (3*speed_factor)) : 500000;
IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE, 1 << led_index);
led_index = (led_index + 1) % 8;
usleep(delay_us);
```

---

## How It Works

1. **Read Switches:** The 8 switches are read as an 8-bit vector.
2. **Calculate Speed:** The number of active switches determines the speed of the LED chaser.
3. **Update LEDs:** A single LED is turned ON at a time, creating a running light effect.
4. **Repeat:** The loop continues infinitely, updating LEDs in real time as switches change.

---

## Project Files

The GitHub repository includes:

* `software/` – Nios II Eclipse project with C code.
* `hardware/` – Qsys/Platform Designer project and generated HDL.
* `README.md` – Project description and usage.
* `video/` – Demonstration video (to be added).

---

## Usage

1. Open the project in **Eclipse for Nios II**.
2. Compile the Nios II software project.
3. Load the compiled `.elf` file onto the FPGA via **JTAG**.
4. Turn the switches ON/OFF to observe the **LED running light speed change**.

---

## Notes

* Minimum delay is limited to keep LEDs visible.
* You can modify `BASE_DELAY` in the C code to adjust the default speed.
* Supports up to 8 switches, each adding speed to the LED chaser.

---

## License

This project is open-source and free to use.

---

## Video Demonstration

A video showing the LED running light game in action will be included in the `video/` folder.

---

This README gives a clear **overview, instructions, and technical details**, perfect for GitHub.

---

I can also **add a Markdown section to embed the uploaded image** directly if you want it displayed on GitHub like:

```markdown
![Qsys Implementation](758b0bf0-02fb-405d-a859-83a222d049d8.png)
```

Do you want me to do that?
