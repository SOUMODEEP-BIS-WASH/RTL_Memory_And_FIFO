# Project 2: Synchronous FIFO

## Overview
This project implements an **8-bit Synchronous FIFO (First-In First-Out)** buffer in Verilog HDL.  
The FIFO operates using a single clock for both read and write operations, making it suitable for buffering data between modules operating in the same clock domain.

The design uses internal memory with separate read and write pointers along with **full** and **empty** status detection logic.

---

## Features
- 8-bit data width
- 256 memory locations
- Single clock domain (Synchronous FIFO)
- Independent read and write enable signals
- Full and Empty flag generation
- Circular buffer implementation using pointers
- Reset support for initialization

---

## FIFO Specifications

| Parameter | Value |
|-----------|-------|
| FIFO Depth | 256 |
| Data Width | 8 bits |
| Address Width | 8 bits |
| Pointer Width | 9 bits |
| Read Type | Synchronous |
| Write Type | Synchronous |

---

## Module Interface

### Inputs
- `clk` → System clock  
- `rst` → Reset signal  
- `din[7:0]` → Input data  
- `wr_en` → Write enable  
- `rd_en` → Read enable  

### Outputs
- `dout[7:0]` → Output data  
- `full` → FIFO full flag  
- `empty` → FIFO empty flag  

---

## Internal Architecture

### Memory Array
```verilog
reg [7:0] mem[255:0];
```

Stores FIFO data.

### Write Pointer
```verilog
reg [8:0] wr_addr;
```

Tracks next write location.

### Read Pointer
```verilog
reg [8:0] rd_addr;
```

Tracks next read location.

The extra MSB bit is used for full/empty detection.

---

## Functional Behavior

### Reset Operation
When reset is asserted:
- Read pointer resets to 0
- Write pointer resets to 0
- Output data resets to 0
- FIFO memory clears

---

### Write Operation
When:
```text
wr_en = 1 and full = 0
```

Data is written into FIFO:

```text
mem[wr_addr] ← din
wr_addr ← wr_addr + 1
```

---

### Read Operation
When:
```text
rd_en = 1 and empty = 0
```

Data is read from FIFO:

```text
dout ← mem[rd_addr]
rd_addr ← rd_addr + 1
```

---

## Status Flags

### Empty Condition
FIFO is empty when:
```verilog
wr_addr == rd_addr
```

---

### Full Condition
FIFO is full when:
```verilog
(wr_addr[8] != rd_addr[8]) &&
(wr_addr[7:0] == rd_addr[7:0])
```

This indicates write pointer has wrapped around and caught up with read pointer.

---

## Applications
- Data buffering
- Producer-consumer systems
- Communication interfaces
- Pipeline buffering
- Streaming systems

---

## Learning Outcomes
This project demonstrates:
- FIFO architecture in RTL
- Circular buffer implementation
- Pointer-based memory management
- Full and empty flag generation
- Synchronous read/write design

---

## Tools Used
- Verilog HDL
- AMD Vivado
