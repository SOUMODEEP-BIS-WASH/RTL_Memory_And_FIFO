# RTL Memory and FIFO

## Overview
This repository contains a collection of **RTL design projects focused on memory architectures and FIFO implementations** using **Verilog HDL**. The projects cover fundamental to advanced concepts in digital design, including SRAM design, synchronous FIFOs, and asynchronous FIFOs with clock domain crossing (CDC) handling.

These projects were developed to strengthen understanding of:
- Memory design in RTL
- FIFO architectures
- Pointer management
- Full/Empty detection logic
- Clock Domain Crossing (CDC)
- Gray code synchronization
- High-speed digital system design

All designs were implemented and tested using **AMD Vivado**.

---

## Repository Structure

### Project 1: 256×8 Dual Port SRAM
Implementation of a parameterized dual-port SRAM supporting independent read and write addressing with synchronous operation.

**Key Concepts:**
- SRAM architecture
- Dual-port memory
- Read/Write control
- Parameterized design

---

### Project 2: Synchronous FIFO
Implementation of an 8-bit synchronous FIFO using a single clock domain with circular buffer logic and full/empty detection.

**Key Concepts:**
- FIFO design
- Circular buffer
- Pointer management
- Full/Empty flag generation

---

### Project 3: Asynchronous FIFO
Implementation of an asynchronous FIFO supporting independent read and write clock domains using Gray code pointer synchronization.

**Key Concepts:**
- Clock Domain Crossing (CDC)
- Gray code pointers
- Pointer synchronization
- Asynchronous FIFO design

---

## Skills Demonstrated
- RTL Design using Verilog HDL
- Memory subsystem design
- FIFO architecture implementation
- Parameterized module development
- Synchronization techniques
- CDC-safe digital design
- FPGA-oriented design methodology

---

## Tools Used
- Verilog HDL
- AMD Vivado

---

## Applications
These designs are commonly used in:
- Embedded systems
- FPGA/ASIC design
- Processor memory subsystems
- Communication interfaces
- High-speed digital systems
- Data buffering and streaming systems

---

## Learning Outcomes
This repository provides practical experience in designing and understanding:
- Memory blocks
- FIFO structures
- Synchronous vs Asynchronous data transfer
- Reliable data communication across clock domains

---
