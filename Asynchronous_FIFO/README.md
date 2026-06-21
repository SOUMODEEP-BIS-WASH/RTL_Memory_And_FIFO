# Asynchronous FIFO

## Overview
This project implements an **8-bit Asynchronous FIFO (First-In First-Out)** in Verilog HDL.  
Unlike synchronous FIFOs, this design supports **independent read and write clock domains**, enabling safe data transfer between two modules operating at different clock frequencies.

The design uses:
- Separate read and write pointers
- Gray code pointer conversion
- Two-stage synchronizers for clock domain crossing (CDC)
- Full and Empty detection logic

This is a standard RTL design used extensively in clock-domain crossing applications.

---

## Features
- Independent read and write clock domains
- Safe clock domain crossing using synchronizers
- Gray code pointer synchronization
- Full and Empty flag detection
- Parameterized FIFO depth
- Circular buffer architecture

---

## FIFO Specifications

| Parameter | Value |
|-----------|-------|
| Data Width | 8 bits |
| Default Depth | 16 |
| Pointer Width | 5 bits (for N=4) |
| Read Clock | Independent |
| Write Clock | Independent |
| FIFO Type | Asynchronous |

---

## Module Hierarchy

```text
async_fifo_top
│
├── fifo_mem
├── wr_ptr_hndlr
├── rd_ptr_hndlr
├── syncr (write pointer synchronizer)
└── syncr (read pointer synchronizer)
```

---

## Module Description

---

### 1. `fifo_mem`
Responsible for storing FIFO data.

#### Function:
- Writes data using write clock
- Reads data using read pointer

```verilog
reg [7:0] mem[D-1:0];
```

---

### 2. `wr_ptr_hndlr`
Handles write-side pointer management.

#### Responsibilities:
- Maintain binary write pointer
- Generate Gray-coded write pointer
- Detect FIFO full condition

---

### 3. `rd_ptr_hndlr`
Handles read-side pointer management.

#### Responsibilities:
- Maintain binary read pointer
- Generate Gray-coded read pointer
- Detect FIFO empty condition

---

### 4. `syncr`
Two-stage synchronizer used for safe pointer transfer between clock domains.

#### Purpose:
Reduces metastability risk during CDC.

```text
Clock Domain Crossing:
Write → Read
Read → Write
```

---

## Internal Architecture

### Binary Pointer
Used for addressing memory locations.

### Gray Code Pointer
Used for safe synchronization across clock domains.

Gray code ensures only one bit changes at a time:

```verilog
gray = binary ^ (binary >> 1)
```

This minimizes synchronization errors.

---

## Functional Behavior

### Write Operation
When:
```text
w_en = 1 and full = 0
```

FIFO writes data into memory:

```text
mem[w_ptr] ← Din
```

Write pointer advances.

---

### Read Operation
When:
```text
r_en = 1 and empty = 0
```

FIFO outputs data:

```text
Dout ← mem[r_ptr]
```

Read pointer advances.

---

## Full Detection
FIFO is full when next write pointer reaches synchronized read pointer:

```verilog
g_wr_ptr_next == {~g_rd_ptr_sync[N:N-1], g_rd_ptr_sync[N-2:0]}
```

---

## Empty Detection
FIFO is empty when read pointer equals synchronized write pointer:

```verilog
g_rd_ptr_next == g_wr_ptr_sync
```

---

## Applications
- Clock domain crossing (CDC)
- Network routers
- UART communication
- DSP systems
- High-speed pipelines
- FPGA/ASIC interconnects

---

## Learning Outcomes
This project demonstrates:
- Asynchronous FIFO architecture
- Clock domain crossing techniques
- Gray code implementation
- Pointer synchronization
- Full/Empty detection logic
- Reliable multi-clock RTL design

---

## Tools Used
- Verilog HDL
- AMD Vivado
