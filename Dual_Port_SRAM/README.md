# 256×8 Dual Port SRAM

## Overview
This project implements a **parameterized 256×8 Dual Port SRAM** in Verilog HDL.  
The design supports separate read and write addresses, enabling independent read and write operations within the same memory block.

This project was designed and simulated using **AMD Vivado**.

---

## Features
- Parameterized memory depth (`N = 256` by default)
- 8-bit wide memory cells
- Independent read and write address ports
- Synchronous read and write operations
- Reset functionality to initialize entire memory to zero
- Suitable for memory subsystem and RTL design practice

---

## Memory Specifications
| Parameter | Value |
|-----------|-------|
| Memory Depth | 256 |
| Data Width | 8 bits |
| Address Width | 8 bits |
| Read Port | Enabled via `rd_en` |
| Write Port | Enabled via `wr_en` |
| Reset | Synchronous |

---

## Module Interface

### Inputs
- `clk` → Clock signal  
- `rst` → Reset signal  
- `rd_en` → Read enable  
- `wr_en` → Write enable  
- `wr_addr` → Write address  
- `rd_addr` → Read address  
- `wr_data` → Data input for writing  

### Output
- `rd_data` → Data output for reading  

---

## RTL Design
The design uses a register array to model SRAM memory:

```verilog
reg [7:0] RAM[N-1:0];
```

### Reset Operation
When reset is asserted:
- Entire memory is cleared to zero
- Read data output is cleared

### Write Operation
When `wr_en = 1`:
- `wr_data` is written into memory at `wr_addr`

### Read Operation
When `rd_en = 1`:
- Data from `rd_addr` is loaded into `rd_data`

---

## Functional Behavior
### Write Cycle
```text
wr_en = 1
→ RAM[wr_addr] <= wr_data
```

### Read Cycle
```text
rd_en = 1
→ rd_data <= RAM[rd_addr]
```

---

## Applications
- Cache memory design
- Embedded memory systems
- FIFO internals
- Buffer storage
- Digital system memory modeling

---

## Learning Outcomes
This project demonstrates:
- Parameterized memory design in Verilog
- Register array implementation
- Synchronous read/write operations
- Memory initialization using reset
- RTL modeling of SRAM structures

---

## Tools Used
- Verilog HDL
- AMD Vivado
