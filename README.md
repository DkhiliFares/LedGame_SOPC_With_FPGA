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

<img width="1245" height="630" alt="Qsys System Design" src="https://github.com/user-attachments/assets/0b1c245c-5e0b-4909-adb4-94795364a3ef" />

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

## Project Structure

```
LedGame_SOPC_With_FPGA/
│
├── .qsys_edit/                 # Qsys/Platform Designer project files
│   ├── system.qsys             # Main Qsys system file
│   └── system.qpf              # Quartus project file
│
├── SoPC/                       # System on a Programmable Chip files
│   ├── hardware/               # Hardware description files
│   │   ├── top_level.vhd       # VHDL top-level entity
│   │   └── constraints.sdc     # Timing constraints
│   └── qsys_system/            # Generated Qsys system
│       ├── synthesis/          # Synthesis output
│       └── simulation/         # Simulation files
│
├── db/                         # Quartus database files
│   ├── incremental_db/         # Incremental compilation data
│   └── *.qdb                   # Quartus database files
│
├── output_files/               # Compilation outputs
│   ├── *.sof                   # SRAM Object File (FPGA programming)
│   ├── *.pof                   # Programmer Object File (configuration)
│   └── *.rpt                   # Compilation reports
│
├── simulation/                 # Simulation files
│   └── modelsim/               # ModelSim simulation
│       ├── testbench.v         # Testbench for verification
│       └── wave.do             # Waveform configuration
│
├── software/                   # Nios II software project
│   ├── led_game/               # Main application
│   │   ├── main.c              # Main C source code
│   │   ├── Makefile            # Build configuration
│   │   └── system.h            # System configuration header
│   └── bsp/                    # Board Support Package
│       ├── drivers/            # Hardware drivers
│       └── settings/           # BSP configuration
│
├── docs/                       # Documentation
│   ├── schematics/             # System schematics
│   └── user_manual.md          # User guide
│
├── README.md                   # Project documentation (this file)
└── .gitignore                  # Git ignore rules
```

---

## Key Files Description

### Hardware Files
- **`SoPC/hardware/top_level.vhd`** - Top-level VHDL entity connecting Qsys system
- **`.qsys_edit/system.qsys`** - Platform Designer system configuration
- **`output_files/*.sof`** - FPGA programming file

### Software Files
- **`software/led_game/main.c`** - Main application logic for LED game
- **`software/bsp/`** - Board Support Package for Nios II

### Build & Database
- **`db/`** - Quartus compilation database
- **`incremental_db/`** - Incremental compilation data
- **`output_files/`** - Final output files for programming

---

## Usage

### Hardware Setup:
1. Open `.qsys_edit/system.qpf` in Quartus Prime
2. Compile the project to generate `.sof` file
3. Program the FPGA with the generated `.sof` file

### Software Setup:
1. Open the project in **Eclipse for Nios II**
2. Import the `software/led_game` project
3. Build the project to generate `.elf` file
4. Load the compiled `.elf` file onto the FPGA via **JTAG**

### Running the Game:
1. Turn switches ON/OFF to control LED running light speed
2. Observe the speed change in real-time
3. More switches ON = faster LED chaser speed

---

## Notes

* Minimum delay is limited to keep LEDs visible
* You can modify `BASE_DELAY` in the C code to adjust the default speed
* Supports up to 8 switches, each adding speed to the LED chaser
* Project uses Quartus Prime and Nios II EDS for development

---

## License

This project is open-source and free to use.

---

## Video Demonstration

![LED Game Demo](https://github.com/user-attachments/assets/4a47c151-a65c-418d-be61-a4c80a10be31)

---

## Troubleshooting

- Ensure all Quartus and Nios II tools are properly installed
- Check JTAG connection if programming fails
- Verify switch and LED pin assignments match your FPGA board
- Consult compilation reports in `output_files/` for errors

